

BWA_BIN=/Users/santanu/MachineTranslation/tools/SMT/WordAligner/berkeleyaligner/

export BWA_BIN=/Users/santanu/MachineTranslation/tools/SMT/WordAligner/berkeleyaligner
export PATH=:$PATH

conf=$1
#outDir=$1"/"$3
rm -rf $2


#============= Run Barkeley Aligner ===================
java -server -mx1024m -jar $BWA_BIN/berkeleyaligner.jar ++$conf

#cp $outDir"/training.align" $4


