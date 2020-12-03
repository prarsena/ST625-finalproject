library(leaps)
library(olsrr)

data= X3i_index_data_with_continents

a = data$`1.1.1) Internet users / % of households`
b = data$`1.1.2) Fixed-line broadband subscribers / Per 100 inhabitants`
c = data$`1.1.3) Mobile subscribers / Per 100 inhabitants`
d = data$`1.1.4) Gender gap in internet access / % difference`
e = data$`1.1.5) Gender gap in mobile phone access / % difference`
f = data$`1.2.1) Average fixed broadband upload speed / Kbps`
g = data$`1.2.2) Average fixed broadband download speed / Kbps`
h = data$`1.2.3) Average fixed broadband latency / ms`
i = data$`1.2.4) Average mobile upload speed / Kbps`
j = data$`1.2.5) Average mobile download speed / Kbps`
k = data$`1.2.6) Average mobile latency / ms`
l = data$`1.2.7) Bandwidth capacity / Bit/s per Internet user`
m = data$`1.3.1) Network coverage (min. 2G) / % of population`
n = data$`1.3.2) Network coverage (min. 3G) / % of population`
o = data$`1.3.3) Network coverage (min. 4G) / % of population`
p = data$`1.3.4) 5G deployment / Qualitative rating 0-2, 2=best`
q = data$`1.3.5) Government initiatives to make Wi-Fi available / Qualitative rating 0-2, 2=best`
r = data$`1.3.6) Private sector initiatives to make Wi-Fi available / Qualitative rating 0-2, 2=best`
s = data$`1.3.7) Internet exchange points / Number of IXPs per 10 million inhabitants`
t = data$`1.4.1) Urban electricity access / % of population`
u = data$`1.4.2) Rural electricity access / % of population`

aa = data$`2.1.1) Smartphone cost (handset) / Score of 0-100, 100=most affordable`
bb = data$`2.1.2) Mobile phone cost (prepaid tariff) / % of monthly GNI per capita`
cc = data$`2.1.3) Mobile phone cost (postpaid tariff) / % of monthly GNI per capita`
dd = data$`2.1.4) Fixed-line monthly broadband cost / % of monthly GNI per capita`
ee = data$`2.2.1) Average revenue per user (ARPU, annualized) / USD`
ff = data$`2.2.2) Wireless operators' market share / HHI score (0-10,000)`
gg = data$`2.2.3) Broadband operators' market share / HHI score (0-10,000)`

aaa = data$`3.1.1) Availability of basic information in the local language / Qualitative rating 0-3, 3=best`
bbb = data$`3.1.2) Concentration of websites using country-level domains / Qualitative rating 0-3, 3=best`
ccc = data$`3.1.3) Availability of e-Government services in the local language / Qualitative rating 0-2, 2=best`
ddd = data$`3.2.1) e-Finance content / Qualitative rating 0-2, 2=best`
eee = data$`3.2.2) Value of e-finance / %`
fff = data$`3.2.3) e-Health content / Qualitative rating 0-3, 3=best`
ggg = data$`3.2.4) Value of e-health / %`
hhh = data$`3.2.5) e-Entertainment usage / %`
iii = data$`3.2.6) e-Commerce content / Score of 0-100, 100=best`
jjj = data$`3.2.7) Value of e-Commerce / %`
kkk = data$`3.2.8) Open data policies / Qualitative rating 0-2, 2=best`

aaaa = data$`4.1.1) Level of literacy / % of population`
bbbb = data$`4.1.2) Educational attainment / Years of schooling`
cccc = data$`4.1.3) Support for digital literacy / Qualitative rating 0-3, 3=best`
dddd = data$`4.1.4) Level of web accessibility / Qualitative rating 0-4, 4=best`
eeee = data$`4.2.1) Privacy regulations / Qualitative rating 0-2, 2=best`
ffff = data$`4.2.2) Trust in online privacy / %`
gggg = data$`4.2.3) Trust in Government websites and apps / %`
hhhh = data$`4.2.4) Trust in Non-government websites and apps / %`
iiii = data$`4.2.5) Trust in information from social media / %`
jjjj = data$`4.2.6) e-Commerce safety / %`
kkkk = data$`4.3.1) National female e-inclusion policies / Qualitative rating 0-4, 4=best`
llll = data$`4.3.1.1) Comprehensive female e-inclusion plan / Qualitative rating 0-2, 2=best`
mmmm = data$`4.3.1.2) Female digital skills training plan / Qualitative rating 0-1, 1=best`
nnnn = data$`4.3.1.3) Female STEM education plan / Qualitative rating 0-1, 1=best`
oooo = data$`4.3.2) Government e-inclusion strategy / Qualitative rating 0-2, 2=best`
qqqq = data$`4.3.3) National broadband strategy / Qualitative rating 0-3, 3=best`
pppp = data$`4.3.4) Funding for broadband buildout / Qualitative rating 0-1, 1=best`
rrrr = data$`4.3.5) Spectrum policy approach / Qualitative rating 0-2, 2=best`
ssss = data$`4.3.5.1) Technology-neutrality policy for spectrum use / Qualitative rating 0-1, 1=best`
tttt = data$`4.3.5.2) Unlicensed spectrum policy / Qualitative rating 0-1, 1=best`
uuuu = data$`4.3.6) National digital identification system / Qualitative rating 0-2, 2=best`
vvvv = data$`4.3.7) Government efforts to promote 5G / Qualitative rating 0-3, 3=best`

bg01 = data$`BG1) Nominal GDP / USD billions`
bg02 = data$`BG2) Population / Millions`
bg03 = data$`BG3) Urban population / % of total population`
bg04 = data$`BG4) GNI per capita / US$ per person`
bg05 = data$`BG5) GINI coefficient / Score, 0-100; 0 is perfect equality; 100 is perfect inequality`
bg06 = data$`BG6) Population under the poverty line / % of population`
bg07 = data$`BG7) Total electricity access / % of population`
bg08 = data$`BG8) Cable landing stations / Number of cable landing stations per 10 million inhabitants`
bg09 = data$`BG9) Percentage of schools with Internet access / % of schools`
bg10 = data$`BG10) Global Peace Index / Score, 1-5; 1 = best`
corrected.bg10 = 5-bg10
bg11 = data$`BG11) Democracy Index / Score, 0-10; 10 = best`
bg12 = data$`BG12) Corruption Perceptions Index / Score, 0-100; 100 = best`
bg13 = data$`BG13) EIU Business Environment Rankings / Score, 1-10, 10 = high`
bg14 = data$`BG14) UN E-Government Development Index / Score, 0-1; 1 = best`
bg15 = data$`BG15) Internet users (population) / Millions`
bg16 = data$`BG16) Offline population / Millions`
bg17 = data$`BG17) Internet access gender gap / Difference in percentage points`
bg18 = data$`BG18) Mobile phone access gender gap / Difference in percentage points`
bg19 = data$`BG19) Internet users (percent of population) / % of population`
bg20 = data$`BG20) Male internet users / % of male population`
bg21 = data$`BG21) Female internet users / % of female population`
bg22 = data$`BG22) Male mobile phone subscribers / % of male population`
bg23 = data$`BG23) Female mobile phone subscribers / % of female population`
bg24 = data$`BG24) Total fixed line broadband subscribers / Number of subscriptions`

## Run a step-wise search on the linear regression model which uses every variable:
## Except c,q,and t. Those turned up bad data for some reason. 
reg001 = lm(bg04~a+b+d+e+f+g+h+i+j+k+l+m+n+o+r+s+u+
              aa+bb+cc+dd+ee+ff+gg+aaa+bbb+ccc+ddd+eee+fff+ggg+
              hhh+iii+jjj+kkk+aaaa+bbbb+cccc+dddd+eeee+ffff+gggg+hhhh+
              iiii+jjjj+kkkk+mmmm+nnnn+oooo+pppp+qqqq+rrrr+ssss+tttt+uuuu+vvvv+
              bg01+bg02+bg03+bg05+bg06+bg07+bg08+bg09+corrected.bg10+
              bg11+bg12+bg13+bg14+bg15+bg16+bg17+bg18+bg19+bg20+bg21+bg22+bg23+bg24,
           data=data)

#summary(reg001)
#stepwise_search=ols_step_both_p(reg001,pent=0.05,prem=0.1)
stepwise_search=ols_step_both_p(reg001)
stepwise_search
plot(stepwise_search)

## Run a regression with the variables from the stepwise search:
search.result2 = lm(bg04~bg12+ee+b+bg11+aa+bg22+ccc+hhh,data=data)
summary(search.result2)

## Run a variant regression with the variables from the stepwise search:
search.result = lm(bg04~ee+b+aa+l+hhh+gggg+eee+m+kkkk+ddd+iii,data=data)
summary(search.result)

## Run an exhaustive brute-force search to return the best variables.
### Note: This would require a ton of computing power. 
#
# subsets.model.exhaustive = regsubsets(bg04~a+b+c+d+e+f+g+h+i+j+k+l+m+n+o+p+q+r+s+t+u+
#                                    aa+bb+cc+dd+ee+ff+gg+
#                                    aaa+bbb+ccc+ddd+eee+fff+ggg+hhh+iii+jjj+kkk+
#                                    aaaa+bbbb+cccc+dddd+eeee+ffff+gggg+hhhh+iiii+jjjj+kkkk+
#                                    mmmm+nnnn+oooo+pppp+qqqq+rrrr+ssss+tttt+uuuu+vvvv+
#                                    bg01+bg02+bg03+bg05+bg06+bg07+bg08+bg09+corrected.bg10+bg11+bg12+bg13+bg14+
#                                    bg15+bg16+bg17+bg18+bg19+bg20+bg21+bg22+bg23+bg24,
#                                  data=data, really.big=T, nbest=10,method=c("exhaustive"))
# summary(subsets.model.exhaustive)

## Run an exhaustive brute force on the variables turned up from first stepwise search
subset.model=regsubsets(bg04~ee+b+aa+l+hhh+gggg+eee+m+kkkk+ddd+iii,
                        data=data, nbest=10,method=c("exhaustive"))
summary(subset.model)


## Run the regression using the proper variable names (column names)
search.result = lm(`BG4) GNI per capita / US$ per person`~
                     `2.2.1) Average revenue per user (ARPU, annualized) / USD`+
                     `1.1.2) Fixed-line broadband subscribers / Per 100 inhabitants`+
                     `2.1.1) Smartphone cost (handset) / Score of 0-100, 100=most affordable`+
                     `1.2.7) Bandwidth capacity / Bit/s per Internet user`+
                     `3.2.5) e-Entertainment usage / %`+
                     `4.2.3) Trust in Government websites and apps / %`+
                     `3.2.2) Value of e-finance / %`+
                     `1.3.1) Network coverage (min. 2G) / % of population`+
                     `4.3.1) National female e-inclusion policies / Qualitative rating 0-4, 4=best`+
                     `3.2.1) e-Finance content / Qualitative rating 0-2, 2=best`+
                     `3.2.6) e-Commerce content / Score of 0-100, 100=best`,data=data)
summary(search.result)

## Run the second regression using the proper variable names (column names)
search.result2 = lm(`BG4) GNI per capita / US$ per person`~
                      `BG12) Corruption Perceptions Index / Score, 0-100; 100 = best`+
                      `2.2.1) Average revenue per user (ARPU, annualized) / USD`+
                      `1.1.2) Fixed-line broadband subscribers / Per 100 inhabitants`+
                      `BG11) Democracy Index / Score, 0-10; 10 = best`+
                      `2.1.1) Smartphone cost (handset) / Score of 0-100, 100=most affordable`+
                      `BG22) Male mobile phone subscribers / % of male population`+
                      `3.1.3) Availability of e-Government services in the local language / Qualitative rating 0-2, 2=best`+
                      `3.2.5) e-Entertainment usage / %`,data=data)
summary(search.result2)

## Run a pairs matrix chart on first regression:
pairs.result1 = pairs(`BG4) GNI per capita / US$ per person`~
                   `2.2.1) Average revenue per user (ARPU, annualized) / USD`+
                   `1.1.2) Fixed-line broadband subscribers / Per 100 inhabitants`+
                   `2.1.1) Smartphone cost (handset) / Score of 0-100, 100=most affordable`+
                   `1.2.7) Bandwidth capacity / Bit/s per Internet user`+
                   `3.2.5) e-Entertainment usage / %`+
                   `4.2.3) Trust in Government websites and apps / %`+
                   `3.2.2) Value of e-finance / %`+
                   `1.3.1) Network coverage (min. 2G) / % of population`+
                   `4.3.1) National female e-inclusion policies / Qualitative rating 0-4, 4=best`+
                   `3.2.1) e-Finance content / Qualitative rating 0-2, 2=best`+
                   `3.2.6) e-Commerce content / Score of 0-100, 100=best`,data=data)
pairs.result1

## Run a pairs matrix chart on the second regression:
pairs.result2 = pairs(`BG4) GNI per capita / US$ per person`~
        `BG12) Corruption Perceptions Index / Score, 0-100; 100 = best`+
        `2.2.1) Average revenue per user (ARPU, annualized) / USD`+
        `1.1.2) Fixed-line broadband subscribers / Per 100 inhabitants`+
        `BG11) Democracy Index / Score, 0-10; 10 = best`+
        `2.1.1) Smartphone cost (handset) / Score of 0-100, 100=most affordable`+
        `BG22) Male mobile phone subscribers / % of male population`+
        `3.1.3) Availability of e-Government services in the local language / Qualitative rating 0-2, 2=best`+
        `3.2.5) e-Entertainment usage / %`,data=data)
pairs.result2
