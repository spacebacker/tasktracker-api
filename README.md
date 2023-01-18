# tasktracker-api

Tasktracker-api is a GraphQL api for Tasktracker project written on Ruby on Rails using API mode and PostgreSQL

## Installation

```bash
bundle install && rails db:create && rails db:migrate && rails db:seed

Set CLIENT and SERVER hostnames variables in .env
.env
    SERVER=localhost
    CLIENT=localhost:port
```

## Usage

```bash
# Start GraphQL api server
rails s

# GraphQL Playground
http://127.0.0.1:3000/graphiql

# Accounts for testing
login:
    john_smith@gmail.com
    adrienne_lockman@lindgren.co
    lamar.crona@veum.biz
    rufus.reilly@reichert.co
    antonio_costa@gmail.com
    edward@auer.info
    ivan_young@gmail.com
    lona@hyatt.org
    lelia.zulauf@mckenzie-hane.io
    terrell@kris.com
password:
    test123

# Run tests
bundle exec rspec
```