FROM mcr.microsoft.com/powershell:ubuntu-18.04
RUN apt-get update && \
apt-get install -y wget && \
apt-get install -y vim && \
apt-get install gnupg2 -y && \
apt-get install software-properties-common -y && \
apt-get install zip -y && \
apt-get install git -y && \
DEBIAN_FRONTEND=noninteractive apt-get install awscli -y
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN apt-add-repository https://packages.microsoft.com/ubuntu/18.04/prod
RUN apt-get update
RUN apt-get install dotnet-sdk-3.1 -y
RUN mkdir /lambda
WORKDIR /lambda
COPY setup.ps1 /lambda
RUN pwsh setup.ps1
RUN rm setup.ps1
COPY create-project.ps1 /lambda
CMD tail -f /dev/null
