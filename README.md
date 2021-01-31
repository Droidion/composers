# Composers Distilled

![Screenshot](Docs/screenshot.png)

Curated structured lists of classical music periods, composers, genres, works and recordings with links to streaming services.

Read about [the idea](Docs/idea.md).

See design in [Figma](https://www.figma.com/file/YNiFyHcnkGEP7afuYFAinX/Composers?node-id=0%3A1).

Stack is .NET 5, C#, F#, Postgres, Docker.

## How to run with Docker

You need Postgres 12 database up and running somewhere on host or remotely. Earlier versions may or may not work.

You need to provide environment variable with the connection string for Postgres.

When running docker image, set it's credentials in the environment variable, like shown.

```shell
$ docker build -t site .
$ docker run --rm -it -e "ConnectionStrings:PostgresConnection=Host=host.docker.internal;Username=denis.rodionov;Database=composers" -p 5001:80 site --name site-app
```