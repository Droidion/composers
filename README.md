# Composers Distilled

![Screenshot](Docs/screenshot.png)

Curated structured lists of classical music periods, composers, genres, works and recordings with links to streaming services.

Read about [the idea](Docs/idea.md).

See design in [Figma](https://www.figma.com/file/YNiFyHcnkGEP7afuYFAinX/Composers?node-id=0%3A1).

Stack is .NET 5, C#, F#, Postgres, Docker.

## How to run with Docker

You need Postgres 12 database up and running somewhere on host or remotely. Earlier versions may or may not work.

You need to provide environment variable with the connection string for Postgres. 

Create `composers.env` file in solution folder (root folder), set up hostname, username and database name:

```
ConnectionStrings:PostgresConnection=Host=host.docker.internal;Username=foobar;Database=composers
```

Have `docker` and `docker-compose` installed.

Then run

```shell
$ docker-compose up -d
```