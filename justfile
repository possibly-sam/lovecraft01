

test:
	echo hi

pull:
	echo docker pull postgres
	echo sudo apt-get install postgresql-client
	docker pull ollama/ollama
run:
	docker run --name my-postgres -e POSTGRES_PASSWORD=mysecretpassword -p 5432:5432 -d postgres

ps:
	docker ps

bash:
	docker exec -it my-postgres psql -U postgres

ollama:
	docker run -d --gpus=all  --network host  -v ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama

wizard:
	docker exec -it ollama ollama run wizardlm2:7b


killall:
	docker stop `docker ps -a -q`
	docker rm `docker ps -a -q`

openwebui:
	docker run -d -p 3000:8080 --add-host=host.docker.internal:host-gateway -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:main

gpu-monitor:
	watch -n 2 nvidia-smi