# tasks
- [] create a new folder structure for the models and the code
- [] run the mixtral models at rlaplnxml2
- [] test the TheBloke models
  - [] deepseek-coder-6.7B-instruct-GGUF, run at rlapstudio
  - [] Mixtral-8x7B-Instruct-v0.1-GGUF, run at rlaplnxml2
  - [] Mixtral-8x7B-v0.1-GGUF, run at rlaplnxml2
- [] test the Trelis models 
  - [] Trelis/deepseek-coder-33b-instruct-function-calling-v2, test at rlaplnxml2 and rlapstudio


# examples with python 
# conda commands
```bash
conda create -n ai-test1 python=3.11
conda activate ai-test1
conda install pip
conda deactivate
conda remove -n ai-test1 --all
``````
# install the required packages
```bash
which python
which pip
python --version
pip install -U langchain openai transformers accelerate bitsandbytes sentence_transformers
python -m pip install -U langchain huggingface_hub transformers accelerate bitsandbytes
python -m pip install -U sentence_transformers

pip show langchain
pip uninstall langchain
python -m pip show langchain
python load_model.py

```

# load a mml model
