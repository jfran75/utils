# python prompt_with_file_template.py
from langchain.prompts import PromptTemplate

prompt = PromptTemplate.from_file("./prompt_file_template.txt", input_variables=["question", "context"])
question = "this is a question"
context = "this is te context"

print(prompt.format(question=question, context=context))
