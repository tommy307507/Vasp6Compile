# Vasp6Compile

## TODO:
-  Make 6.4.3 or above work 

## File structure

- Compiling:
    - Contains the makefile.include for compiling on gpus and the original copy for vasp 6.4.2

## Modules

```
module purge
module load nvhpc-hpcx-cuda12/23.9 mkl/latest
```


# Reading Materials

https://www.nvidia.cn/data-center/gpu-accelerated-applications/vasp/

# Tags

### NSIM

Default in vasp NSIM = 1

For jobs taking small amount of memory and not fully occupying the gpu

try larger NSIM 

## KPAR
Default in vasp KPAR = 1

For jobs taking small amount of memory and not fully occupying the gpu 

try KPAR = No. of GPUS

KPAR might cause out of memory for large jobs

# Submitting jobs

### Flowchart 

1. Choose a suitable node by seeing roughly how many memory your job consume, see below 

Hint : Running a few electronic steps should be enough , check with:

```
nvidia-smi
``` 
during the job is running

200 atoms or so, a / b would be enough

c node should be reserved for really large systems

2. Modifiy the run.sh

The A node has 2 gpus, B / C node has 4 gpus each

Number of MPI tasks = Number of gpus

The openmp option is set to bind-to core 

The number of cpu cores allocated is no larger than the cpus cores physically available 
```
Number_of_tasks * Number_of_cpus_cores_per_task = physical_cores
```
##### Tags:
```
#SBATCH --gpus []
# Number of mpi threads , should = number of gpus
#SBATCH --ntasks-per-node []
# Number of cpu cores per task, = omp threads
#SBATCH --cpus-per-task []
```

3. Submit with 
```
sbatch run.sh
```

## Nodes

### A nodes

CPU : AMD 5975WX

32 Cores 64 Threads

GPUS : 2 x RTX A6000 48GB

Total CPU cores: **32 cores**

Total GPU memory : 96GB

### B nodes

CPU : 2 x Xeon 6444Y

16 Cores 32 Threads

Total CPU cores : **32 cores**

GPUS : 4 x RTX4090 24GB

Total GPU memory : 96GB

### C node

CPU : 2 x AMD7763

64 Cores 128 Threads

Total CPU cores: **128 cores**

GPUS : 4 x A800 80GB

Total GPU memory : 320GB

##### note for C node
When using C node, make sure you use enough KPAR / NSIM to fully occupy the GPU

else it would be the same as the b node and wasting compute power

