#!/usr/bin/env bash
set -e
latest=true
name="lukauskas/bokeh"
for version in $(cat STABLE_VERSIONS); do
    tag="-t ${name}:$version";
    alpine_tag="-t ${name}:${version}-alpine"

    if [ ${latest} = true ] ; then
        tag="${tag} -t ${name}:latest";
        alpine_tag="${alpine_tag} -t ${name}:latest-alpine"
    fi
    docker build --build-arg VERSION=${version} docker ${tag};

    docker build -f docker/Dockerfile.alpine --build-arg VERSION=${version} docker ${alpine_tag};

    latest=false;
done

for version in $(cat DEV_VERSIONS); do
    tag="-t ${name}:$version";
    alpine_tag="-t ${name}:${version}-alpine"

    if [ ${latest} = true ] ; then
        tag="${tag} -t ${name}:dev";
        alpine_tag="${alpine_tag} -t ${name}:dev-alpine"
    fi

    docker build --build-arg VERSION=${version} docker ${tag};
    docker build -f docker/Dockerfile.alpine --build-arg VERSION=${version} docker ${alpine_tag};

    latest=false;
done
