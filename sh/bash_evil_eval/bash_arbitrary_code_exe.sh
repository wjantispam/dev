# http://mywiki.wooledge.org/BashFAQ/048

foo() { declare -n var=$1; echo "$var"; }

echo "Running foo 'x[i=$(date)]' will actually cause $date to be executed"
foo 'x[i=$(date)]'
