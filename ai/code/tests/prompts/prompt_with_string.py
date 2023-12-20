# python prompt_with_string.py
from langchain.prompts import PromptTemplate

template = """Question: {question}

Answer: Let's think step by step."""

prompt = PromptTemplate(template=template, input_variables=["question"])
question = "this is a question"

print(prompt.format(question=question))
