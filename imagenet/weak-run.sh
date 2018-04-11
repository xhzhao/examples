#!/bin/sh
source activate python-intelpytorch
#export PATH="/home/zhaoxiao/anaconda3-xhzhao/bin:$PATH"                         
#export PATH="/home/zhaoxiao/test/intel_rnn_engine-intelrnn_engine/external/mklml_lnx_2018.0.1.20171007/lib:$PATH"

                                                                                
#export KMP_AFFINITY=compact,1,0,granularity=fine                                
export OMP_NUM_THREADS=40
lscpu
which python

model=resnet50
data_path=/home/zhaoxiao/test/pytorch-imagenet-dataset/tiny-imagenet/tiny-imagenet-200/

#get node number:
echo "runing $model with $1 node"

local_bs=256
n=$1
if [ $1 == 1 ]; then 
    python main.py -a $model -p 1 $data_path
fi
if [ $1 -ge 2 ]; then
    export I_MPI_FABRICS=tmi                                                        
    mpirun -n $n -ppn 1 -f host_n"$n".txt python main.py -a $model --batch-size $local_bs --world-size $n --dist-backend mpi -p 1  $data_path
fi
