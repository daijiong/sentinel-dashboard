FROM openjdk:8-jre-slim
LABEL author="daijiong"
ENV TZ=PRC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN mkdir -p /sentinel-dashboard
WORKDIR /sentinel-dashboard
EXPOSE 8858
ADD ./target/sentinel-dashboard.jar ./
CMD sleep 10;java -Dfile.encoding=utf-8 -Djava.security.egd=file:/dev/./urandom -Dserver.port=8858 -Dproject.name=sentinel-dashboard -jar sentinel-dashboard.jar