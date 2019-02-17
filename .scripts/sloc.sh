# TODO: if filetype is available in sloccount, use that

# counts lines in files matching a particular format in the current directory
#
# usage:
#
# sloc.sh filenameformat
#
# eg: slog.sh '*.go'

find . -name "$1" | xargs wc -l

