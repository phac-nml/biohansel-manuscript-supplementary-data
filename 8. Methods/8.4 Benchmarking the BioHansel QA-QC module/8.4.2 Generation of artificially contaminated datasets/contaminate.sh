#!/bin/bash

read -r -p "What is the genome size?    " length
read -r -p "Which folder are we doing analysis on?  " folder

cd "$folder"

mkdir reads60
mkdir reads59
mkdir reads57
mkdir reads54
mkdir reads52
mkdir reads50
mkdir reads40
mkdir reads30
echo "folders made!"

let read_length=250

let cov60=60*$length/$read_length
let cov59=59*$length/$read_length
let cov57=57*$length/$read_length
let cov54=54*$length/$read_length
let cov52=52*$length/$read_length
let cov50=50*$length/$read_length
let cov40=40*$length/$read_length
let cov30=30*$length/$read_length
let cov20=20*$length/$read_length
let cov10=10*$length/$read_length
let cov08=8*$length/$read_length
let cov06=6*$length/$read_length
let cov03=3*$length/$read_length
let cov01=1*$length/$read_length

for input1 in *_1.fq
do
    name1=`echo "$input1" | sed 's/_1.fq//'`

    for input2 in *_2.fq
    do
        name2=`echo "$input2" | sed 's/_2.fq//'`

        if [ "$name1" = "$name2" ]
        then
            array1=($input1 $input2)
        fi
    done

    for input3 in *_1.fq
    do
        name3=`echo "$input3" | sed 's/_1.fq//'`

        if [ "$name1" = "$name3" ]
        then
            continue

        else

            for input4 in *_2.fq
            do
                name4=`echo "$input4" | sed 's/_2.fq//'`

                if [ "$name3" = "$name4" ]
                then
                    array2=($input3 $input4)

                    sbatch -p Reference/Surveillance --mem=8G -c 1 --wrap="seqtk sample -s42 "${array1[0]}" "$cov60" > ./reads60/"$name1"_60_"$name3"_0_1.fq; seqtk sample -42 "${array2[0]}" 0 >> ./reads60/"$name1"_60_"$name3"_0_1.fq"
                    sbatch -p Reference/Surveillance --mem=8G -c 1 --wrap="seqtk sample -s42 "${array1[1]}" "$cov60" > ./reads60/"$name1"_60_"$name3"_0_2.fq; seqtk sample -42 "${array2[1]}" 0 >> ./reads60/"$name1"_60_"$name3"_0_2.fq"

                    sbatch -p Reference/Surveillance --mem=8G -c 1 --wrap="seqtk sample -s42 "${array1[0]}" "$cov59" > ./reads59/"$name1"_59_"$name3"_1_1.fq; seqtk sample -42 "${array2[0]}" "$cov01" >> ./reads59/"$name1"_59_"$name3"_1_1.fq"
                    sbatch -p Reference/Surveillance --mem=8G -c 1 --wrap="seqtk sample -s42 "${array1[1]}" "$cov59" > ./reads59/"$name1"_59_"$name3"_1_2.fq; seqtk sample -42 "${array2[1]}" "$cov01" >> ./reads59/"$name1"_59_"$name3"_1_2.fq"

                    sbatch -p Reference/Surveillance --mem=8G -c 1 --wrap="seqtk sample -s42 "${array1[0]}" "$cov57" > ./reads57/"$name1"_57_"$name3"_3_1.fq; seqtk sample -42 "${array2[0]}" "$cov03" >> ./reads57/"$name1"_57_"$name3"_3_1.fq"
                    sbatch -p Reference/Surveillance --mem=8G -c 1 --wrap="seqtk sample -s42 "${array1[1]}" "$cov57" > ./reads57/"$name1"_57_"$name3"_3_2.fq; seqtk sample -42 "${array2[1]}" "$cov03" >> ./reads57/"$name1"_57_"$name3"_3_2.fq"

                    sbatch -p Reference/Surveillance --mem=8G -c 1 --wrap="seqtk sample -s42 "${array1[0]}" "$cov54" > ./reads54/"$name1"_54_"$name3"_6_1.fq; seqtk sample -42 "${array2[0]}" "$cov06" >> ./reads54/"$name1"_54_"$name3"_6_1.fq"
                    sbatch -p Reference/Surveillance --mem=8G -c 1 --wrap="seqtk sample -s42 "${array1[1]}" "$cov54" > ./reads54/"$name1"_54_"$name3"_6_2.fq; seqtk sample -42 "${array2[1]}" "$cov06" >> ./reads54/"$name1"_54_"$name3"_6_2.fq"

                    sbatch -p Reference/Surveillance --mem=8G -c 1 --wrap="seqtk sample -s42 "${array1[0]}" "$cov52" > ./reads52/"$name1"_52_"$name3"_8_1.fq; seqtk sample -42 "${array2[0]}" "$cov08" >> ./reads52/"$name1"_52_"$name3"_8_1.fq"
                    sbatch -p Reference/Surveillance --mem=8G -c 1 --wrap="seqtk sample -s42 "${array1[1]}" "$cov52" > ./reads52/"$name1"_52_"$name3"_8_2.fq; seqtk sample -42 "${array2[1]}" "$cov08" >> ./reads52/"$name1"_52_"$name3"_8_2.fq"

                    sbatch -p Reference/Surveillance --mem=8G -c 1 --wrap="seqtk sample -s42 "${array1[0]}" "$cov50" > ./reads50/"$name1"_50_"$name3"_10_1.fq; seqtk sample -42 "${array2[0]}" "$cov10" >> ./reads50/"$name1"_50_"$name3"_10_1.fq"
                    sbatch -p Reference/Surveillance --mem=8G -c 1 --wrap="seqtk sample -s42 "${array1[1]}" "$cov50" > ./reads50/"$name1"_50_"$name3"_10_2.fq; seqtk sample -42 "${array2[1]}" "$cov10" >> ./reads50/"$name1"_50_"$name3"_10_2.fq"

                    sbatch -p Reference/Surveillance --mem=8G -c 1 --wrap="seqtk sample -s42 "${array1[0]}" "$cov40" > ./reads40/"$name1"_40_"$name3"_20_1.fq; seqtk sample -42 "${array2[0]}" "$cov20" >> ./reads40/"$name1"_40_"$name3"_20_1.fq"
                    sbatch -p Reference/Surveillance --mem=8G -c 1 --wrap="seqtk sample -s42 "${array1[1]}" "$cov40" > ./reads40/"$name1"_40_"$name3"_20_2.fq; seqtk sample -42 "${array2[1]}" "$cov20" >> ./reads40/"$name1"_40_"$name3"_20_2.fq"

                    sbatch -p Reference/Surveillance --mem=8G -c 1 --wrap="seqtk sample -s42 "${array1[0]}" "$cov30" > ./reads30/"$name1"_30_"$name3"_30_1.fq; seqtk sample -42 "${array2[0]}" "$cov30" >> ./reads30/"$name1"_30_"$name3"_30_1.fq"
                    sbatch -p Reference/Surveillance --mem=8G -c 1 --wrap="seqtk sample -s42 "${array1[1]}" "$cov30" > ./reads30/"$name1"_30_"$name3"_30_2.fq; seqtk sample -42 "${array2[1]}" "$cov30" >> ./reads30/"$name1"_30_"$name3"_30_2.fq"
                fi
            done
        fi
    done
done

echo "Ok Done, Should have submitted the correct number of jobs to the cluster!"

echo "For the current set-up, the correct number of jobs is 312 per folder"

echo "Have a good rest of your day my friends   :)"