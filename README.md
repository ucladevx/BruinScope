# BruinScope

## Overview

BuinScope aims to be the premiere location for all things related to 
technical job interviews for Bruins at UCLA. This repository contains
the main source code for BruinScope.

Ruby version: 5.0.1

Dependencies: Ruby >= 2.3.0, postgreSQL >= 9.6.2

## Documentation:

https://github.com/ucladevx/bruinscope/wiki

## Deployment Instructions:

Download the project:
`$ git clone https://github.com/ucladevx/bruinscope.git`

Install ruby gems:
`$ bundle install`

Initialize postgreSQL: This can be done through the command line, or through the Postgres app (https://postgresapp.com/). NOTE: Be sure to create the user and password for postgreSQL as specified in config/database.yml 

To give the right permissions to bruinscope user run the following command:
`$ createuser -P -d -s -e bruinscope`

Create databases:
`$ rails db:create`

Drop databases:
`$ rails db:drop`

Start postgreSQL databases: This can be done through the command line, or through the Postgres app

Migrate database:
`$ rails db:migrate`

Start the server:
`$ rails s`

## Additional Production Instructions:
Add `export POMILY_DATABASE_PASSWORD="THE_PASSWORD"` to the ~/.bashrc file

