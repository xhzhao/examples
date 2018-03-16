#!/bin/sh
export PATH="/home/zhaoxiao/anaconda3-xhzhao/bin:$PATH"                         
export PATH="/home/zhaoxiao/test/intel_rnn_engine-intelrnn_engine/external/mklml_lnx_2018.0.1.20171007/lib:$PATH"
#export I_MPI_FABRICS=tmi                                                        
                                                                                
export KMP_AFFINITY=compact,1,0,granularity=fine                                
export OMP_NUM_THREADS=28
which python


#n1
#python main.py

#n2
mpirun -n 2  python -u main.py --batch-size 32 --world-size 2
