#!/bin/bash
#echo "开始编译docker 镜像"
##docker  --verison
#
#docker build -f docker/Dockerfile -t 127.0.0.1:5555/testdemo:v1.0 .
#docker push 127.0.0.1:5555/testdemo:v1.0

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


# 服务名称
SERVER_NAME=jenkins

# 源jar名称，mvn打包之后，target目录下的jar包名称
JAR_NAME=xiaobo_demo1-1.0-SNAPSHOT

# jenkins下的目录
JENKINS_HOME=/var/jenkins_home/workspace/xiaobo_test1

# 等待三秒
echo sleep 3s
sleep 1
echo sleep 2s
sleep 1
echo sleep 1s
sleep 1

echo "结束进程完成"

cd $JENKINS_HOME/target

cp $JENKINS_HOME/deploy/docker/Dockerfile $JENKINS_HOME/target

# 修改文件权限
chmod 755 $JAR_NAME.jar

echo "看看docker能不能用"
docker -v

echo "停止容器"
# 停止容器
docker stop springboot

echo "删除容器"
# 删除容器
docker rm springboot
echo "删除镜像"
# 删除镜像
docker rmi springboot
echo "打包镜像"
# 打包镜像
#docker build -t springboot .
docker build -t 127.0.0.1:5555/springboot:v1.0 .
echo "镜像推送"
docker push 127.0.0.1:5555/springboot:v1.0
echo "运行镜像"
# 运行镜像
docker run -d -p 8888:8888 --name springboot springboot