#!/bin/sh
export PATH="/home/zhaoxiao/anaconda3-xhzhao/bin:$PATH"                         
export PATH="/home/zhaoxiao/test/intel_rnn_engine-intelrnn_engine/external/mklml_lnx_2018.0.1.20171007/lib:$PATH"
#export I_MPI_FABRICS=tmi                                                        
                                                                                
export KMP_AFFINITY=compact,1,0,granularity=fine                                
export OMP_NUM_THREADS=44
which python

#get node number:
echo "runing with $1 node"

if [ $1 == 1 ]; then 
    python main.py
fi
if [ $1 == 2 ]; then 
    mpirun -n 2  python -u main.py --batch-size 32 --world-size 2
fi
if [ $1 == 4 ]; then 
    mpirun -n 4  python -u main.py --batch-size 16 --world-size 4
fi
