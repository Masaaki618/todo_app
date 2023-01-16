build:
	docker-compose build

up:
	docker-compose up -d

up_log:
	docker-compose up

stop:
	docker-compose stop

db_:
	docker-compose exec web rails db:create db:migrate

down:
	docker-compose down -v

bash:
	docker-compose exec web bash

all_dell:
	docker system prune --all

rspec:
	docker-compose exec web bundle exec rspec spec
