## 
- [LLaMA2 Local install on MacBook](https://www.youtube.com/watch?v=TsVZJbnnaSs)

## Repos and models
- [Request access](https://ai.meta.com/resources/models-and-libraries/llama-downloads/)
- [Clone](https://github.com/facebookresearch/llama)
  - contains the download script
- [Clone](https://github.com/ggerganov/llama.cpp)

## build llama.cpp
- this will create a script called main and quantize and others
```
cd llama.cpp
make
```

## after build llama.cpp
- you need a python virtual environment
```
conda create -n llama2
conda activate llama2
conda deactivate
conda list
conda info
conda info --envs
conda env list
conda env remove --name llama2
conda install python={python_version}

## install the requirements
python3 -m pip install -r requirements.txt

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


```