library(twitteR)

##Go to this web page to create your Twitter developer account:
## https://www.r-bloggers.com/setting-up-the-twitter-r-package-for-text-analytics/

##Set key, token, secrets

consumer_key <- "_your key here_"
consumer_secret <- "_your secret here_"
access_token <- "_your token here_"
access_secret <- "_your secret here_"

##Authorize your Twitter session

setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)