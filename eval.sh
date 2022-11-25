cd YOLOX
for method in 'mosaic'
do
    for aug in 'noaug'
    do
        CUDA_VISIBLE_DEVICES=1 python tools/eval.py -f exps/yolox_voc_s.py -c ../res/yolox/${method}${aug}/best_ckpt.pth -b 12 -d 1 --conf 0.001 -expn eval${method}${aug}
    done
done