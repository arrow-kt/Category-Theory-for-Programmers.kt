#!/bin/bash

HASKELL="haskell"
KOTLIN="kotlin"

function showBanner()
{
    echo ""
    echo "       |*|                                _              ( ( (      "
    echo "      _|_|_          -  _ ,  -          _|_|_          '. ___ .'    "
    echo "      (o o)         -  (o)o)  -         (o o)         '  (> <) '    "
    echo "  ooO--(_)--Ooo-----ooO'(_)--Ooo----ooO--(_)--Ooo----ooO--(_)--Ooo- "
    echo ""
    echo -n "Extracting snippets for Category Theory for Programmers "
}

function checkDirectories()
{
    if [ ! -d ../milewski-ctfp-pdf ]; then
        echo "Downloading repository for the book..."
        git clone https://github.com/hmemcpy/milewski-ctfp-pdf.git ../milewski-ctfp-pdf
    fi
}

function extensionFromLanguage()
{
    if [[ $1 = $HASKELL ]]; then
        echo "hs"
        return 0
    fi
    if [[ $1 = $KOTLIN ]]; then
        echo "kt"
        return 0
    fi
    return 1
}

function sectionNameFromFile()
{
    BASENAME=$(basename $1)
    echo $BASENAME | cut -d- -f1
}

function fixFilesWhenJoiningParts()
{
    for file in ../src/main/ank/*.md; do
        echo -n "."
        
        SECTION=$(sectionNameFromFile $file)
        FILES_NUMBER=$(ls ../src/main/ank/${SECTION}-* | wc -l)
    
        if [ $FILES_NUMBER -gt 1 ]; then
            cat ../src/main/ank/${SECTION}-* > ../src/main/ank/new-file.md
            rm ../src/main/ank/${SECTION}-*
            mv ../src/main/ank/new-file.md ../src/main/ank/${SECTION}-new-file-from-joininig-parts.md
        fi
    done
}

function extractSnippets()
{
    for file in ../src/main/ank/*.md; do
        echo -n "."
    
        SECTION=$(sectionNameFromFile $file)
    
        mkdir -p ../milewski-ctfp-pdf/src/content/$SECTION/code/$KOTLIN/
        mkdir -p ../src/content/$SECTION/code/$HASKELL/
    
        LANGUAGE=""
        SEPARATORS_NUMBER=0
        SNIPPED_NUMBER=0
        while read -r line; do
            if [[ $line = ..* ]]; then
                continue
            fi
            if [[ $line = \`\`* ]]; then
                SEPARATORS_NUMBER=$(($SEPARATORS_NUMBER + 1))
                if [ $(($SEPARATORS_NUMBER % 2)) -eq 0 ]; then
                    continue
                fi
                if [ $(($SEPARATORS_NUMBER % 4)) -eq 1 ]; then
                    LANGUAGE=$HASKELL
                    SNIPPED_NUMBER=$(($SNIPPED_NUMBER + 1))
                    continue
                else
                    LANGUAGE=$KOTLIN
                    continue
                fi
            fi
            echo "$line" >> "../$(if [[ $LANGUAGE == $KOTLIN ]]; then echo 'milewski-ctfp-pdf/'; fi)src/content/$SECTION/code/$LANGUAGE/snippet$(printf "%02d" $SNIPPED_NUMBER).$(extensionFromLanguage $LANGUAGE)"
        done < $file
    done
}

showBanner
cd $(dirname $0)
checkDirectories
rm -rf ../src/content/* ../milewski-ctfp-pdf/src/content/**/code/$KOTLIN
fixFilesWhenJoiningParts
extractSnippets
echo -e "\n\nFinished!!\nLook at: milewski-ctfp-pdf/src/content/**/code/$KOTLIN"
