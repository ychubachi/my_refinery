docker ps -a | awk '{print }' | tail -n +2 | xargs docker rm 
