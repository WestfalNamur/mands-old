postgres:
	docker run \
    	--name mands_postgres \
    	-e POSTGRES_USER=mands_user \
    	-e POSTGRES_PASSWORD=mands_pw \
    	-p 5432:5432 \
    	-d postgres:13.3-alpine \
		-c log_statement=all

# Enter the db manually
	# docker exec -it mands_postgres /bin/sh
	# psql mands_db --username=mands_user
	# \dt	
	# \q
	# exit


postgresrm:
	docker container stop mands_postgres
	docker container rm mands_postgres


createdb:
	docker exec -it mands_postgres createdb --username=mands_user --owner=mands_user mands_db


dropdb:
	docker exec -it mands_postgres dropdb --username=mands_user mands_db


migrateup:
	migrate -path app/db/migration -database "postgresql://mands_user:mands_pw@localhost:5432/mands_db?sslmode=disable" -verbose up


migratedown:
	migrate -path app/db/migration -database "postgresql://mands_user:mands_pw@localhost:5432/mands_db?sslmode=disable" -verbose down

	