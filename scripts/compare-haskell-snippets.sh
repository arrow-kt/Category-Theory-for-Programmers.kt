#!/bin/bash

echo ""
echo "    ,,,,,            .|||.          -  _ ,  -   "
echo "   /(o o)\           (o o)         -  (o)o)  -  "
echo "ooO--(_)--Ooo----ooO--(_)--Ooo-----ooO'(_)--Ooo-"
echo ""
echo -e "Comparing Haskell snippets for Category Theory for Programmers\n"

cd $(dirname $0)

if [ ! -d ../milewski-ctfp-pdf ]; then
    echo "Downloading repository for the book..."
    git clone https://github.com/hmemcpy/milewski-ctfp-pdf.git ../milewski-ctfp-pdf 
fi

rm -rf /tmp/kotlin-edition*
for directory in ../milewski-ctfp-pdf/src/content/*; do
    if [ ! -d $directory ]; then
        continue
    fi
    DIRECTORY_NAME=$(basename $directory)
    if [ -d $directory/code/haskell/ ]; then
        if [ -d ../src/content/$DIRECTORY_NAME/code/haskell/ ]; then
            echo -e "\n***********************************************************************" > /tmp/kotlin-edition-single-diff.log
            echo " Section: $DIRECTORY_NAME" >> /tmp/kotlin-edition-single-diff.log
            echo -e "***********************************************************************\n" >> /tmp/kotlin-edition-single-diff.log
            diff -rEZbwB $directory/code/haskell/ ../src/content/$DIRECTORY_NAME/code/haskell/ >> /tmp/kotlin-edition-single-diff.log \
                && echo -e "\t$DIRECTORY_NAME" >> /tmp/kotlin-edition-ok.log \
                || ( echo -e "\t$DIRECTORY_NAME" >> /tmp/kotlin-edition-error.log; \
                     cat /tmp/kotlin-edition-single-diff.log >> /tmp/kotlin-edition-diff.log )
        else
            echo -e "\t$DIRECTORY_NAME" >> /tmp/kotlin-edition-missing.log
        fi
    fi
done

echo "OK:"
cat /tmp/kotlin-edition-ok.log
echo -e "\nMISSING:"
cat /tmp/kotlin-edition-missing.log
echo -e "\nERRORS:"
cat /tmp/kotlin-edition-error.log
echo -e "\nDIFFERENCES:"
cat /tmp/kotlin-edition-diff.log
