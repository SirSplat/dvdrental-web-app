# A simple web application to front the DVD Rental sample PostgreSQL database

## Python Flask and FastAPI Web Application
A web application that utilizes both Flask and FastAPI frameworks for handling different aspects of the application. The design choice avoids defining database models directly in Python code, leveraging PostgREST for database interactions instead.

## JWT Authentication
Implements JWT tokens for user authentication and authorization, with different roles like webapp_user verified through PostgREST.

## PostgREST Integration
PostgREST is used to expose PostgreSQL tables and functions as RESTful APIs, removing the need to define database models in the Python codebase.

## PgBouncer Connection Pooling
PgBouncer is utilized for efficient database connection management, pooling, and reusing connections to reduce overhead.

## Dockerized Environment
The entire stack, including the web app, PostgREST, PgBouncer, and the PostgreSQL database, is containerized and managed using Docker and Docker Compose.

## Sqitch for Database Migrations
Sqitch is employed for database schema version control, enabling smooth and controlled schema migrations.

## pgTAP Testing with pg_prove: 
pgTAP is used for writing unit tests for the PostgreSQL database, with pg_prove run in a dedicated Docker container to execute these tests.

## Example cURL command
    jwt_token=$(docker compose exec -it jwt_generator python webapp.py) && echo $jwt_token && curl -X GET -H "Authorization: Bearer ${jwt_token}" http://localhost:3000/country
