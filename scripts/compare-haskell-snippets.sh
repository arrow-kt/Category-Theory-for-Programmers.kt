#!/bin/bash

echo ""
echo "    ,,,,,            .|||.          -  _ ,  -   "
echo "   /(o o)\           (o o)         -  (o)o)  -  "
echo "ooO--(_)--Ooo----ooO--(_)--Ooo-----ooO'(_)--Ooo-"
echo ""
echo "Comparing Haskell snippets for Category Theory for Programmers"

cd $(dirname $0)

if [ ! -d ../../milewski-ctfp-pdf ]; then
    echo -e "\nPlease, download milewski-ctfp-pdf repository to compare."
    echo "Place it in the parent directory of this workspace:"
    echo -e "\n> ls"
    echo "Category-Theory-for-Programmers.kt"
    echo "milewski-ctfp-pdf"
    echo -e "\nTo download it: git clone git@github.com:hmemcpy/milewski-ctfp-pdf.git"
    exit 1
fi

for directory in ../../milewski-ctfp-pdf/src/content/*; do
    if [ ! -d $directory ]; then
        continue
    fi
    DIRECTORY_NAME=$(basename $directory)
    if [ -d $directory/code/haskell/ ]; then
        echo -e "\n***********************************************************************"
        echo -e "Comparing section $DIRECTORY_NAME\n"
        if [ -d ../src/content/$DIRECTORY_NAME/code/haskell/ ]; then
            diff -rEZbwB $directory/code/haskell/ ../src/content/$DIRECTORY_NAME/code/haskell/
        else
            echo ">>> Missing section!"
        fi
    fi
done
