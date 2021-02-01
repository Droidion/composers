FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build-env
WORKDIR /DockerSource

# Copy csproj/fsproj and restore as distinct layers
COPY *.sln .
COPY Site/*.csproj ./Site/
COPY Models/*.csproj ./Models/
COPY Helpers/*.fsproj ./Helpers/
COPY Helpers.Tests/*.csproj ./Helpers.Tests/
COPY Data/*.csproj ./Data/
RUN dotnet restore

# Copy everything else and build
COPY Site/. ./Site
COPY Models/. ./Models
COPY Helpers/. ./Helpers
COPY Helpers.Tests/. ./Helpers.Tests
COPY Data/. ./Data
RUN dotnet publish -c release -o /DockerOutput/Site -r linux-x64

# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:5.0
WORKDIR /DockerOutput/Site
COPY --from=build-env /DockerOutput/Site ./
ENTRYPOINT ["dotnet", "Site.dll"]