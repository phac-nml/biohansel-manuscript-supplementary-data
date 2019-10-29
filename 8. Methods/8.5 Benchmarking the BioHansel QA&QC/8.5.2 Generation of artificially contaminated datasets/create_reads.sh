#!/bin/bash

for fasta in *.fasta
do
    sbatch -p Reference/Surveillance --mem=12G -c 4 --wrap="art_illumina -ss MSv3  -f 500 -i "$fasta" -l 250 -m 800 -s 42 -p -o "$fasta"_"
    printf "$fasta \n"
done

echo "done :)"