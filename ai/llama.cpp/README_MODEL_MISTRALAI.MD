# info about mistralai models

## mixtral-instruct-8x7b
- folder path: /Volumes/local-data/repos/utils/ai/meta_models/mistralai/models/mixtral-instruct-8x7b
```
la /Volumes/local-data/repos/utils/ai/meta_models/mistralai/models/mixtral-instruct-8x7b
```
# [before run must have to activate conda environment](./README.md#after-build-llamacpp)
# [and install git-lfs](./README.md#for-clone-large-repositories-install-git-lfs)
```
# define environment vars the path to the model
export REPOSITORY_FOLDER_PATH=/Volumes/local-data/repos/utils/ai/meta_models/mistralai/models/mixtral-instruct-8x7b
export CONVERT_MODEL_PATH=$REPOSITORY_FOLDER_PATH/ggml-model-f16.gguf
export QUANTIZE_MODEL_PATH=$REPOSITORY_FOLDER_PATH/ggml-model-q4_0.gguf
echo $REPOSITORY_FOLDER_PATH
echo $CONVERT_MODEL_PATH
echo $QUANTIZE_MODEL_PATH

# clone
git clone https://huggingface.co/mistralai/Mixtral-8x7B-Instruct-v0.1 $REPOSITORY_FOLDER_PATH

# change to the folder
cd /Volumes/local-data/repos/utils/ai/llama.cpp/llamaapp.cpp
la $REPOSITORY_FOLDER_PATH
la $CONVERT_MODEL_PATH
la $QUANTIZE_MODEL_PATH

# convert to F16 GGUF
python3 convert.py $REPOSITORY_FOLDER_PATH/ \
         --outfile $CONVERT_MODEL_PATH \
         --outtype f16

# quantize to Q4_0
./quantize $CONVERT_MODEL_PATH \
           $QUANTIZE_MODEL_PATH \
           q4_0
```

```
./main \
  -m $QUANTIZE_MODEL_PATH \
  -p "[INST] Prove that sqrt(2) is rational number. [/INST]" \
  --repeat_penalty 1 \
  --no-penalize-nl \
  --color --temp 0 -c 4096 -n -1 
```