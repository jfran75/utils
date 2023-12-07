## oobabooga web ui

## install local
```
cd /Volumes/local-data/tutoriales/AI/oobabooga_web_ui
conda create -n textgen-ui python=3.10.10
conda activate textgen-ui
which python

git clone https://github.com/oobabooga/text-generation-webui.git textgen-ui
cd textgen-ui
python -m pip install -r requirements.txt
pip install -U --pre torch torchvision -f https://download.pytorch.org/whl/nightly/cpu/torch_nightly.html

python server.py --threads 8

navigate: http://localhost:7860/
go to model tab an download the models
for download the models you need to set the modelid from [huggingface](../README.md#hugging-face)
example: lmsys/vicuna-13b-v1.5
set the main parameters
  - temperature: 0.2
```

## deactivate
```
conda deactivate
```