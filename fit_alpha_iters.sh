#!/usr/bin/env bash

for i in {1..100};
do

if [ ! -d run${i}/alpha/ ]
then
mkdir run${i}/alpha/
fi

for iter in {0..6};
do

cp fit_stacks_1c.py run${i}/alpha/iter${iter}
cd run${i}/alpha/iter${iter}

count=`ls -1 *.ascii 2>/dev/null | wc -l`

if [ ${count} != 0 ]
then

echo "Will fit in run"${i} " iter" ${iter}
python fit_stacks_1c.py
mkdir -p ../../../all/iter${iter}
cp CIalpha_-47kms_nomod_1c.log ../../../all/iter${iter}/CIalpha_-47kms_run${i}.log

fi

cd ../../..

done

done
