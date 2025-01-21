# Vasp6Compile

## File structure

- Compiling:
    - Contains the makefile.include for compiling on gpus and the original copy

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
For jobs taking small amount of memory and not fully occupying the gpu, try larger NSIM 

## KPAR
Default in vasp KPAR = 1
For jobs taking small amount of memory and not fully occupying the gpu, try KPAR = No. of GPUS
KPAR might cause out of memory for large jobs

# Submitting jobs
```
sbatch run.sh
```