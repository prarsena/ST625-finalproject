library(leaps)
library(olsrr)

data= X3i_index_data_with_continents
options(scipen=999)
### Define the Regression Model
`Per Capita GDP` = (data$`BG1) Nominal GDP / USD billions` / 
                   data$`BG2) Population / Millions`)*1000

interaction.variable =
  data.with.gdp$`2.1.1) Smartphone cost (handset) / Score of 0-100, 100=most affordable` * 
  data.with.gdp$`2.2.1) Average revenue per user (ARPU, annualized) / USD` 

data.with.gdp = cbind(data,`Per Capita GDP`,interaction.variable)


model.variables = `Per Capita GDP` ~ `BG12) Corruption Perceptions Index / Score, 0-100; 100 = best` +
  `2.2.1) Average revenue per user (ARPU, annualized) / USD` +
  `1.1.2) Fixed-line broadband subscribers / Per 100 inhabitants` +
  `BG21) Female internet users / % of female population`+
  `BG11) Democracy Index / Score, 0-10; 10 = best` +
  `2.1.1) Smartphone cost (handset) / Score of 0-100, 100=most affordable` +
  interaction.variable

#model.variables = `Per Capita GDP`~ bg12 + ee + b + bg21 + bg11 + aa + interaction.variable 

regression.model = lm(model.variables,
                 data = data.with.gdp)
summary(regression.model)
pairs(model.variables,data=data.with.gdp)
# sink("D:\\Sandbox\\modelVIF.txt")
# ols_coll_diag(regression.model)
# sink()

### Fit the model to different continents 
africa = subset(data.with.gdp,`Continent`=="Africa")
asia = subset(data.with.gdp,`Continent`=="Asia")
europe = subset(data.with.gdp,`Continent`=="Europe")
north.america = subset(data.with.gdp,`Continent`=="North America")
oceania = subset(data.with.gdp,`Continent`=="Oceania")
south.america = subset(data.with.gdp,`Continent`=="South America")

get.model <- function(continent){
  continent.regression.model = lm(model.variables,data=continent)
  summary(continent.regression.model)
  #pairs(model.variables,data=continent)
} 

get.model(africa)
get.model(asia)
get.model(europe)
get.model(north.america)
get.model(oceania)
get.model(south.america)
