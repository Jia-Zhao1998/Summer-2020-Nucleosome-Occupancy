---
title: "Random Plot"
author: "Jia Zhao"
date: "7/9/2020"
output:
  html_document:
    keep_md: true
---


### Function "random_plot" 




This function takes three four arguments: *data, chromosome, start and end*. The results will be a **line plot** with x axis as position of a chromosome and y axis as corresponded data value.


```r
random_plot <- function(data= final_table, chromosome="chr 1", start=1, end=1000){
  # data is a data frame; chromosome is a string/character and a column of data, start and end are integers
  sub_data <- data[data$chromosome == chromosome,]
  position <- as.numeric(sub_data$position)
  sub_data <- sub_data[position >= start & position <= end,]
  x <- chromosome
  with(sub_data, plot(position, data_value, pch = 19, main = x, ylab= "data value", type = "l"))
}
```

### Here are some examples of calling the function

1. **De fault (chr 1, position 1-1000)**

```r
random_plot()
```

![](Random_Plot_files/figure-html/unnamed-chunk-2-1.png)<!-- -->

2. **Chr 2, position 300-700**


```r
random_plot(chromosome = "chr 2", start = 300, end = 700)
```

![](Random_Plot_files/figure-html/unnamed-chunk-3-1.png)<!-- -->

3. **Whole chr 2**


```r
random_plot(chromosome = "chr 2" ,start = 1, end = Inf)
```

![](Random_Plot_files/figure-html/unnamed-chunk-4-1.png)<!-- -->

