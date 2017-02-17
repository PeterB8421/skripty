#!/bin/bash
tac /etc/passwd | head -n 28 | while read radek
do
echo "Hello" | $radek | write $radek
done

