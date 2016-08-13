docker images | awk '{print }' | tail -n +2 | xargs docker rmi
