#!/bin/bash

# This shellscript will parse the output CS code from the class containing the Orion Backdoor
# from the disasembler JetBrains and output all the encoded strings
# Eduardo Ruiz Duarte
# toorandom@gmail.com

for each in $(cat OrionImprovementBusinessLayer.cs.txt  | grep Helper.Unzip | cut -d \" -f 2 | strings)
        do
                printf "\x1f\x8b\x08\x00\x00\x00\x00\x00\x00\x00""$(echo $each | base64 -d)" | gzip -dcf  2>/dev/null;echo >> decoded-Solarwinds.txt
                tail -1 decoded-Solarwinds.txt
        done
