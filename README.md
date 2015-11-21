<!-- README.md is generated from README.Rmd. Please edit that file -->
This is a practice package for [STAT 545](http://stat545-ubc.github.io).

This has been extended by Yucheng Zhang to include two more functions (ffactor and freorder). First created by Jenny as a posting for students to consult / start with for their homework.

Here's how to use the `foofactors` package.

``` r
library(devtools)
install_github("y252zhan/foofactors")
#> Downloading GitHub repo y252zhan/foofactors@master
#> Installing foofactors
#> '/Library/Frameworks/R.framework/Resources/bin/R' --no-site-file  \
#>   --no-environ --no-save --no-restore CMD INSTALL  \
#>   '/private/var/folders/x9/2j6fl6815lbcncj9pqwpcdyh0000gp/T/RtmpvNMKmE/devtoolsbb06452c2230/y252zhan-foofactors-fbdf537'  \
#>   --library='/Library/Frameworks/R.framework/Versions/3.2/Resources/library'  \
#>   --install-tests
library(foofactors)
#functions created by Jenny
fbind(iris$Species[c(1, 51, 101)], PlantGrowth$group[c(1, 11, 21)])
#> [1] setosa     versicolor virginica  ctrl       trt1       trt2      
#> Levels: ctrl setosa trt1 trt2 versicolor virginica
freq_out(iris$Species)
#> Source: local data frame [3 x 2]
#> 
#>            x     n
#>       (fctr) (int)
#> 1     setosa    50
#> 2 versicolor    50
#> 3  virginica    50
#functions extended by Yucheng Zhang
# ffactor is a version of factor() that sets levels to the order in which they appear in the data
ffactor(c("C", "D", "B", "A"))
#> [1] C D B A
#> Levels: C D B A
# freorder is a version of reorder() that reorder levels in descending order according to the numeric value of the second argument
freorder(school <- c("School A", "SChool B", "School C", "School D", "School E", "School F"), N <- c(25,28,12,22,30,25))
#> [1] School A SChool B School C School D School E School F
#> Levels: School E SChool B School A School F School D School C
```
