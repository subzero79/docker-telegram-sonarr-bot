*Docker Telegram Sonarr Bot*

Docker image based for running this telegram bot for sonarr 

https://github.com/onedr0p/telegram-sonarr-bot

_How to run_

Create this file /some/path/config.json with this content

```
{
        "telegram": {
                "botToken": "14315465:XxXXXXXXXXX"
        },
        "sonarr": {
                "hostname": "10.10.10.12",
                "apiKey": "52150234569d84ad391719fc703bba5ba",
                "port": 8989,
                "urlBase": "",
                "ssl": false,
                "username": "",
                "password": ""
        }
}
```

Most important, change the telegram bot token and the sonarr api key, fill the rest of the settings if you use ssl and/or authentication

```docker run -d --restart=always subzero79/docker-telegram-sonarr-bot -v /some/path:/config```
