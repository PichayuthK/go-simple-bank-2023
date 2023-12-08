#
# command for development environment
#
docker-pg:
	docker run --name postgres12 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:12-alpine

docker-pg-exec:
	docker exec -ti postgres12 psql -U root


#
# command for production environment
#


.PHONY: docker-pg docker-pg-exec