#!/usr/bin/env bash

# Write a bash script to calculate the frequency of each word in a text file
# words.txt.
#
# For simplicity sake, you may assume:
#
# words.txt contains only lowercase characters and space ' ' characters.
# Each word must consist of lowercase characters only.
# Words are separated by one or more whitespace characters.
#
# Example input in words.txt:
# the day is sunny the the
# the sunny is is
#
# Expected output:
# the 4
# is 3
# sunny 2
# day 1

# Convert all whitespace-separated words into one word per line,
# sort them so identical words are adjacent, count each group with uniq,
# then sort numerically by frequency in descending order.
# awk finally rearranges "count word" into the required "word count" format.

tr -s '[:space:]' '\n' < words.txt \
  | sort \
  | uniq -c \
  | sort -rn \
  | awk '{ print $2, $1 }'
