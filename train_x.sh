cd YOLOX
conda activate yolox
for method in 'default3x'
do
    for aug in 'mosaic'
    do
#         CUDA_VISIBLE_DEVICES=1 python tools/train.py -f exps/example/yolox_voc/yolox_voc_s.py -d 1 -b 12 -o --cache -c yolox_l.pth -expn ../res/yolox/${method}${aug}
        CUDA_VISIBLE_DEVICES=0 python tools/train.py -f exps/yolox_voc_s.py -d 1 -b 12 --cache -o  -c yolox_l.pth -expn ${method}${aug}
    done
done
conda deactivate
