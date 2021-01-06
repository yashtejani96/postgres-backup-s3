FROM alpine:latest

ADD install.sh install.sh
RUN sh install.sh && rm install.sh

ENV POSTGRES_DATABASE **None**
ENV POSTGRES_HOST **None**
ENV POSTGRES_PORT **None**
ENV POSTGRES_USER **None**
ENV POSTGRES_PASSWORD **None**
ENV S3_ACCESS_KEY_ID **None**
ENV S3_SECRET_ACCESS_KEY **None**
ENV S3_BUCKET **None**
ENV S3_REGION **None**
ENV S3_PATH **None**
ENV S3_PREFIX **None**
ENV S3_ENDPOINT **None**
ENV S3_S3V4 **None**
ENV SCHEDULE **None**
ENV RETENTION **None**
ENV SAVE_PARMENANT_BACKUP **None**

ADD run.sh run.sh
ADD backup.sh backup.sh

CMD ["sh", "run.sh"]
