FROM ubuntu:21.04

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install openjdk-11-jdk git locales

RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen

RUN git clone https://github.com/lokedhs/array
RUN cd array && ./gradlew client-java:installDist

COPY evalexpr.sh .
RUN chmod +x evalexpr.sh

CMD ["./evalexpr.sh"]
