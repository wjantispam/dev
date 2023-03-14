#!/usr/bin/env bash
#
CUR_DIR="$HOME/main/dev/sh"
OUT_FILE="$CUR_DIR/file_list.txt"
find "$CUR_DIR/abs-guide" -iname "*.sh" -print0 | xargs -0 grep -A1 '/bin/bash' > "$OUT_FILE" 

grep "#.*\.sh" "$OUT_FILE" > "${OUT_FILE}.2"

function rename() {
  old_file=$1
  new_file=$2
  mv $old_file $new_file
}

function rename() {
  OLD_NAME="$1"
  NEW_NAME="$2"
  echo mv "$OLD_NAME" "${OLD_NAME%%.sh}-$NEW_NAME" 
  mv "$OLD_NAME" "${OLD_NAME%%.sh}-$NEW_NAME.sh" 
}


while read -r line; do
  OLD_NAME="${line%%.*}.sh"
  echo "$OLD_NAME"

  
  NEW_NAME_LONG="${line##*#}"
  # echo -e "$line \n ===> $NEW_NAME_LONG"
  NEW_NAME_LONG2="${NEW_NAME_LONG%%sh.*}"
  NEW_NAME_LONG3="${NEW_NAME_LONG2%%.sh*}" # still padded with space
  NEW_NAME="${NEW_NAME_LONG3// /}"
  # echo -e "$NEW_NAME_LONG2 \n ===> $NEW_NAME"
  # echo -e "$OLD_NAME==> $NEW_NAME"
  rename "$OLD_NAME" "$NEW_NAME" 
  
done <"${OUT_FILE}.2" # | head -n 10

rm "$OUT_FILE.*" 
