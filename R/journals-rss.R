library(tidyRSS)
library(feedeR)

# science mag
science_magazine <- tidyfeed(url)
names(science_magazine)

science_magazine %>% 
  filter(str_detect(url, "some_regex")) 

# JMLR
jmlr <- feed.extract(url) %>% 
  use_series("items")

names(jmlr)
