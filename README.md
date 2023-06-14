# pgAdmin 4

## Docker image that can be configured through environment variables. For development purposes only.

### Sample usage with docker-compose

```
version: "3.9"
services:
  db:
    image: postgres
    restart: always
    environment:
      POSTGRES_USER: example
      POSTGRES_PASSWORD: example

  pgadmin:
    build: .
    restart: always
    environment:
      POSTGRES_HOST: db
      POSTGRES_USER: example
      POSTGRES_PASSWORD: example
    ports:
      - 8081:80
```

Then simply navigate to http://localhost:8081. No login required, ne setup required, your db is availaible and ready to be used.

### Build
docker build . -t newlogic42/pgadmin4
docker login
docker push newlogic42/pgadmin4
