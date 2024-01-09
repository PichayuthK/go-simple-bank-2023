#
# command for development environment
#
run-dev:
	air dev

docker-pg:
	docker run --name postgres12_simplebank -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:12-alpine

docker-createdb:
	docker exec -ti postgres12_simplebank createdb --username=root --owner=root simple_bank

docker-dropdb:
	docker exec -ti postgres12_simplebank dropdb simple_bank

sqlc:
	sqlc generate

sqlc-window:
	docker run --rm -v .:/app -w /app sqlc/sqlc generate

# new migration file
migration-new:
	migrate create -ext sql -dir ./src/db/migration -seq $(file_name)

migrateup:
	migrate -path ./src/db/migration -database "postgres://root:secret@localhost:5432/simple_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path ./src/db/migration -database "postgres://root:secret@localhost:5432/simple_bank?sslmode=disable" -verbose down

#
# command for production environment
#


.PHONY: docker-pg docker-createdb docker-dropdb run-dev sqlc sqlc-window migratedown migrateup