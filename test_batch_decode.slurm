#!/bin/bash
#SBATCH --job-name="Test Batch Decode"
#SBATCH --output="test_batch_decode.out"
#SBATCH --partition=gpuA40x4
#SBATCH --mem=4G
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --constraint="scratch"
#SBATCH --gpus-per-node=1
#SBATCH --gpu-bind=closest
#SBATCH --account=bche-delta-gpu
#SBATCH -t 00:10:00

module reset
module load cuda

echo -e "job $SLURM_JOBID is starting on `hostname`\n\n"
srun ~/.pixi/bin/pixi run kernels/build/test_batch_decode >test_batch_decode.out 2>&1
