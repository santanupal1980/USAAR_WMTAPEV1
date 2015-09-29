#!/bin/sh
#
#----------------------
#Author: Arkadiusz Szał
#----------------------
#
#Usage:
#sh run.sh source_file_name target_file_name input_files_path
#
################################################################

#program path
SYMGIZA_ROOT=/Users/santanu/MachineTranslation/WordAlignment/SymGiza
export SYMGIZA_ROOT=/Users/santanu/MachineTranslation/WordAlignment/SymGiza
mkcls=$SYMGIZA_ROOT/bin/mkcls
plain2snt=$SYMGIZA_ROOT/bin/plain2snt
snt2cooc=$SYMGIZA_ROOT/bin/snt2cooc
symgiza=$SYMGIZA_ROOT/bin/symgiza

#program parameters
src_file=english
trg_file=foreign
output_alias=out
output_ef_alias=ef
output_fe_alias=fe
input_files_path=/Users/santanu/MachineTranslation/WordAlignment/SymGiza
output_files_path=/Users/santanu/MachineTranslation/WordAlignment/SymGiza/data
threads_number=5
m1=2	#number of iteration for model 1
m2=2
m3=2
m4=2
m5=1 # default was 0
mh=2
m1SymFreq=5 #frequency of symmetrization for model 1
m2SymFreq=5
m345SymFreq=5
mhSymFreq=5
tm=16 #multipler of symmetrization
es=1 #do symmetrization at the end: 1-yes, 0-no
alig=intersect #type of last symmetrization
diag=yes
final=yes
both=yes

#_____________________________________________________
#---------------
if [ $# -eq 3 ] ; then
src_file=$1
trg_file=$2
input_files_path=${PWD}"/"$3
output_files_path=${PWD}"/"$3/data
else
echo "Usage: sh run.sh source_file_name target_file_name input_files_path"
fi

$plain2snt $input_files_path/$src_file $input_files_path/$trg_file
$plain2snt $input_files_path/$trg_file $input_files_path/$src_file

#---------------
$mkcls -p$input_files_path/$src_file -V$input_files_path/$src_file.vcb.classes
$mkcls -p$input_files_path/$trg_file -V$input_files_path/$trg_file.vcb.classes

#---------------
$snt2cooc $input_files_path/c1-c2.cooc $input_files_path/$src_file.vcb $input_files_path/$trg_file.vcb $input_files_path/$src_file"_"$trg_file.snt
$snt2cooc $input_files_path/c2-c1.cooc $input_files_path/$trg_file.vcb $input_files_path/$src_file.vcb $input_files_path/$trg_file"_"$src_file.snt

#_______________SyMGIZA++_____________________________________________________
mkdir $output_files_path
rm $output_files_path/*

#__begin timer___
START=$(date +%s)
#________________

#---------------
$symgiza -ncpus $threads_number -s $input_files_path/$src_file.vcb -t $input_files_path/$trg_file.vcb -cef  $input_files_path/$src_file"_"$trg_file.snt -cfe $input_files_path/$trg_file"_"$src_file.snt -oef $output_files_path/$output_ef_alias -ofe $output_files_path/$output_fe_alias -o $output_files_path/$output_alias -CoocurrenceFileEF $input_files_path/c1-c2.cooc -CoocurrenceFileFE $input_files_path/c2-c1.cooc -m1 $m1 -m2 $m2 -m3 $m3 -m4 $m4 -m5 $m5 -mh $mh -m1symfrequency $m1SymFreq -m2symfrequency $m2SymFreq -mhsymfrequency $mhSymFreq -m345symfrequency $m345SymFreq -tm $tm -es $es -alig $alig -diagonal $diag -final $final -both $both



#___end timer___
END=$(date +%s)
DIFF=$(( $END - $START ))
echo "It took $DIFF seconds"
awk -F " {##} " '{print $3}'<$input_files_path/data/out.A3.final_symal >$input_files_path/data/aligned.grow-diag-final-and
echo ***Progam end***

cp $input_files_path/data/aligned.grow-diag-final-and $input_files_path/aligned.grow-diag-final-and


