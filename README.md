Not actively maintained - please fork

# docker-bokeh
Dockerfiles for running bokeh in Docker.
Builds for most recent docker releases (both stable and dev) are generated.

To run the latest stable release do:

```
docker run -p 5100:5100 lukauskas/bokeh:latest 
```
To run latest dev release, use the tag `dev`. 
For specific version number, just use the version number as a tag.

The command above will map the container port 5100 to port 5100 of the host machine. Adjust it as appropriate.
By default you should be able to access the bokeh visualisation at http://172.0.0.1:5100.

Two environment variables are supported:

  * `PREFIX` - gets passed to `--prefix` in `bokeh serve`
  * `ORIGIN` - passed to `--allow-websocket-origin`. 
 
Adjust `ORIGIN` as appropriate for your application. This should be equal to FQDN plus port of the frontend of your application.
For instance, if the application will be hosted on `http://www.example.com:1234` the ORIGIN variable should be `ORIGIN=www.example.com:1234`. If it is set incorrectly, `bokeh` will refuse any connections to websockets  and therefore no visualisations wil work.
  
Environment variable example:

```
docker run -p 5100:5100 -e PREFIX=foo -e ORIGIN=www.example.com:5100 lukauskas/bokeh:latest 
```

Will allow one to access the visualisation at www.example.com:5100/foo/app
