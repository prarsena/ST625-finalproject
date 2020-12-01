library(ggplot2)
library(ggrepel)
data= X3i_index_data_with_continents

africa_color = "#F8766D"
asia_color = "#C49A00"
europe_color = "#53B400"
north_america_color = "#00C094"
oceania_color = "#00B6EB"
south_america_color = "#A58AFF"

### -------- Plot all countries -------- ###

x = `1.1.1) Internet users / % of households`
y = `BG4) GNI per capita / US$ per person`
ggplot(data=data,aes(x,y,colour=`Continent`))+
   geom_point(size=2)+
   ggtitle("Internet access as a function of GNI per person per country")

ggplot(data=data,aes(`BG4) GNI per capita / US$ per person`,
                     `1.1.1) Internet users / % of households`,
                     colour=`Continent`))+
   geom_point(size=2)+
   ggtitle("Internet access as a function of GNI per person per country")


### -------- Plot all countries with Continent Labels -------- ###

continent.within.global <- function(continent,color){
   ggplot(data=data,aes(`BG4) GNI per capita / US$ per person`,
                        `1.1.1) Internet users / % of households`,
                        colour=`Continent`,
                        label = `Country/Group`))+
      geom_text_repel(
         data = subset(data, `Continent`==continent),
         #box.padding   = 0.35, 
         point.padding = 0.5,
         segment.color = 'grey50' ) +
      geom_point(size=2,color = ifelse(data$Continent==continent,color,"black" ) )+
      ggtitle("Internet access as a function of GNI per person per country")
}

## -------  Africa within Global ------- ##
continent.within.global("Africa",africa_color)

## -------  Asia within Global ------- ##
continent.within.global("Asia",asia_color)

## -------  Europe within Global ------- ##
continent.within.global("Europe",europe_color)

## -------  North America within Global ------- ##
continent.within.global("North America",north_america_color)

## -------  Oceania within Global ------- ##
continent.within.global("Oceania",oceania_color)

## -------  South America within Global ------- ##
continent.within.global("South America",south_america_color)


### -------- Continent Subset Function -------- ###

continent.subset <- function(continent,country_color){
   countries = subset(data,`Continent` == continent)
   graph <- ggplot(data=countries,aes(`BG4) GNI per capita / US$ per person`,
                                            `1.1.1) Internet users / % of households`,colour=`Continent`))+
      geom_point(size=2,color=country_color)+
      xlim(0,60000) +
      ylim(0,100) +
      ggtitle("Internet access as a function of GNI per person per country")
   
   graph+
      geom_label_repel(aes(label = `Country/Group`),
                       box.padding   = 0.35, 
                       point.padding = 0.5,
                       segment.color = 'grey50')
}

### -------- African Countries Subset -------- ###
continent.subset("Africa",africa_color)

### -------- Asian Countries Subset -------- ###
continent.subset("Asia",asia_color)

### -------- Europe Countries Subset -------- ###
continent.subset("Europe",europe_color)

### -------- North America Countries Subset -------- ###
continent.subset("North America",north_america_color)

### -------- Oceania Countries Subset -------- ###
continent.subset("Oceania",oceania_color)

### -------- South America Countries Subset -------- ###
continent.subset("South America",south_america_color)


### -------- Regression calculations -------- ###

## Define variables by typing "data$" 
## then some column options will come up
data$`BG20) Male internet users / % of male population`

## Defining variables for the regressions. 
## They should be named more accurately. 
z = data$`Country/Group`
cc = data$ISO
x = data$`BG4) GNI per capita / US$ per person`
y = data$`1.1.1) Internet users / % of households`
v = data$`BG9) Percentage of schools with Internet access / % of schools`
u = data$`1.1.4) Gender gap in internet access / % difference`
t = data$`BG12) Corruption Perceptions Index / Score, 0-100; 100 = best`
s = data$`3.2.7) Value of e-Commerce / %`
r = data$`1.1.3) Mobile subscribers / Per 100 inhabitants`
   
reg01=lm(data$`BG4) GNI per capita / US$ per person`
       ~ data$`1.1.1) Internet users / % of households`,data=data)
summary(reg01)

reg02 = lm(x~y+u+t,data=data)
summary(reg02)
