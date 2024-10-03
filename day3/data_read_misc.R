#' List of packages used is this script (in order of appearance)
pkgs <- c("tidyverse", "jsonlite", "lubridate", "rvest", "geojsonsf")
pkgs
#' You can install them all with `install.packages(pkgs)`

#' JSON
#' https://www.energidataservice.dk/tso-electricity/CO2Emis
#' https://api.energidataservice.dk/dataset/CO2Emis?limit=5

library(tidyverse)
library(jsonlite)
url <- "https://api.energidataservice.dk/dataset/CO2Emis?start=2024-03-30T00:00&end=2024-04-01T00:00"
d <- fromJSON(url)
str(d)
d_records <- d$records |>
  as_tibble()
d_records

#' Handling time correctly
library(lubridate)
d_records <- d_records |>
  mutate(UTC = ymd_hms(Minutes5UTC),
         DK = ymd_hms(Minutes5DK, tz = "CET"),
         diff = UTC - DK)
d_records
UTC <- d_records |> pull(UTC)
class(UTC)

UTC1 <- UTC[1]
as.numeric(UTC1)
(y1 <- year(UTC1))
(mo1 <- month(UTC1))
(d1 <- day(UTC1))
(h1 <- hour(UTC1))
(mi1 <- minute(UTC1))
(s1 <- second(UTC1))

UTC1again <- make_datetime(y1, mo1, d1, h1, mi1, s1)

UTC1 == UTC1again

d_records |>
  filter(DK >= ymd_hms("2024-03-31 01:30:00", tz = "CET"),
         DK <= ymd_hms("2024-03-31 03:30:00", tz = "CET"),
         PriceArea == "DK1")

d_records |>
  filter(year(DK) == 2024) |>
  ggplot(aes(DK, CO2Emission, color = PriceArea)) +
  geom_line()

#' Web-scraping (https://rvest.tidyverse.org/articles/selectorgadget.html)
library(rvest) # xml2: xml parsing og andet
m <- read_html("http://www.imdb.com/title/tt6966692/")
m
meta_score <- html_element(m, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "metacritic-score-box", " " ))]')
as.character(meta_score)
html_text(meta_score)
as.numeric(html_text(meta_score))

#' JSON with geometries GeoJSON -- package `geojsonsf`:
library(geojsonsf)
dat <- geojson_sf("https://api.dataforsyningen.dk/afstemningsomraader?format=geojson&kommunekode=0851")
# dat <- geojson_sf("afstemningsomraader0851.json")
mapview::mapview(dat)
