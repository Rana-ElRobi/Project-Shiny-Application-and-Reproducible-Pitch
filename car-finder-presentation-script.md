Car Finder Application
========================================================
This App helps you to find your best car 

Author : Rana

========================================================
## About App

Car Finder is user fiendly application, in which:
- It has many option to fit your needs, like : 
  - Car Type (Manual/Automatic)
  - Number of cylinders
  - Displacment
  - Distance covered in miles
  - Estimated gasoline price
  
Also,
- Its is supported with very nice User Manual with screen shots for the app

========================================================
## About Data Used

- Dataset used called `mtcars`

```r
head(mtcars[,1:5],8)
```

```
                   mpg cyl  disp  hp drat
Mazda RX4         21.0   6 160.0 110 3.90
Mazda RX4 Wag     21.0   6 160.0 110 3.90
Datsun 710        22.8   4 108.0  93 3.85
Hornet 4 Drive    21.4   6 258.0 110 3.08
Hornet Sportabout 18.7   8 360.0 175 3.15
Valiant           18.1   6 225.0 105 2.76
Duster 360        14.3   8 360.0 245 3.21
Merc 240D         24.4   4 146.7  62 3.69
```
> Note : This custmization in `head()` is for better representation

========================================================
## Sampel of code with default values 

```r
library(dplyr)
disp_seq <- seq(from = 160, to = 325, by = 0.1) 

reshaped.data <- transmute(mtcars,Car = rownames(mtcars),MilesPerGallon = mpg, GasolineExpenditure = 30/mpg*3.2, Cylinders = 8,Displacement = 160, Transmission = 0) 

filtered.data <- filter(reshaped.data , Cylinders %in% c(4,8),Displacement %in% disp_seq,Transmission %in% 0)

labelled.data <- mutate(filtered.data,Transmission = ifelse (Transmission==0,"Automatic","Manual"))

resultant.data <- arrange(labelled.data, GasolineExpenditure) 
```

========================================================
## Filtered Results

After Calculations and filtering data, Results will be like this

```r
colnames(resultant.data) <- c("car","miles","gas" ,"cly","Disp","Type")
head(resultant.data[,1:5],2) 
```

```
             car miles      gas cly Disp
1 Toyota Corolla  33.9 2.831858   8  160
2       Fiat 128  32.4 2.962963   8  160
```

```r
head(resultant.data[],1) #One Record result display
```

```
             car miles      gas cly Disp      Type
1 Toyota Corolla  33.9 2.831858   8  160 Automatic
```

