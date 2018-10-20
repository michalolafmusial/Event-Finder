#!/bin/bash

cd ..

mkdir -p src/main/java 	        #   Application/Library sources
mkdir -p src/main/resources     #	Application/Library resources
mkdir -p src/main/resources/META-INF
mkdir -p src/main/filters 	    #   Resource filter files
mkdir -p src/main/webapp 	    #   Web application sources
mkdir -p src/main/webapp/WEB-INF
mkdir -p src/test/java 	        #   Test sources
mkdir -p src/test/resources 	#   Test resources
mkdir -p src/test/filters 	    #   Test resource filter files
mkdir -p src/it 	            #   Integration Tests (primarily for plugins)
mkdir -p src/assembly 	        #   Assembly descriptors
mkdir -p src/site 	            #   Site