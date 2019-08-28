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
    if [ ! -d ../../milewski-ctfp-pdf ]; then
        echo -e "\nPlease, download the milewski-ctfp-pdf repository"
        echo "in the parent directory of this workspace:"
        echo -e "\n> ls"
        echo "Category-Theory-for-Programmers.kt"
        echo "milewski-ctfp-pdf"
        echo -e "\nTo download it: git clone git@github.com:hmemcpy/milewski-ctfp-pdf.git"
        exit 1
    fi
}

function contentForFile() {
    echo '```Haskell'
    cat $1
    echo '```'
    echo '```kotlin'
    echo ''
    echo '```'
    echo '................'
}

function createInitialFiles()
{
    for directory in ../../milewski-ctfp-pdf/src/content/*; do
        echo -n "."
        if [ ! -d $directory ]; then
            continue
        fi
        DIRECTORY_NAME=$(basename $directory)
        if [ -d $directory/code/haskell/ ]; then
            for file in $directory/code/haskell/*; do
                contentForFile $file >> ../src/main/ank/drafts/${DIRECTORY_NAME}.md
            done
        fi
    done
}

showBanner
cd $(dirname $0)
mkdir -p ../src/main/ank/drafts/
rm -f ../src/main/ank/drafts/*.md
checkDirectories
createInitialFiles
echo -e "\n\nFinished!!\nLook at: src/main/ank/drafts/"
