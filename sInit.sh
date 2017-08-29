#!/bin/bash
JAVA_VERSION=1.8
BOOT_VERSION=1.5.6.RELEASE
GROUP_ID=cc.coderider
CLOUD_BASE_DEPENDENCE=web,devtools,cloud-starter,cloud-security,cloud-oauth2
LANG=java
TYPE=maven-project

function init(){
    artifactId=$1;baseDir=$1 # set project folder=artifactId
    name=$2                  # project name
    description=$3           # project description 
    dependencyX=$4           # extra dependency

    curl http://start.spring.io/starter.tgz \
    -d language=${LANG} -d type=${TYPE} \
    -d javaVersion=${JAVA_VERSION} -d bootVersion=${BOOT_VERSION} -d version=1.0.0.SNAPSHOT \
    -d groupId=${GROUP_ID} -d artifactId=${artifactId} -d baseDir=${artifactId} -d name=${name} \
    -d dependencies=${CLOUD_BASE_DEPENDENCE},${dependencyX} \
    -d description=${description} \
    |tar -xzvf -
}

# example 
#init sco-registry RegistryServer "Eureka server" cloud-eureka-server
init test Test 'Test sInit' ''