#!/usr/bin/env bash

TOP=.

source ${TOP}/vars/build

docker build \
    --build-arg new_user=`whoami` \
    --build-arg doctl_dl_url=${doctl_dl_url} \
    --build-arg tf_dl_url=${tf_dl_url} \
    --build-arg tg_dl_url=${tf_dl_url} \
    -t ${full_image_name}:${image_version} . 

docker tag ${full_image_name}:${image_version} ${full_image_name}:latest
