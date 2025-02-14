# Cross-Domain Scene Unsupervised Learning Segmentation with Dynamic Subdomains


This repository contains the official implementation of our paper **"Cross-Domain Scene Unsupervised Learning Segmentation with Dynamic Subdomains"**, published in IEEE Transactions on Multimedia (TMM2024). [Paper Link](https://ieeexplore.ieee.org/abstract/document/10403926) 

## Overview
Unsupervised cross-domain scene segmentation approach adapts the source model to the target domain, which utilizes two-stage strategies to minimize the inter-domain and intra-domain gap. However, the accumulation of errors in the previous stages affects the training of the subsequent stages. In this paper, a framework called statistical and structural domain adaptation (SSDA) is proposed to optimize inter-domain and intra-domain adaptation jointly. Firstly, the statistical inter-domain adaptation (StaIA) is proposed to model dynamic subdomains, which continuously adjust seed samples during the process of domain adaptation to mitigate error accumulation. The dynamic subdomains are modeled by exploring Bayesian uncertainty statistics and global balance statistics, which alleviate the imbalance problem in uncertainty estimation. StaIA encourages the model to transfer comprehensive and genuine knowledge through the seed loss for inter-domain adaptation. Secondly, the structural intra-domain adaptation (StrIA) is proposed to align the intra-domain gap among dynamic subdomains by the structural priors. Specifically, the StrIA models structural priors by truncated conditional random field (TruCRF) loss within the neighborhood, which constrains intra-domain semantic consistency to reduce the intra-domain gap. Experimental results demonstrate the effectiveness of the proposed cross-domain scene segmentation approaches on two commonly-used unsupervised domain adaptation benchmarks.
[](resources/SSDA_Framework.png)

## Setup Environment
- Python 3.8.5
- CUDA 11.0
- In that environment, the requirements can be installed with:
```bash
pip install -r requirements.txt -f https://download.pytorch.org/whl/torch_stable.html
pip install mmcv-full==1.3.7 
```

## Datasets
1. Download Cityscapes from [link](https://www.cityscapes-dataset.com/downloads/).
2. Download GTA dataset from [link](https://download.visinf.tu-darmstadt.de/data/from_games/).
3. Download Synthia dataset from [link](http://synthia-dataset.net/downloads/).
4. Organize the dataset folder structure as follows:
   ```
   ├── data
   │   ├── cityscapes
   │   │   ├── leftImg8bit
   │   │   ├── gtFine
   │   ├── gta
   │   │   ├── images
   │   │   ├── labels
   │   ├── synthia
   │   │   ├── RGB
   │   │   ├── GT
   │   │   │   ├── LABELS
   ```

**Data Preprocessing:** 
please run the following scripts to convert the label IDs to the train IDs and to generate the class index for RCS:
 ```bash
python tools/convert_datasets/gta.py data/gta --nproc 8
python tools/convert_datasets/cityscapes.py data/cityscapes --nproc 8
python tools/convert_datasets/synthia.py data/synthia/ --nproc 8
 ```

## Training
To start training on GTA→Cityscapes, run:
```bash
sh run.sh
```

## Evaluation
We provide a checkpoint trained on GTA→Cityscapes for evaluation (mIoU:64.4). Download the model weights from the link:
[checkpoint Model](https://pan.baidu.com/s/1ObRnNAx16aGIDWwN2OAiDg?pwd=vmej)  
Place the model checkpoint in the `checkpoints/` directory.
To evaluate the model, run:
```bash
sh test.sh
```

## Citation
If you find our work helpful, please cite our paper:
```bash
@ARTICLE{10403926,
  author={He, Pei and Jiao, Licheng and Liu, Fang and Liu, Xu and Shang, Ronghua and Wang, Shuang},
  journal={IEEE Transactions on Multimedia}, 
  title={Cross-Domain Scene Unsupervised Learning Segmentation With Dynamic Subdomains}, 
  year={2024},
  volume={26},
  number={},
  pages={6770-6784},
  doi={10.1109/TMM.2024.3355629}}
```

## Acknowledgements
The code is based on the following open-source projects. We thank their authors for making the source code publicly available.
[MMSegmentation](https://github.com/open-mmlab/mmsegmentation)  
[HRDA](https://github.com/lhoyer/HRDA)  

## License
This project is released under the MIT License.
