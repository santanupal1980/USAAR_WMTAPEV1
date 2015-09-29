
if [ ! $# -ge 3 ]; then

echo "Usage:: runMeteor.sh tst ref out"

exit
fi

#EVAL_DIR=/Users/santanu/MachineTranslation/tools/SMT/evaluation/meteor-1.2/
#export EVAL_DIR=/Users/santanu/MachineTranslation/tools/SMT/evaluation/meteor-1.2


EVAL_DIR=/Users/santanu/workspace/PostEditing/Scripts/meteor-1.5/
export EVAL_DIR=/Users/santanu/workspace/PostEditing/Scripts/meteor-1.5/
export PATH=:$PATH

abspath=${PWD}




#cd $EVAL_DIR/meteor-1.2/
#java  -Xmx2048M -jar meteor-1.2.jar $corpusDIR/tst.sgm $corpusDIR/ref.sgm >$corpusDIR/$testset.$sysName.score.meteor
#java -XX:+UseCompressedOops -Xmx2G -jar meteor-1.2.jar $corpusDIR/$testset.$sysName'.out' $corpusDIR/$testset.$T_Lang -writeAlignments >$corpusDIR/$testset.$sysName.align.out

java -Xmx2g -cp $EVAL_DIR/meteor-1.5.jar Matcher $abspath/$1 $abspath/$2 >$abspath/$3

#java -Xmx2g -jar $EVAL_DIR/meteor-1.5.jar $abspath/$1 $abspath/$2 -l es -a $EVAL_DIR/data/paraphrase-es.gz -writeAlignments >$abspath/$3