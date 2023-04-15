#!/bin/bash

fs_is_file() { [ -f "$1" ] && echo 1 || echo 0; }
fs_is_dir() { [ -d "$1" ] && echo 1 || echo 0; }
fs_is_symlink() { [ -L "$1" ] && echo 1 || echo 0; }

fs_file_ext() { f=$(basename "$1"); echo "${f##*.}"; }
fs_file_name() { echo $(basename "$1"); }
fs_file_name_no_ext() { f=$(basename "$1"); echo "${f%.*}"; }

fs_list_files() { find "$1" -maxdepth 1 -type f -print0; }
fs_list_files_r() { find "$1" -type f -print0; }
fs_list_dirs() { find "$1" -mindepth 1 -maxdepth 1 -type d -print0; }
fs_list_dirs_r() { find "$1" -mindepth 1 -type d -print0; }
fs_list_all() { find "$1" -mindepth 1 -maxdepth 1 -print0; }
fs_list_all_r() { find "$1" -mindepth 1 -print0; }
