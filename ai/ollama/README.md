## ollama docs

- [ollama](https://github.com/jmorganca/ollama)

```
curl http://localhost:11434/api/generate -d '{
"model": "llama2",
"prompt":"tell me a joke",
"stream": false
}'

docker-compose up -d

```

## run ollama rlaplnx2

```
ssh jchinchillas@rlaplnxml2
cd ~/repos/utils/ai/ollama
docker compose ps
docker compose up -d
```
