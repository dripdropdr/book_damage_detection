for image in  "IMG_1659.jpg" 'IMG_251.jpg'
do
    for conf in 0.25
    do
        for cfg in 'mosaic'
        do
        python ./yolox/tools/demo.py image -f ./yolox/exps/example/yolox_voc/yolox_voc_s.py -c ./yolox/YOLOX_outputs/${cfg}/best_ckpt.pth --path ${image} --conf ${conf} --nms 0.45 --tsize 640 --save_result --device gpu

        cd yolor
        python ./detect.py --source ../${image} --cfg ./cfg/yolor_csp_x-Copy1.cfg --weights ./runs/train/${cfg}/weights/best.pt --conf ${conf} --img-size 640 --device 0 --output ../yolor_detect
        cd ../

        python ./yolov5/detect.py --source ${image} --weights ./yolov5/runs/train/${cfg}/weights/best.pt --device 0 --project ./yolov5_detect --conf-thres ${conf}
        done
    done
done
