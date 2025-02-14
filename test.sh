#!/bin/bash
CUDA_VISIBLE_DEVICES=0 /opt/conda/bin/python -m tools.test --test-set --format-only --eval-option imgfile_prefix=labelTrainIds to_label_id=False
