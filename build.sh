#!/usr/bin/env bash
latest=true
name="lukauskas/bokeh"
for version in $(cat STABLE_VERSIONS); do
    tag="-t ${name}:$version";

    if [ ${latest} = true ] ; then
        tag="${tag} -t ${name}:latest";
    fi

    docker build --build-arg VERSION=${version} docker ${tag};

    latest=false;
done

for version in $(cat DEV_VERSIONS); do
    tag="-t ${name}:$version";

    if [ ${latest} = true ] ; then
        tag="${tag} -t ${name}:dev";
    fi

    docker build --build-arg VERSION=${version} docker ${tag};

    latest=false;
done