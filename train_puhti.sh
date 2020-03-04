#!/bin/bash

#SBATCH --account=Project_2002085
#SBATCH --time=48:00:00
#SBATCH --ntasks=1
#SBATCH --mem-per-cpu=8G
#SBATCH --partition=gpu
#SBATCH --gres=gpu:v100:1,nvme:60
#SBATCH --cpus-per-task=4


treebank=$1

modelname=$2

echo "treebank=$treebank, model=$modelname"

module load python-data/3.7.3-1
source venv-udify/bin/activate

export TMPDIR=$LOCAL_SCRATCH

python train.py --config config/ud/iwpt2020/$treebank.json --name $modelname
