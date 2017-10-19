# docker-bokeh
Dockerfiles for running bokeh in Docker.

Two versions available: stable and dev.

You can run both versions as follows:

```
docker run -p 5100:5100 lukauskas/bokeh:stable 
```

Above will map the container port 5100 to port 5100 of the host machine. Adjust it as appropriate.
By default you should be able to access the bokeh visualisation at http://172.0.0.1:5100.

Two environment variables are supported:

  * `PREFIX` - gets passed to `--prefix` in `bokeh serve`
  * `ORIGIN` - passed to `--allow-websocket-origin`. 
 
Adjust `ORIGIN` as appropriate for your application. This should be equal to FQDN plus port of the frontend of your application.
For instance, if the application will be hosted on `http://www.example.com:1234` the ORIGIN variable should be `ORIGIN=www.example.com:1234`. If it is set incorrectly, `bokeh` will refuse any connections to websockets  and therefore no visualisations wil work.
  
Environment variable example:

```
docker run -p 5100:5100 -e PREFIX=foo -e ORIGIN=www.example.com:5100 lukauskas/bokeh:stable 
```

Will allow one to access the visualisation at www.example.com:5100/foo/app
