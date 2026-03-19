#!/bin/bash
set -ex
export JAVA_HOME=/opt/qualys/java/jdk17
/opt/qualys/maven/apache-maven-3.6.3/bin/mvn -gs settings.xml clean package




