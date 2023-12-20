from langchain.prompts import PromptTemplate
from langchain.chains import LLMChain
# from transformers import AutoModel
import os
os.environ['HUGGINGFACEHUB_API_TOKEN'] = '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'

template = """Question: {question}

Answer: Let's think step by step."""

prompt = PromptTemplate(template=template, input_variables=["question"])

# print(prompt.format(question="Why did the chicken cross the road?"))
# inference = InferenceClient()
# inference.feature_extraction(..., model="paraphrase-xlm-r-multilingual-v1")

# llm_chain = LLMChain(prompt=prompt, 
#            llm=HuggingFaceHub(repo_id="TheBloke/deepseek-coder-6.7B-instruct-GGUF", 
#                     model_kwargs={"temperature":0, 
#                             "max_length":64}))


# model = AutoModel.from_pretrained("/Volumes/local-data/.cache/lm-studio/models/TheBloke/deepseek-coder-6.7B-instruct-GGUF")
# model = AutoModel.from_pretrained("TheBloke/deepseek-coder-6.7B-instruct-GGUF")

# from langchain.chat_models import ChatOpenAI

# llm = ChatOpenAI(temperature=0.5,
#                 # model="models/mistral-7b-openorca.Q8_0.gguff", 
#                 openai_api_base="http://localhost:8081", 
#                 openai_api_key="simona")

# # print(llm.predict("hi!"))

# for chunk in llm.stream("translate 'Select Case xTabla' to csharp"):
#     print(chunk.content, end="", flush=True)

from langchain.chains import LLMChain
from langchain.llms.openai import OpenAI
from langchain.prompts import PromptTemplate
from langchain.callbacks.base import BaseCallbackManager
from langchain.callbacks.streaming_stdout import StreamingStdOutCallbackHandler

callback_manager = BaseCallbackManager([StreamingStdOutCallbackHandler()])

template = """Question: {question}

Answer: Let's think step by step."""

# prompt = PromptTemplate(template=template, input_variables=["question"])
prompt = PromptTemplate.from_file("prompt_vb6_select_clause4.txt")
question = "translate 'Select Case xTabla' to csharp"
rule = """- return the convert it code in a json format.
      - example:
        - { "code": "converted code" }"""

# print(f"prompt: {prompt.format(question=question)}")
# print(f"prompt: {prompt.format(rule=rule)}")
print(f"prompt: {prompt.format()}")

llm = OpenAI(openai_api_base="http://localhost:8081",
            openai_api_key="YOUR_API_KEY",
            streaming=True,
            verbose=False)
            # callback_manager=callback_manager,
# print(llm(prompt=prompt.format(question=question)))
# print(llm(prompt=prompt.format(rule=rule)))
print(llm(prompt=prompt.format()))

# llm_chain = LLMChain(prompt=prompt, llm=llm, verbose=False)


# for chunk in llm_chain.stream("What NFL team won the Super Bowl in the year Justin Beiber was born?"):
#     print(chunk, end="", flush=True)