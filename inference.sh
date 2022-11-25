for image in  "IMG_251"  #  'IMG_1660' 'IMG_1634' 'IMG_698' 
do
    for conf in 0.25
    do
        for iou in 0.5
        do
            for method in 'default'
            do
                for aug in 'aug'
                do
                    cd YOLOX
                    python tools/demo.py image -f exps/yolox_voc_s.py -c ../res/yolox/${method}${aug}/best_ckpt.pth -expn ${method}${aug} --path ../infer/${image}.jpg --conf ${conf} --nms ${iou} --tsize 640 --save_result --device gpu 
                    cd ../
                
                    cd yolor
                    python detect.py --source ../infer/${image}.jpg --cfg cfg/yolor_csp.cfg --weights ../res/yolor/${method}${aug}/weights/best.pt --conf ${conf} --iou-thres ${iou} --img-size 640 --device 0 --output ../infer/${method}${aug} --save-txt
                    cd ../
                
                    cd yolov3
                    python detect.py --source ../infer/${image}.jpg --weights ../res/yolov5/${method}${aug}/weights/best.pt --conf-thres ${conf} --iou-thres ${iou} --device 0 --project ../infer/${method}${aug} --save-txt --exist-ok --save-conf
                    cd ../
                
                done
            done
        done
    done
done
