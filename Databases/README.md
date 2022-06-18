# Databases

## Tools

1. Docker

2. Postgres

3. SQL

4. PowerBI 

5. Shell script

## Sources

We get postgres database docker image from dockerhub (https://hub.docker.com/_/postgres)


## Approach

Create data model with following tables to fulfill requirement for car store.

1. `STORE` - Contains list of stores ( Currently we have only one store but model should be extensible for future expansions )
2. `SALES_PERSON` - Contains list of sales person in the company along with their personal and employment details
3. `CARS` - List of cars characteristics and their manufacturer information 
4. `CUSTOMER` - List of customers and their information
5. `CAR_TRANSACTION` - Contains information on each of the purchase in the store. This includes sales person, car and customer involved in the transaction. Also included discount field if store want to offer any discount to the customer

Data model diagram created through PowerBI application by linking the entities. Entity relationship also marked in the data model(one to many)

After creating data mode, base docker image of postgres can be pulled and built with DDL for the car store model. `Dockerfile` in the directory calls the script `init.sh` which creates necessary tables foe data model. `run.sh` can be used as wrapper to execute all the required commands to bring up the database. 

File `insert_query.sql` contains necessary insert queries for data mockup to support the user case.

File `total_spending.sql` contains SQL to know the list of our customers and their spending

File `top_manufacturer.sql` contains SQL to find out the top 3 car manufacturers that customers bought by sales (quantity) and the sales number for it in the current month





