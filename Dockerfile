FROM mcr.microsoft.com/dotnet/sdk:7.0
RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
    && echo "Asia/Tokyo" > /etc/timezone
RUN apt-get update \
    && apt-get install --no-install-recommends -y tzdata \
    && dotnet tool install -g dotnet-repl
ENV TZ=Asia/Tokyo
ENV PATH=$PATH:/root/.dotnet/tools/
ENTRYPOINT [ "dotnet-repl" ]
