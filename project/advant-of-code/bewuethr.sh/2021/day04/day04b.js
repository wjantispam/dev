#!/usr/bin/env node

import process from "process";
import * as fs from "fs";

function isWinner(board) {
	if (board.some(row => row.every(el => el.seen))) {
		return true;
	}

	let transpose = board[0].map((el, i) => board.map(el => el[i]));
	if (transpose.some(row => row.every(el => el.seen))) {
		return true;
	}

	return false;
}

function score(board, last) {
	return board.flat()
		.filter(({seen}) => !seen)
		.map(({n}) => n)
		.reduce((prev, curr) => prev + curr) * last;
}

let input = fs.readFileSync(process.argv[2], "utf8")
	.trim()
	.split("\n\n");

let draw = input[0].split(",").map(Number);

let boards = input.slice(1)
	.map(board => board.split("\n")
		.map(row => row.trim()
			.split(/\s+/)
			.map(el => ({n: Number(el), seen: false}))));

let loser = [];
let last;

for (let d of draw) {
	boards = boards.map(b =>
		b.map(row =>
			row.map(({n, seen}) => ({n, seen: n == d ? true : seen}))
		)
	);

	if (boards.length > 1) {
		boards = boards.filter(b => !isWinner(b));
		continue;
	}

	if (isWinner(boards[0])) {
		loser = boards[0];
		last = d;
		break;
	}
}

console.log(score(loser, last));
