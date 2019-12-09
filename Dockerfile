FROM mcr.microsoft.com/dotnet/core/sdk:3.0-alpine AS build
WORKDIR /app

COPY *.sln .
COPY src/IutAmiens.ProgReseau.Intro/*.csproj ./src/IutAmiens.ProgReseau.Intro/
RUN dotnet restore

COPY src/IutAmiens.ProgReseau.Intro/. ./src/IutAmiens.ProgReseau.Intro/
WORKDIR /app/src/IutAmiens.ProgReseau.Intro
RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/core/aspnet:3.0-alpine AS runtime
WORKDIR /app
COPY --from=build /app/src/IutAmiens.ProgReseau.Intro/out ./
ENTRYPOINT ["dotnet", "IutAmiens.ProgReseau.Intro.dll"]