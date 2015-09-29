src=$1
pe=$2
tgt=$3
S_Lang=$4
T_Lang=$5

python /Users/santanu/workspace/PostEditing/Scripts/sgmize.py src sant_exp any $S_Lang sant_exp src $src >$src'.sgm'
python /Users/santanu/workspace/PostEditing/Scripts/sgmize.py ref sant_exp any $T_Lang sant_exp ref $pe >$pe'.sgm'
python /Users/santanu/workspace/PostEditing/Scripts/sgmize.py tst sant_exp any $T_Lang sant_exp tst $tgt >$tgt'.sgm'
