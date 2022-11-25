# +
cd yolov3
for method in 'default'
do
    for aug in 'noaug'
    do
        python train.py --img 640 --batch 12 --epochs 200 --device 1 --cache --multi-scale --hyp data/hyps/hyp.scratch-${aug}.yaml --data data/${method}/data.yaml --weights yolov5l.pt --project ../res/yolov5 --name ${method}${aug}
    done
done
# cd yolor
# for method in 'default3x'
# do
#     for aug in 'mosaic'
#     do
#         python train.py --batch-size 12 --img 640 640 --data ${method}/data.yaml --cfg cfg/yolor_csp.cfg --weights yolor_csp.pt --cache-images --multi-scale --device 0 --project ../res/yolor --name ${method}${aug} --hyp hyp.scratch-${aug}.640.yaml --epochs 200
#     done
# done
# cd yolox
# conda activate yolox
# python tools/train.py -f exps/example/yolox_voc/yolox_voc_s.py -d 1 -b 12 -o --cache -c yolox_l.pth -expn ../res/yolox/mosaic
# for method in 'mosaic'
# do
#     for aug in 'noaug'
#     do
        
#     done
# done
# conda deactivate
