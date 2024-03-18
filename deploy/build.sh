#!/bin/bash
echo "开始编译docker 镜像"
#docker  --verison

docker build -f docker/Dockerfile -t 127.0.0.1:5555/testdemo:v1.0 .
docker push 127.0.0.1:5555/testdemo:v1.0

#echo '================Docker开始=============='
#
#echo '================登陆阿里云私有镜像仓库=============='
## 定义镜像名称
#IMAGE_NAME="xiaobo-app"
## 查看当前目录
#pwd
## 进入web目录Dockerfil所在目录下,scm-web是我项目目录，Dockerfile文件在该目录下
#cd scm-web
## 查看当前目录
#pwd
#echo "# 登陆阿里云docker私有仓库"
#docker login --username=${username} --password=${password} registry.cn-hangzhou.aliyuncs.com
#echo "# 打镜像tag"
#docker -t registry.cn-hangzhou.aliyuncs.com/hopefun/w2002:$IMAGE_NAME-${BUILD_NUMBER} $WORKSPACE/scm-web
#echo "# 推送到仓库"
#docker push registry.cn-hangzhou.aliyuncs.com/hopefun/w2002:$IMAGE_NAME-${BUILD_NUMBER}
#echo "# 删除本地镜像"
#docker rmi registry.cn-hangzhou.aliyuncs.com/hopefun/w2002:$IMAGE_NAME-${BUILD_NUMBER}
#echo "# 退出私有仓库"
#docker logout
#
#echo '================Docker结束=============='
#
#echo "部署镜像 ===============>>>>>>>>>>>>>>>>>>>>>>> registry.cn-hangzhou.aliyuncs.com/hopefun/w2002:$IMAGE_NAME-${BUILD_NUMBER}"