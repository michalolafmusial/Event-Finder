#!/bin/bash


docker run -it --name mysql -e MYSQL_ROOT_PASSWORD=password -p 3306:3306 -d mysql