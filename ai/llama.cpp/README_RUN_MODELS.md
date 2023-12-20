## run llama.cpp server at rlapstudio
```
export MODEL_FOLDER_PATH=/Volumes/local-data/.cache/lm-studio/models/TheBloke/deepseek-coder-6.7B-instruct-GGUF
export MODEL_NAME=deepseek-coder-6.7b-instruct.Q8_0.gguf
export MODEL_PATH=$MODEL_FOLDER_PATH/$MODEL_NAME
export PROMPT_FOLDER_PATH=/Volumes/local-data/repos/utils/ai/prompts/TheBloke/deepseek-coder-6.7B-instruct-GGUF/vb6_select_clause
export PROMPT_NAME=prompt_vb6_select_clause1.txt
export PROMPT_PATH=$PROMPT_FOLDER_PATH/$PROMPT_NAME
echo $MODEL_PATH
echo $PROMPT_PATH
la $MODEL_PATH
la $PROMPT_PATH

# run sinle prompt
./llamaapp.cpp/main -m $MODEL_PATH --color --instruct --temp 0.0 --top_k 40 --top_p 0.95 --ctx_size 2048 --n_predict -1 --keep -1 -i -r "User:" -f $PROMPT_PATH

## run the server
./llamaapp.cpp/server -m $MODEL_PATH  --ctx_size 2048

```

## run llama.cpp server at rlaplnxml2
```
cd ~/proyectos/rlab/utils/ai
tree ~/proyectos/rlab/utils/ai/llm_models

export MODEL_FOLDER_PATH=~/proyectos/rlab/utils/ai/llm_models/TheBloke/deepseek-coder-6.7B-instruct-GGUF
export MODEL_NAME=deepseek-coder-6.7b-instruct.Q8_0.gguf
export MODEL_PATH=$MODEL_FOLDER_PATH/$MODEL_NAME
export PROMPT_FOLDER_PATH=~/proyectos/rlab/utils/ai/prompts/TheBloke/deepseek-coder-6.7B-instruct-GGUF/vb6_select_clause
export PROMPT_NAME=prompt_vb6_select_clause1.txt
export PROMPT_PATH=$PROMPT_FOLDER_PATH/$PROMPT_NAME
cd ~/proyectos/rlab/utils/ai/llama.cpp/llamaapp.cpp
echo $MODEL_PATH
echo $PROMPT_PATH

la $MODEL_PATH
la $PROMPT_PATH

## run the server
conda activate llama.cpp && which python
./server -m $MODEL_PATH  --ctx_size 2048

./server -m $MODEL_PATH  --ctx_size 2048 --host rlaplnxml2 --port 8080 --threads 8

--mlock
--batch-size 

# run single prompt
./llamaapp.cpp/main -m $MODEL_PATH --color --instruct --temp 0.0 --top_k 40 --top_p 0.95 --ctx_size 2048 --n_predict -1 --keep -1 -i -r "User:" -f $PROMPT_PATH


docker pull ghcr.io/ggerganov/llama.cpp:full

docker run --name test-llama-cpp -d -p 8080:80 ghcr.io/ggerganov/llama.cpp:full


docker run --rm \
docker run --rm -it \
  -v $(pwd)/llm_models:/models \
  --entrypoint '/app/server' \
  ghcr.io/ggerganov/llama.cpp:full \
  --model /models/TheBloke/deepseek-coder-6.7B-instruct-GGUF/deepseek-coder-6.7b-instruct.Q8_0.gguf \
  --ctx_size 2048 
  
docker run --rm -it \
  -v $(pwd)/llm_models:/models \
  ghcr.io/ggerganov/llama.cpp:full \
  --server \
  --model /models/TheBloke/deepseek-coder-6.7B-instruct-GGUF/deepseek-coder-6.7b-instruct.Q8_0.gguf \
  --ctx_size 2048 

docker run -v $(pwd)/llm_models:/models ghcr.io/ggerganov/llama.cpp:light -m /models/TheBloke/deepseek-coder-6.7B-instruct-GGUF/deepseek-coder-6.7b-instruct.Q8_0.gguf -p "do you know about csharp?"

docker run --rm -it -v $(pwd)/llm_models:/models ghcr.io/ggerganov/llama.cpp:light --server -m /models/TheBloke/deepseek-coder-6.7B-instruct-GGUF/deepseek-coder-6.7b-instruct.Q8_0.gguf -c 2048 -ngl 43 -mg 1 --port 8080 --prompt "do you know about csharp?"

  --n_predict -1 \
docker ps -a
```