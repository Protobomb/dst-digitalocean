#!/usr/bin/env bash
docker run -it -v ${HOME}/src:/src -v ${HOME}/.aws/:/home/`whoami`/.aws -w /src dst-aws:latest /bin/bash
