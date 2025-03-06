library(tidyverse)
library(ggplot2)

url <- "https://raw.githubusercontent.com/Elias-desig/Stats-HW4/refs/heads/main/Mental_health_data.csv"
df <- read.csv(url, fileEncoding = "UTF-8")
tail(df)

df$Code <- NULL
df <- df %>% rename(Schizophrenia = Schizophrenia....,
                    Bipolar.disorder = Bipolar.disorder....,
                    Eating.disorders = Eating.disorders....,
                    Anxiety.disorders = Anxiety.disorders....,
                    Drug.use.disorders = Drug.use.disorders....,
                    Depression = Depression....,
                    Alcohol.use.disorders = Alcohol.use.disorders....)

# Only the first 6,468 rows contain data for mental health disorder prevalence in percentages 
df <- df[1:6468,]
# Convert data that should be numeric to numeric
df$Schizophrenia <- as.numeric(df$Schizophrenia)
df$Bipolar.disorder <- as.numeric(df$Bipolar.disorder)
df$Eating.disorders <- as.numeric(df$Eating.disorders)
df$Year <- as.numeric(df$Year)


summary(df)


df <- df %>% mutate(total= Schizophrenia+Bipolar.disorder+Eating.disorders+Anxiety.disorders+Drug.use.disorders+Depression+Alcohol.use.disorders)

d

ggplot(df, aes(x=Year,y=total))+
  geom_point(aes(col=Entity, fill=Entity), alpha=0.2)+
  theme(legend.position="None") +
  geom_point(data =(df %>% group_by(Year) %>% summarize(mean = mean(total))), aes(x=Year,y=mean), color= "blue")










