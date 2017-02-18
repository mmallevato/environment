#! /bin/bash


# *** Choose shell:
#$ -S /bin/bash

# *** Transfer variable:
#$ -V 

# *** Run in current working directory:
#$ -cwd

# *** Save stdout and stderr:
#$ -o $HOME/log/
#$ -e $HOME/log/

# *** Name job:
#$ -N 

# *** Queue:
#$ -q all.q 

# *** Prioritize:
#$ -p -10

# *** Join stdout and stderr:
#$ -j No

# *** Use core:
#$ -pe smp 10

# *** Require free /tmp space:
#$ -l tmpfree=1T

# *** Require free /tmp space:
#$ -l mem_total=250G

# *** Request RAM per core:
#$ -l h_vmem=4G

# *** Run array job:
#$ -t 1-100

# *** Run job concurrently:
#$ -tc 200


source $HOME/.bashrc


date
hostname
#printenv
rm -rf /tmp/k
mkdir /tmp/k

JOB_ID=$(($SGE_TASK_ID-1)) 
echo JOB_ID=$JOB_ID

CMD=("$@")

echo '********************************************************************************' 

readarray ARRAY < ${CMD[@]:2:1}
${CMD[@]:0:2} ${ARRAY[$JOB_ID]}

##${CMD[@]:0:2}

echo '********************************************************************************' 

rm -rf /tmp/k
