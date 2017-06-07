FROM na:onbuild

# 拷贝 复制操作建议使用 可使用通配符 * ? 等匹配
# COPY *.js /tmp/

# 可以使用链接文件 权限600 
# 本地文件是压缩包时用 可以自动解压缩到目标路径 缓存失效
# ADD shop.tar.gz /tmp/

ENV PORT 8080
# 只是为了告诉别人需要开放8080端口 
# 另外就是docker run -P 指定随机端口映射到此端口
EXPOSE $PORT

# 入口点 常用作运行容器的初始化操作  会覆盖cmd
# ENTRYPOINT echo entrypoint you can use sth.sh replaced

# 环境变量 在dockerfile中各层中并且container中可以使用变量
# 使用变量 外部可以使用docker run -e "NODE_VERSION=8.0.0" 修改
# ENV NODE_VERSION 7.2.0


# dockerfile中的环境参数 进入container以后不可用
# 在使用docker build 的时候可以使用 --build-arg "TMP_ENV=ccc"修改
# CMD中也无效
# ARG TMP_ENV="arg only in dockfile"
# RUN echo $TMP_ENV

# 匿名卷
# 写向/data数据其实是host 机器
VOLUME /data

# 添加用户组与用户 alpine 下使用addgroup 与 adduser 
# 添加用户组id1001名称team  添加用户 ID是 －u 1001 组是 -G team 登陆shell是 -s /bin/sh 不要密码 －D 名称 lee
# RUN addgroup -g 1001 team && adduser -u 1001 -G team -s /bin/sh -D lee
# 切换用户
# USER lee
# RUN id -un



# 健康检查 轮训5s 超时3s响应说明no Healthy
# RUN apk add --no-cache curl
# HEALTHCHECK --interval=5s  --timeout=3s \
#             CMD curl -s http://locahost/$PORT || exit 1

CMD echo $PORT && npm start
