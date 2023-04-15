#!/usr/bin/env bash
source term.sh

echo "term_print_success"
term_print_success "Download completed"
echo "term_print_alert"
term_print_alert "Download cancelled"
echo "term_print_error"
term_print_error "Download failed"

term_print_success_b "Download completed"
term_print_alert_b "Download cancelled"
term_print_error_b "Download failed"

echo "Show term_progressbar function"
for i in {1..15}
do
    term_progressbar $i
    sleep 0.25
done

echo
echo "Show term_progressbar \$i 50"
for i in {1..15}
do
    term_progressbar $i 30
    sleep 0.25
done


echo
echo "Show term_progressbar_100 \$i 50"
for i in {1..15}
do
    term_progressbar_100 $i
    sleep 0.25
done


echo
echo "Testing term_line 80 '*'"
term_line 80 '*'

echo "Testing term_line 24 '#'"
term_line 24 '#'

echo "Show to use term_table to make a table"
data=(version name 5.0 lolipop 4.4 kitkat 3.0 honeycomb 2.3 gingerbread)
term_table 5 2 15 ${data[@]}


