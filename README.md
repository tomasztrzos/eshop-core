# Engineering Thesis: eshop-core
### Tomasz Trzos
### Student of Polish-Japanese Academy of Information Technology

## License

© 2018 Tomasz Trzos all rights reserved.

## General Information

- Ruby 2.5.3
- Rails 5.2.2
- MySQL 7.6
- Docker 18.06.1
- Google Cloud Platform

## API documentation

1. Download application

https://www.getpostman.com/

2. Import `eshop-core-gcp.postman_collection.json` from `/postman_documentation`

## Installation

1. Get the code. Clone git repository.

2. Download and install Docker

https://www.docker.com/products/docker-engine

3. To run the project:

```
bundle exec passenger start
```

## Running the tests

1. You can run all tests using this command:

```
rspec spec
```

2. You can use 'guard' gem to monitor changes in your code and runs tests automatically:

```
bundle exec guard
``
