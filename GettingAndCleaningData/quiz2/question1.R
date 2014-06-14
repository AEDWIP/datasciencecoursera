# 
# Register an application with the Github API here https://github.com/settings/applications. Access the API to get
# information on your instructors repositories (hint: this is the url you want 
#                                               "https://api.github.com/users/jtleek/repos").
# Use this data to find the time that the datasharing repo was created. What time was it created? This tutorial may 
# be useful (https://github.com/hadley/httr/blob/master/demo/oauth2-github.r). You may also need to run the code in the
# base R package and not R studio.
#


#
# install the httr
# its provides http get/post/... with support for OAuth
# install.packages("httr")
library(httr)

#
# install 
# install.packages("httpuv")
# provides low level socket support. I think httr needs this
# to support the OAuth callback URL


#
# install rjson and jsonlite
# install.packages("rjson")
# install.packages("jsonlite")

library(httr)
clientID <- "e1cd79eff573b91c807d"
clientSecret <- "5c8fd45a9b506df19a685ea7177b123ac717da22"

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. Register an application at https://github.com/settings/applications
#    Insert your values below - if secret is omitted, it will look it up in
#    the GITHUB_CONSUMER_SECRET environmental variable.
#
#    Use http://localhost:1410 as the callback url
myapp <- oauth_app("github", key=clientID, secret=clientSecret)

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

#
# a web page will launch asking us to "authorize the app"

# 4. Use API
req <- GET("https://api.github.com/users/jtleek/repos", config(token = github_token))
stop_for_status(req)
content(req)

#
# process response
#
json1 = content(req) # list I do not know what the format is
json2 = rjson::toJSON(json1) # convert r object to json
json3 = jsonlite::fromJSON(json2) # list

#
# get row containing info about the 'datasharing' repo
#
dataSharingRepoMetaData = subset(json3, json3$name == "datasharing")
# here is another way to select the data, we want all the cols where name is data sharing, notice the comma
x = json3[json3$name == 'datasharing',]


# now get the crated_at value
dataSharingRepoMetaData$created_at

