
run:
	go run ./cmd/api
migrate-last:
	migrate -path ./migrations -database "postgres://greenlight:pa55word@localhost:5432/greenlight?sslmode=disable" up
compose:
	docker compose up -d --build