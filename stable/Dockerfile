FROM python:3.6

ENV VERSION=0.12.10

RUN pip install --upgrade pip \
    && pip install --pre -i https://pypi.anaconda.org/bokeh/channel/dev/simple --extra-index-url https://pypi.python.org/simple/ bokeh==$VERSION \
    && rm -rf ~/.cache/pip

# Add entrypoint (this allows variable expansion)
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENV ORIGIN="127.0.0.1:5100" PORT="5100" PREFIX=""

COPY ./app /app
ENTRYPOINT ["./entrypoint.sh"]
