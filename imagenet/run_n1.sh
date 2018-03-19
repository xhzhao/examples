#!/bin/sh
export PATH="/home/zhaoxiao/anaconda3-xhzhao/bin:$PATH"                         
export PATH="/home/zhaoxiao/test/intel_rnn_engine-intelrnn_engine/external/mklml_lnx_2018.0.1.20171007/lib:$PATH"
export I_MPI_FABRICS=tmi                                                        
                                                                                
export KMP_AFFINITY=compact,1,0,granularity=fine                                
export OMP_NUM_THREADS=56

lscpu
which python

data_path=/home/zhaoxiao/test/pytorch-imagenet-dataset/tiny-imagenet/tiny-imagenet-200/

#n1
python main.py -a resnet18 -p 1 $data_path

#n2
#mpirun -n 2 -ppn 1 -f host.txt python main.py -a resnet18 --batch-size 128 --world-size 2 --dist-backend mpi -p 1  $data_path
