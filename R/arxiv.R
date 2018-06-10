library(aRxiv)
library(tidyverse)
library(kableExtra)

# available query args
query_terms %>% pretty_print

# ai & ml categories
ai_ml_categories <- c("Artificial", "Intelligence", "Learning", 
                      "Robotics", "Vision") %>% 
  str_flatten("|")

arxiv_cats %>% 
  dplyr::filter(str_detect(description, ai_ml_categories)) 


# search by specific categories
c("cat:cs.RO", 
  "submittedDate:[201801010000 TO 201802302400]") %>% 
  str_flatten(" AND ") %>% 
  arxiv_search(limit = 12, sort_by = "updated", ascending = FALSE) %>% 
  select(submitted, id, title) %>% 
  head(5) 

# Search by topic
c("ti:Adversarial", 
  "submittedDate:[201801010000 TO 201806072400]") %>% 
  str_flatten(" AND ") %>% 
  arxiv_search(limit = 12, sort_by = "updated", ascending = FALSE) %>% 
  select(submitted, id, title) %>% 
  head(5) 