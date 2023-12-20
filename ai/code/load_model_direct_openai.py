import openai
from langchain.prompts import PromptTemplate

client = openai.OpenAI(
    base_url="http://localhost:8080/v1", # "http://<Your api-server IP>:port"
    api_key = "sk-no-key-required"
)

prompt = PromptTemplate.from_file("prompt_vb6_select_clause3.txt")
print(f"prompt: {prompt.format()}")

# model="text-davinci-003",
completion = client.chat.completions.create(
model="gpt-3.5-turbo",
messages=[
    {"role": "system", "content": "You are an AI programming assistant, utilizing the Deepseek Coder model, developed by Deepseek Company, and you only answer questions related to computer science. For politically sensitive questions, security and privacy issues, and other non-computer science questions, you will refuse to answer."},
    {"role": "user", "content": f"{prompt.format()}"}
]
)

# print(completion)
print(completion.choices[0].message)