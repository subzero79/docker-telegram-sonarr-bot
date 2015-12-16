**Docker Telegram Sonarr Bot**

Docker image based for running this telegram bot for sonarr 

https://github.com/onedr0p/telegram-sonarr-bot

**How to run**

Create this file /some/path/config.json with this content

```
{
  "telegram": {
    "botToken": "11111:XXXXX"
  },
  "sonarr": {
    "hostname": "10.1.1.20",
    "apiKey": "2345jdsgo639562kfsad9l04q5qfm",
    "port": 8989,
    "urlBase": "",
    "ssl": false,
    "username": "",
    "password": ""
  },
  "debug": false
}
```

Most important, change the telegram bot token, the sonarr api key and the hostname, fill the rest of the settings if you use ssl and/or authentication

```docker run -d --name=telegram-bot --restart=always subzero79/docker-telegram-sonarr-bot -v /some/path:/config```

You should be able to see the bot response log with ```docker logs telegram-bot```
