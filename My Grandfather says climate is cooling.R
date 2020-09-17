library(tidyverse)
library(ggplot2)
library(ggthemes)
dataurl="https://data.giss.nasa.gov/tmp/gistemp/STATIONS/tmp_USW00014733_14_0_1/station.csv"
temp=read_csv(dataurl,
              skip=1, #skip the first line which has column names
              na="999.90", # tell R that 999.90 means missing in this dataset
              col_names = c("YEAR","JAN","FEB","MAR", # define column names 
                            "APR","MAY","JUN","JUL",  
                            "AUG","SEP","OCT","NOV",  
                            "DEC","DJF","MAM","JJA",  
                            "SON","metANN"))
#Got the idea to create the data frame from Shruti in Group 5 Meeting
#Wanted to try to isolate data this way, rather than just using the JJA data set
Summer_temps <- data.frame(Year=temp[,1], Means=rowMeans(temp[7:9]))
view(Summer_temps)
# Create Graphic
ggplot(Summer_temps, aes(YEAR,Means)) +
  geom_line() +
  geom_smooth(color="red") +
  labs(title = "Mean Summer Temperature in Buffalo NY", subtitle = "Summer Includes June, July and August", 
       caption = ~ atop(paste("Data from the Global Historical Climate Network"),
                        paste("Red Line is a LOESS Line"))) +
  theme_economist()
       