FROM mcr.microsoft.com/dotnet/core/aspnet:3.0-alpine
WORKDIR /app
COPY artifact/ ./
ENTRYPOINT ["dotnet", "IutAmiens.ProgReseau.Intro.dll"]