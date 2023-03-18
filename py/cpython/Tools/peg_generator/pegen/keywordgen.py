"""Generate Lib/keyword.py from the Grammar and Tokens files using pgen"""

import argparse

from .build import build_parser, generate_token_definitions
from .c_generator import CParserGenerator

TEMPLATE = r'''
"""Keywords (from "Grammar/python.gram")

This file is automatically generated; please don't muck it up!

To update the symbols in this file, 'cd' to the top directory of
the python source tree and run:

    PYTHONPATH=Tools/peg_generator python3 -m pegen.keywordgen \
        Grammar/python.gram \
        Grammar/Tokens \
        Lib/keyword.py

Alternatively, you can run 'make regen-keyword'.
"""

__all__ = ["iskeyword", "issoftkeyword", "kwlist", "softkwlist"]

kwlist = [
{keywords}
]

softkwlist = [
{soft_keywords}
]

iskeyword = frozenset(kwlist).__contains__
issoftkeyword = frozenset(softkwlist).__contains__
'''.lstrip()

EXTRA_KEYWORDS = ["async", "await"]


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Generate the Lib/keywords.py file from the grammar."
    )
    parser.add_argument(
        "grammar", type=str, help="The file with the grammar definition in PEG format"
    )
    parser.add_argument(
        "tokens_file", type=argparse.FileType("r"), help="The file with the token definitions"
    )
    parser.add_argument(
        "keyword_file",
        type=argparse.FileType("w"),
        help="The path to write the keyword definitions",
    )
    args = parser.parse_args()

    grammar, _, _ = build_parser(args.grammar)
    with args.tokens_file as tok_file:
        all_tokens, exact_tok, non_exact_tok = generate_token_definitions(tok_file)
    gen = CParserGenerator(grammar, all_tokens, exact_tok, non_exact_tok, file=None)
    gen.collect_rules()

    with args.keyword_file as thefile:
        all_keywords = sorted(list(gen.keywords.keys()) + EXTRA_KEYWORDS)
        all_soft_keywords = sorted(gen.soft_keywords)

        keywords = "" if not all_keywords else "    " + ",\n    ".join(map(repr, all_keywords))
        soft_keywords = (
            "" if not all_soft_keywords else "    " + ",\n    ".join(map(repr, all_soft_keywords))
        )
        thefile.write(TEMPLATE.format(keywords=keywords, soft_keywords=soft_keywords))


if __name__ == "__main__":
    main()
