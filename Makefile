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

# rubocop-airbnb使用時のコマンド
# コンテナ内
rubocop:
	bundle exec rubocop --require rubocop-airbnb

rubocop_a:
	bundle exec rubocop --require rubocop-airbnb -a

# コンテナ外
doc_rubo:
	docker-compose exec web bundle exec rubocop --require rubocop-airbnb

doc_rubo_a:
	docker-compose exec web bundle exec rubocop --require rubocop-airbnb -a
