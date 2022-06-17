<<<<<<< HEAD
#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.
FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY ["CloudWebApiDemo.csproj", "CloudWebApiDemo/"]
RUN dotnet restore "CloudWebApiDemo/CloudWebApiDemo.csproj"
COPY . CloudWebApiDemo
WORKDIR "/src/CloudWebApiDemo"
RUN dotnet build "CloudWebApiDemo.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "CloudWebApiDemo.csproj" -c Release -o /app/publish

FROM base AS final
=======
FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS build-env
WORKDIR /app
# Copy csproj and restore as distinct layers
COPY *.csproj ./
RUN dotnet restore
# Copy everything else and build
COPY . ./
RUN dotnet publish -c Release -o out
# Build runtime image
FROM mcr.microsoft.com/dotnet/core/aspnet:2.2
>>>>>>> a21e29c1830c84633187f727dba53e8b88202ce4
WORKDIR /app
COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet", "CloudWebApiDemo.dll"]
