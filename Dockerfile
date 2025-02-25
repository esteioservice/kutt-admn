FROM registry.gitlab.com/ugleiton/kutt-admin:base
ENV PYTHONUNBUFFERED 1

WORKDIR /app
COPY . /app/

RUN chmod ug+x gunicorn_start.sh

EXPOSE 8000

HEALTHCHECK CMD (curl --fail http://localhost:8000/) || exit 1

CMD ["sh","/app/gunicorn_start.sh"]
