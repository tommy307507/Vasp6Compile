#!/bin/csh

# Partition from a , b , c / normal , debug
#SBATCH -p b
#SBATCH -J JobName
# Recommended to Specify the node
# SBATCH -w b3
# Number of nodes
#SBATCH -N 1
#SBATCH -e job.err
#SBATCH -o LOG
# Number of gpus
#SBATCH --gpus 4
# Number of mpi threads , should = number of gpus
#SBATCH --ntasks-per-node 4
# Number of cpu cores per task, = omp threads
#SBATCH --cpus-per-task 4

setenv MKL_THREADING_LAYER INTEL
setenv OMP_NUM_THREADS $SLURM_CPUS_PER_TASK
setenv MKL_NUM_THREADS $SLURM_CPUS_PER_TASK
setenv OMP_NESTED true
setenv OMP_DYNAMIC false
setenv OMP_PLACES threads
setenv OMP_PROC_BIND close

setenv nranks $SLURM_GPUS
setenv nthrds $SLURM_CPUS_PER_TASK

setenv mpi "-np $nranks --map-by node:PE=$nthrds --bind-to core -x OMP_NUM_THREADS=$nthrds "

setenv omp "-x OMP_STACKSIZE=512m -x OMP_PLACES=cores -x OMP_PROC_BIND=close"

mpirun $mpi $omp vasp_std
