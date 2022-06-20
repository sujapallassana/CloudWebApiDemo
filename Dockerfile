FROM mcr.microsoft.com/dotnet/sdk:5.0-focal AS build
WORKDIR /src
COPY ["CloudWebApiDemo.csproj", "./"]
RUN dotnet restore "./CloudWebApiDemo.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "CloudWebApiDemo.csproj" -c Release -o /app/build
FROM build AS publish
RUN dotnet publish "CloudWebApiDemo.csproj" -c Release -o /app/publish
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "CloudWebApiDemo.dll"]
