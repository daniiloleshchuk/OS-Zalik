FROM ubuntu

ARG DEBIAN_FRONTEND
ARG TZ
ENV DEBIAN_FRONTEND noninteractive
ENV TZ Europe/Minsk
ENV MYSQL_PWD password
RUN echo "mysql-server mysql-server/root_password password $MYSQL_PWD" | debconf-set-selections
RUN echo "mysql-server mysql-server/root_password_again password $MYSQL_PWD" | debconf-set-selections
RUN apt-get update && apt-get install -y git maven default-jre default-jdk wget vim apt-utils mysql-server curl net-tools
COPY main_script.sh main_script.sh
CMD chmod +x main_script.sh && ./main_script.sh
