#!/usr/bin/env bash

name="lukauskas/bokeh"
docker push "${name}:latest";

for version in $(cat STABLE_VERSIONS); do
    tag="-t ${name}:$version";
    docker push ${tag};
done

docker push "${name}:dev";

for version in $(cat DEV_VERSIONS); do
    tag="-t ${name}:$version";
    docker push ${tag};
done