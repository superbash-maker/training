#!/bin/bash

# Do exercise 1.17
# Number 2b, 2d, 3a, 4a, 4b, 4c, 4d

echo "Hello world!" > hello.txt
echo "This is a text file" >> hello.txt

cat hello.txt

echo "42" > secret-of-the-universe

cp -v secret-of-the-universe answer.txt

cp -v hello.txt answer.txt

rm -v hello.txt

mv -v answer.txt message
