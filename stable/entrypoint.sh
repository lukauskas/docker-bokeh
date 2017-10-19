#!/bin/bash
bokeh serve --port ${PORT} --address 0.0.0.0 --allow-websocket-origin ${ORIGIN} /app