#!/bin/bash

dotnet restore
dotnet build -c Release --no-restore ./src/IutAmiens.ProgReseau.Intro
dotnet publish -c Release --no-build ./src/IutAmiens.ProgReseau.Intro -o artifact
docker-compose build
docker-compose up
