#!/bin/bash

function showBanner()
{
    echo ""
    echo "    ,,,,,         /\#/\       -  _ ,  -     -  _ ,  -   "
    echo "   /(o o)\       /(o o)\     -  (o)o)  -   -  (o)o)  -  "
    echo "ooO--(_)--Ooo-ooO--(_)--Ooo--ooO'(_)--Ooo--ooO'(_)--Ooo-"
    echo ""
    echo -e "Checking the style of Kotlin snippets for Category Theory for Programmers\n"
}

function nonEmptySnippets()
{
    SNIPPET=$(basename $snippet)
    SIZE=$(cat $snippet | sed -e "s/\s//g" -e /^$/d | wc -c)
    if [ $SIZE -eq 0 ]
    then
        echo -e "\n\t  $SNIPPET\n" >> /tmp/kotlin-edition-$SECTION.log
    fi
}

function linesLength()
{
    SNIPPET=$(basename $snippet)
    while read -r line; do
        LENGTH=$(echo "$line" | wc -c)
        if [ $LENGTH -gt 64 ]
        then
            echo -e "\t\t[LENGTH: $LENGTH]  $line" >> /tmp/kotlin-edition-$SNIPPET.log
        fi
    done < $snippet
    if [ -f /tmp/kotlin-edition-$SNIPPET.log ]
    then
        echo -e "\n\t  $SNIPPET\n" >> /tmp/kotlin-edition-$SECTION.log
        cat /tmp/kotlin-edition-$SNIPPET.log >> /tmp/kotlin-edition-$SECTION.log
    fi
}

function check()
{
    rm -rf /tmp/kotlin-edition*
    for directory in ../milewski-ctfp-pdf/src/content/*; do
        if [ ! -d $directory ]; then
            continue
        fi
        SECTION=$(basename $directory)
        if [ -d $directory/code/kotlin/ ]; then
            for snippet in $directory/code/kotlin/**
            do
                $1
            done
            if [ -f /tmp/kotlin-edition-$SECTION.log ]
            then
                echo -e "\n\t-----------------------------------------------------------------------"
                echo -e "\tSection: $SECTION"
                echo -e "\t-----------------------------------------------------------------------"
                cat /tmp/kotlin-edition-$SECTION.log
            fi
        fi
        rm -f /tmp/kotlin-edition-*
    done
}

cd $(dirname $0)
showBanner

echo "* Snippets cannot be empty (maybe there are exceptions) ..."
check nonEmptySnippets

echo "* Length of lines cannot be greater than 64 ..."
check linesLength
