# Homegear docker image.
#
# VERSION 0.0.1

FROM debian:jessie

MAINTAINER Michael Hammer <https://github.com/michael-hammer>

RUN apt-get update
RUN apt-get install -y apt-transport-https wget nano
RUN wget https://homegear.eu/packages/Release.key && apt-key add Release.key && rm Release.key
RUN echo 'deb https://homegear.eu/packages/Debian/ jessie/' >> /etc/apt/sources.list.d/homegear.list
RUN apt-get update
RUN apt-get install -y homegear homegear-homematicbidcos

VOLUME /etc/homegear

EXPOSE 2001

CMD service homegear restart && bash
