#!/bin/bash
echo "开始编译docker 镜像"
#docker  --verison
docker build -f docker/Dockerfile -t testdemo:v1.0 .
docker run -d -p 8888:8888 --name xiaobo-app testdemo:v1.0