#!/bin/bash
text="Dobrý:den:píšu:random:slova:skriptem"
echo $text
echo $text | awk -F ":" '{printf $2}'
echo $text | awk -F ":" '{printf $6}'
echo "\n"
