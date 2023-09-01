FROM mcr.microsoft.com/powershell:ubuntu-22.04
RUN apt-get update && \
apt-get install -y wget && \
apt-get install -y vim && \
apt-get install gnupg2 -y && \
apt-get install software-properties-common -y && \
apt-get install zip -y && \
apt-get install git -y && \
apt-get install dotnet-sdk-7.0 -y && \
DEBIAN_FRONTEND=noninteractive apt-get install awscli -y
RUN mkdir /lambda
WORKDIR /lambda
COPY setup.ps1 /lambda
RUN pwsh setup.ps1
RUN rm setup.ps1
COPY create-project.ps1 /lambda
CMD tail -f /dev/null
