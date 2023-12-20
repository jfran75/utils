## llama.cpp 
- [LLaMA2 Local install on MacBook](https://www.youtube.com/watch?v=TsVZJbnnaSs)

## Repos and models
- [Clone](https://github.com/ggerganov/llama.cpp)
- git clone https://github.com/ggerganov/llama.cpp llamaapp.cpp
- update 
  - cd llamaapp.cpp && git pull && make

## build llama.cpp
- this will create a script called main and quantize and others
```
cd llamaapp.cpp
make
```

## after build llama.cpp
- you need a python virtual environment
```
conda create -n llama.cpp python=3.11
conda activate llama.cpp
conda deactivate
conda list
conda info
conda info --envs
conda env list
conda env remove --name llama.cpp
conda install python={python_version}

## install the requirements
which python3
python3 -m pip install -r requirements.txt

```

## for clone large repositories install git-lfs
```
  brew install git-lfs
  git lfs install

  # Update global git config
  $ git lfs install

  # Update system git config
  $ git lfs install --system
```

## convert the models
- the folder path "meta_models" contains the original models
```
python3 convert.py --outfile models/7B/ggml-model-f16.bin --outtype f16 ../meta_models/llama-2-7b-chat
python3 convert.py --outfile models/13B/ggml-model-f16.bin --outtype f16 ../meta_models/llama-2-13b-chat

# quantize the model is going to reduce the size of the model
./quantize  ./models/7B/ggml-model-f16.bin ./models/7B/ggml-model-q4_0.bin q4_0
./quantize  ./models/13B/ggml-model-f16.bin ./models/13B/ggml-model-q4_0.bin q4_0

# main is the script that will run the model that was quantized
./main -m ./models/7B/ggml-model-q4_0.bin -n 1024 --repeat_penalty 1.0 --color -i -r "User:" -f ./prompts/chat-with-bob.txt
./main -m ./models/7B/ggml-model-q4_0.bin -n 1024 --repeat_penalty 1.0 --color -i -r "User:" -f ./prompts/vb6/alpaca.txt
./main -m ./models/7B/ggml-model-q4_0.bin -n 1024 --repeat_penalty 1.0 --color -i -r "User:" -f ./prompts/vb6/alpaca2.txt

# 13B
./main -m ./models/13B/ggml-model-q4_0.bin -n 1024 --repeat_penalty 1.0 --color -i -r "User:" -f ./prompts/chat-with-bob.txt
./main -m ./models/13B/ggml-model-q4_0.bin -n 1024 --repeat_penalty 1.0 --color -i -r "User:" -f ./prompts/vb6/alpaca.txt
./main -m ./models/13B/ggml-model-q4_0.bin -n 1024 --repeat_penalty 1.0 --color -i -r "User:" -f ./prompts/vb6/alpaca2.txt

```

## create a new prompt
```
./main -m ./models/7B/ggml-model-q4_0.bin --color --instruct --temp 0.1 --top_k 40 --top_p 0.95 --ctx_size 2048 --n_predict -1 --keep -1 -i -r "USER:" -p "You are a helpful visual basic 6 and c# expert programmer. dont try to keep the syntax as close as possible to the original VB6 code. dont give an explanation USER: prompt goes here PROGRAMMER:"

./main -m ./models/7B/ggml-model-q4_0.bin --color --instruct --temp 0.1 --top_k 40 --top_p 0.95 --ctx_size 2048 --n_predict -1 --keep -1 -i -r "USER:" -f ./prompts/vb6/alpaca3.txt

./main -m ./models/13B/ggml-model-q4_0.bin --color --instruct --temp 0.1 --top_k 40 --top_p 0.95 --ctx_size 2048 --n_predict -1 --keep -1 -i -r "USER:" -f ./prompts/vb6/alpaca3.txt

```

## questions test
```
can you write a javascript function to find prime numbers ?
translate to c#
translate to rust


do you have aknowledge of the following languages visual basic 6 ?


./llamaapp.cpp/main -m /Volumes/local-data/.cache/lm-studio/models/TheBloke/deepseek-coder-6.7B-instruct-GGUF/deepseek-coder-6.7b-instruct.Q8_0.gguf --color --instruct --temp 0.0 --top_k 40 --top_p 0.95 --ctx_size 2048 --n_predict -1 --keep -1 -i -r "User:" -f ../prompts/models/deepseek-coder-6.7B-instruct-GGUF/prompt_vb6.txt

## run the server
./llamaapp.cpp/server -m /Volumes/local-data/.cache/lm-studio/models/TheBloke/deepseek-coder-6.7B-instruct-GGUF/deepseek-coder-6.7b-instruct.Q8_0.gguf --ctx_size 2048

./llamaapp.cpp/server -m /Volumes/local-data/.cache/lm-studio/models/Safurai/Safurai-Csharp-34B-GGUF/safurai-csharp-34b.gguf.q4_k_m.bin --ctx_size 2048

scp -r /Volumes/local-data/.cache/lm-studio/models/Safurai jchinchillas@rlaplnxml2:~/proyectos/rlab/utils/ai/llm_models
scp -r /Volumes/local-data/.cache/lm-studio/models/TheBloke jchinchillas@rlaplnxml2:~/proyectos/rlab/utils/ai/llm_models


```
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh