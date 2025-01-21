#!/bin/csh
# .local/bin contains the vasp executables 
# Add other exe to path by inserting :PATH_TO_OTHER_EXECUTABLES after the ":" sign
setenv PATH "$HOME/.local/bin/:$PATH"
# User specific aliases and functions
if ($HOST != "gpus" ) then
    module load nvhpc-hpcx-cuda12/23.9 mkl
else
    conda activate vasp
endif
