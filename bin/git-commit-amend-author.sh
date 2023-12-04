#!/bin/bash

read -r -p "enter your name: " NAME

if [ -z "${NAME}" ]; then
    echo "name is required";
    exit 1;
fi

read -r -p "enter your email address: " EMAIL

if [ -z "${EMAIL}" ]; then
    echo "email is required";
    exit 1;
fi

git commit --amend --author="${NAME} <${EMAIL}>"
