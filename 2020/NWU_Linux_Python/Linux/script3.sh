#!/bin/bash

# Do exercise 2.18 
# Number 2a, 2b, 2c, 2d, 5c, 5d

echo "Shall I compare thee to a summer’s day?" > shakespeare
echo "Thou art more lovely and more temperate" >> shakespeare

mv -v shakespeare sonnet-18.txt

mkdir -v poetry

mv -v sonnet-18.txt poetry

echo "When in disgrace with Fortune and men’s eyes," > sonnet-29.txt
echo "I all alone beweep my outcast state," >> sonnet-29.txt

mv -v sonnet-29.txt poetry

cat poetry/*











