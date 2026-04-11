#!/usr/bin/env bash

# Running a spring shell project in Intellij is a problem
# because the run window is not a full interactive terminal.

# Create a run configuration referencing this script.

clear
./mvnw --quiet spring-boot:run -Dspring-boot.run.profiles=local
