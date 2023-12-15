## ollama docs

- [ollama](https://github.com/jmorganca/ollama)

```
curl http://localhost:11434/api/generate -d '{
"model": "llama2",
"prompt":"tell me a joke",
"stream": false
}'

```

## run ollama rlaplnxml2

```
ssh jchinchillas@rlaplnxml2
cd ~/repos/utils/ai/ollama
mkdir ollama # you must have this folder before run docker compose
docker compose ps
docker compose up
docker compose up -d

docker-compose exec ollama ollama pull llama2 ## pull model

docker compose down
docker compose restart
docker compose logs
docker compose exec ollama bash
docker compose exec chatgpt sh
http://rlaplnxml2
```
