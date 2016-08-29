# youtrack
Docker image for starting standalone youtrack. Based on alpine.

## Info

* Exposed port is 8080
* Volumes to mount:
    * /youtrack/db
    * /youtrack/home/.youtrack

## How to use

If you want to just try:
```
docker run -p 10000:8080 sasol/youtrack
```
Then visit http://localhost:10000 where you will find initial setup from youtrack.

If you want to persist the data:
```
docker run -p 10000:8080 -v /path/to/your/data:/youtrack/db sasol/youtrack
```

If you already have some youtrack database, /path/to/your/data should be pointing to directory containing  folders 'hub' and 'youtrack', 
for standalone youtrack distribution you can find such folder in $USER_HOME/teamsysdata/.

Additionally you can mount /youtrack/home/.youtrack, where logs can be found.

## Run on server

To run it as a daemon:

```
docker run -d --restart=always -p 80:8080  -v /home/youtrack/teamsysdata:/youtrack/db sasol/youtrack
```

## Known issues:

* It should run with ssl
    



