sudo docker build -t "registry.cn-shanghai.aliyuncs.com/peter159/docker-apache-perl:3.0" \
     -f Dockerfile \
     --network host \
     .

# sudo docker build -t "registry.cn-shanghai.aliyuncs.com/peter159/jupyterhub:code-complete2.0" \
#      -f Dockerfile_code_complete \
#      --network host \
#      --build-arg HTTP_PROXY=http://127.0.0.1:12333 \
#      --build-arg HTTPS_PROXY=https://127.0.0.1:12333 \
#      .
