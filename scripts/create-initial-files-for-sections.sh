#!/bin/bash

function showBanner()
{
    echo ""
    echo "                    .      .            _                _                        "
    echo "    ,,,,,         .  .:::.            _|_|_            _|_|_          -  _ ,  -   "
    echo "   /(o o)\          :(o o):  .        (o o)            (o o)         -  (o)o)  -  "
    echo "ooO--(_)--Ooo----ooO--(_)--Ooo----ooO--(_)--Ooo----ooO--(_)--Ooo-----ooO'(_)--Ooo-"
    echo ""
    echo "Create initial files for sections in Category Theory for Programmers "
}

function checkDirectories()
{
    if [ ! -d ../milewski-ctfp-pdf ]; then
        echo "Downloading repository for the book..."
        git clone https://github.com/hmemcpy/milewski-ctfp-pdf.git ../milewski-ctfp-pdf
    fi
}

function contentForKotlinFile() {
    echo '```Haskell'
    cat $1
    echo -e '\n```'
    echo '```kotlin:ank:silent'
    echo ""
    echo '```'
    echo '................'
}

function contentForScalaFile() {
    echo '```Haskell'
    cat $1
    echo -e '\n```'
    echo '```scala'
    FILENAME=$(basename -s .hs $1)
    cat $2/code/scala/$FILENAME.scala
    echo -e '\n```'
    echo '................'
}

function createInitialFiles()
{
    for directoryPath in ../milewski-ctfp-pdf/src/content/*; do
        echo -n "."
        if [ ! -d $directoryPath ]; then
            continue
        fi
        SECTION=$(basename $directoryPath)
        if [ -d $directoryPath/code/haskell/ ]; then
            rm -f ../drafts/${SECTION}.md
            rm ../drafts/scala/${SECTION}-hypothetical-file.md
            for file in $directoryPath/code/haskell/*; do
                contentForKotlinFile $file >> ../drafts/${SECTION}.md
                contentForScalaFile $file $directoryPath >> ../drafts/scala/${SECTION}-hypothetical-file.md
            done
        fi
    done
}

showBanner
cd $(dirname $0)
checkDirectories
createInitialFiles
echo -e "\n\nFinished!!\nLook at: drafts/"
