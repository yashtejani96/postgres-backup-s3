# postgres-backup-s3

Backup PostgresSQL to S3 (supports periodic backups)

## Usage

Docker:
```sh
$ docker run -e S3_ACCESS_KEY_ID=key -e S3_SECRET_ACCESS_KEY=secret -e S3_BUCKET=my-bucket -e S3_PREFIX=backup -e POSTGRES_DATABASE=dbname -e POSTGRES_USER=user -e POSTGRES_PASSWORD=password -e POSTGRES_HOST=localhost  e- RETENTION='5 day ago'
   e-  SAVE_PARMENANT_BACKUP='10 12 30'  thetejani/postgres-backup-s3-retantion:11
```

Docker Compose:
```yaml
postgres:
  image: postgres
  environment:
    POSTGRES_USER: user
    POSTGRES_PASSWORD: password

pgbackups3:
  image: thetejani/postgres-backup-s3-retantion:11
  links:
    - postgres
  environment:
    SCHEDULE: '@daily'
    S3_REGION: region
    S3_ACCESS_KEY_ID: key
    S3_SECRET_ACCESS_KEY: secreti
    S3_BUCKET: my-bucket
    S3_PREFIX: backup
    POSTGRES_DATABASE: dbname
    POSTGRES_USER: user
    POSTGRES_PASSWORD: password
    POSTGRES_EXTRA_OPTS: '--schema=public --blobs'
    RETENTION '5 day ago'
    SAVE_PARMENANT_BACKUP '10 12 30'
```
-> Images are tagged by the major PostgreSQL version they support: 9, 10, or 11.


### Automatic Periodic Backups

You can additionally set the `SCHEDULE` environment variable like `-e SCHEDULE="@daily"` to run the backup automatically.
You can additionally set the `delete` bakup from bucket, variable like `-e RETENTION='5 day ago'` that means save only 5 days data into bucket. Moreover, if you don't delete the data for life time than also provide a `SAVE_PARMENANT_BACKUP`, variable like `-e SAVE_PARMENANT_BACKUP='10 15 20'`. This is a date, which is also help to the save a permanent backup.
 
More information about the scheduling can be found [here](http://godoc.org/github.com/robfig/cron#hdr-Predefined_schedules).


