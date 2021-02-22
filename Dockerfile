FROM mcr.microsoft.com/dotnet/sdk:5.0.103-alpine3.13-amd64 AS build-env
WORKDIR /DockerSource

# Copy csproj/fsproj and restore as distinct layers
COPY *.sln .
COPY Site/*.csproj ./Site/
COPY Models/*.csproj ./Models/
COPY Helpers/*.fsproj ./Helpers/
COPY Helpers.Tests/*.csproj ./Helpers.Tests/
COPY Data/*.csproj ./Data/
RUN dotnet restore -r ubuntu.20.04-x64

# Copy everything else and build
COPY Site/. ./Site
COPY Models/. ./Models
COPY Helpers/. ./Helpers
COPY Helpers.Tests/. ./Helpers.Tests
COPY Data/. ./Data
RUN dotnet publish -c release -o /DockerOutput/Site

# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:5.0.3-alpine3.13-amd64
WORKDIR /DockerOutput/Site
COPY --from=build-env /DockerOutput/Site ./
ENTRYPOINT ["./Site", "Site.dll"]