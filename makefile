#
# command for development environment
#
run-dev:
	air dev

docker-pg:
	docker run --name postgres12 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:12-alpine

docker-pg-exec:
	docker exec -ti postgres12 psql -U root

# new migration file
migration-new:
	migrate create -ext sql -dir ./src/db/migration -seq $(file_name)

#
# command for production environment
#


.PHONY: docker-pg docker-pg-exec run-dev