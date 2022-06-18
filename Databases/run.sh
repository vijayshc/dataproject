docker stop carpostgres
docker rm carpostgres
docker image remove carpostgres

docker build -t carpostgres .
docker run --name carpostgres -p 5432:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -d carpostgres
