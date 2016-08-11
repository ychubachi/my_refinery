# Create Docker Image

## Build New Image

```bash
docker build -t ychubachi/my_refinery .
```

## Run Server

```bash
docker run -d -p 3000:3000 ychubachi/my_refine
```

## See Logs
docker ps to see $CONTAINER name.

```bash
docker logs -f $CONTAINER
```

## Stop Server

```bash
docker stop $CONTAINER
```

## Run Shell for debug etc.

```bash
docker run -it ychubachi/my_refinery /bin/bash
```

## Push to Docker hub

```bash
docker push ychubachi/my_refinery
```

# Use Docker Image

```bash
docker pull ychubachi/my_refinery
docker run -d -p 3000:3000 ychubachi/my_refinery
```
