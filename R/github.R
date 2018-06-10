library(httr)
library(magrittr)

# most starred repos
url <- glue::glue("https://api.github.com/search/repositories?",
                  "q=adversarial+networkin:name,description&",
                  "sort=stars&", 
                  "order=desc")

gh_repos <- GET(url) %>% 
  content(encoding = "UTF-8")

# inspect metadata
gh_repos %>%
use_series("items") %>% 
extract2(1) %>% 
names()

# extract top 5 repos
extract_info <- function(index){
  repository <- gh_repos %>% 
    use_series("items") %>% 
    extract2(index) %>% 
    extract2("html_url")
  
  stars_count <- gh_repos %>% 
    use_series("items") %>% 
    extract2(index) %>% 
    extract2("stargazers_count")
  
  return(data.frame(repository = repository, 
                    stars_count = stars_count))
}

1:5 %>% map_dfr(extract_info) 