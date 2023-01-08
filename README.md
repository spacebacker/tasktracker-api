# tasktracker-api

Tasktracker-api is a GraphQL api for Tasktracker project written on Ruby on Rails using API mode and PostgreSQL

## Installation

```bash
bundle install && rails db:create && rails db:migrate
```

## Usage

```bash
# Start GraphQL api server
rails s

# GraphQL Playground
http://127.0.0.1:3000/graphiql

# run tests
bundle exec rspec
```