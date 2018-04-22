library("jsonlite")
library("RCurl")

# ここに検索したい駅名を入力
station = "荻窪"

# ここにアクセスキーを入力
Access_key = "Access_key"

# API
BaseAPI <- paste("http://api.ekispert.jp//v1/json/station/light?key=", Access_key, sep = "")

# BaseAPI+station
API <- paste(BaseAPI, "&name=", station, sep = "")

# get JSON
data <- getURL(API)
data <- fromJSON(data)

# get Prefecture name
if(length(data$ResultSet$Point$Station$Name)==1){
  output <- data$ResultSet$Point$Prefecture$Name
}else{
  output <- data$ResultSet$Point$Prefecture[data$ResultSet$Point$Station$Name==station,]$Name
}

print(output)