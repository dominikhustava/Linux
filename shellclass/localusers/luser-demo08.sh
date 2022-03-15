#!/bin/bash

# This script demonstrates IO redirection.

# Redirect STDOUT to a file.
FILE="/tmp/data"
head -n1 /etc/passwd > ${FILE}

# Redirect STDIN to a program.
read LINE < ${FILE}
echo "LINE contains: ${LINE}"

# Redirect STDOUT to a file, overwriting the file.
head -n3 /etc/passwd > ${FILE}
echo
echo "Contents of ${FILE}:"
cat ${FILE}

# Redirect STDOUT to a file, appending to the file.
echo "${RANDOM} ${RANDOM}" >> ${FILE}
echo "${RANDOM} ${RANDOM}" >> ${FILE}
echo
echo "Contents of ${FILE}"
cat ${FILE}

# Redirect STDIN to a program, using FD 0.
read LINE 0< ${FILE}
echo
echo "LINE contains: ${LINE}"

# Redirect STDOUT to a file using FD 1(explicitly), overwriting the file.
head -n3 /etc/passwd 1> ${FILE}
echo
echo "Contents of ${FILE}:"
cat ${FILE}

# Redirect STDERR to a file usinf FD 2.
ERR_FILE="/tmp/data.err"
head -n3 /etc/passwd /nonexistingfile 2> ${ERR_FILE}

# Redirect STDOUT and STDERR to a file.
head -n3 /etc/passwd /nonexistingfile &> ${FILE}
echo
echo "Contents of ${FILE}:"
cat ${FILE}
