#第六次
FROM centos
MAINTAINER xiaobo
WORKDIR /opt/
COPY Centos-vault-8.5.2111.repo /tmp/Centos-vault-8.5.2111.repo
RUN rm -rf /etc/yum.repos.d/* \
&& mv /tmp/Centos-vault-8.5.2111.repo /etc/yum.repos.d/Centos-vault-8.5.2111.repo \
&& yum clean all && yum makecache \
&& yum -y install openssh-clients \
&& yum install -y openssh-clients \
&& echo "root:root" | chpasswd # 镜像容器的root用户密码为root \
&& echo "root    ALL=(ALL)    ALL" >> /etc/sudoer \
&& ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key \
&& ssh-keygen -t rsa -f /etc/ssh/ssh_hoset_rsa_key \
&& mkdir -p /var/run/ssh
EXPOSE 22
ADD jdk-8u212-linux-x64.tar.gz /opt/java
ADD apache-hive-2.3.9-bin.tar.gz /opt/hive
ADD hadoop-3.3.3.tar.gz /opt/hadoop
COPY /conf_dir/yarn-site.xml  /opt/hadoop/hadoop-3.3.3/etc/hadoop/yarn-site.xml
COPY /conf_dir/core-site.xml  /opt/hadoop/hadoop-3.3.3/etc/hadoop/core-site.xml
COPY /conf_dir/hdfs-site.xml  /opt/hadoop/hadoop-3.3.3/etc/hadoop/hdfs-site.xml
COPY /conf_dir/mapred-site.xml  /opt/hadoop/hadoop-3.3.3/etc/hadoop/mapred-site.xml
COPY /conf_dir/env.txt /etc/profile.d/

RUN  source /etc/profile && mkdir -p /data/hadoop/hdfs/nn&& mkdir -p /data/hadoop/hdfs/dn && mkdir -p /data/hadoop/hdfs/snn && mkdir -p /data/hadoop/yarn/nm && chmod -R 777 /data && hdfs namenode -format