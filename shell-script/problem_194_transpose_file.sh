# Difficulty : Medium

# Given a text file file.txt, transpose its content.

# You may assume that each row has the same number of columns, and each field is separated by the ' ' character.

# Example:

# If file.txt has the following content:

# name age
# alice 21
# ryan 30

# Output the following:

# name alice ryan
# age 21 30

# Store each field by its column number while reading file.txt once.
# After all rows are read, print every stored column as one output row.

awk '
{
  for (i = 1; i <= NF; i++) {
    col[i] = col[i] (NR == 1 ? "" : " ") $i
  }
}
END {
  for (i = 1; i <= NF; i++) {
    print col[i]
  }
}
' file.txt

# awk - learnings:

# `awk` is a small programming language made for processing text files line by line.

# It is especially good for files that look like tables:

# ```text
# name age
# alice 21
# ryan 30
# ```

# You can think of `awk` as:

# > “For each line in a file, split the line into columns, then run some code.”

# Basic shape:

# ```sh
# awk 'pattern { action }' file.txt
# ```

# Example:

# ```sh
# awk '{ print $1 }' file.txt
# ```

# This prints the first column of every line.

# For:

# ```text
# name age
# alice 21
# ryan 30
# ```

# Output:

# ```text
# name
# alice
# ryan
# ```

# Important built-ins:

# ```awk
# $0   # the whole current line
# $1   # first field/column
# $2   # second field/column
# NF   # number of fields in the current line
# NR   # current line number
# ```

# Example:

# ```sh
# awk '{ print NR, $1, $2 }' file.txt
# ```

# Output:

# ```text
# 1 name age
# 2 alice 21
# 3 ryan 30
# ```

# You can filter lines too:

# ```sh
# awk 'NR == 2 { print $0 }' file.txt
# ```

# This prints only line 2:

# ```text
# alice 21
# ```

# Another example:

# ```sh
# awk '$2 > 25 { print $1 }' file.txt
# ```

# For:

# ```text
# alice 21
# ryan 30
# john 40
# ```

# It prints names where the second column is greater than 25:

# ```text
# ryan
# john
# ```

# `awk` also has special blocks:

# ```awk
# BEGIN { ... }  # runs before reading the file
# { ... }        # runs once per line
# END { ... }    # runs after reading the file
# ```

# Example:

# ```sh
# awk '
# BEGIN {
#   print "Names:"
# }
# {
#   print $1
# }
# END {
#   print "Done"
# }
# ' file.txt
# ```

# Your transpose solution uses `awk` like a tiny script:

# ```sh
# awk '
# {
#   for (i = 1; i <= NF; i++) {
#     col[i] = col[i] (NR == 1 ? "" : " ") $i
#   }
# }
# END {
#   for (i = 1; i <= NF; i++) {
#     print col[i]
#   }
# }
# ' file.txt
# ```

# Meaning:

# - Read every line.
# - For each field/column, append it into `col[i]`.
# - After all lines are read, print each collected column.

# So `awk` is very useful when you want to quickly transform, filter, count, or summarize text from the command line. It is like a compact Python for table-shaped text.