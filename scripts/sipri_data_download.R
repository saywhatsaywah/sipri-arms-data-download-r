library(httr) 
library(readr)
library(tidyverse)

data = list(
  `low_year` = '1950',
  `high_year` = '2022',
  `seller_country_code` = 'UK',
  `buyer_country_code` = '',
  `armament_category_id` = 'any',
  `buyers_or_sellers` = 'sellers',
  `filetype` = 'csv',
  `include_open_deals` = 'on',
  `sum_deliveries` = 'on',
  `Submit4` = 'Download'
)

res <- httr::POST(url = 'https://armstrade.sipri.org/armstrade/html/export_trade_register.php', body = data)

sipri <- content(res,"text") |>
  read_csv()

write_csv(sipri, "SIPRIUK.csv")
