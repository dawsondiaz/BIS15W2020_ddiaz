---
title: "Lab 1 Homework"
author: "Dawson Diaz"
date: "Winter 2020"
output:
  html_document: 
    keep_md: yes
    theme: spacelab
---

## Instructions
Answer the following questions and complete the exercises in RMarkdown. Please embed all of your code, keep track of your versions using git, and push your final work to our [GitHub repository](https://github.com/FRS417-DataScienceBiologists). I will randomly select a few examples of student work at the start of each session to use as examples so be sure that your code is working to the best of your ability.  

***

**1. Navigate to the R console and calculate the following expressions.**

  + 5 - 3 * 2  
  + 8 / 2 ** 2
  
***
  
**2. Did any of the results in #1 surprise you? Write two programs that calculate each expression such that the result for the first example is 4 and the second example is 16.**

Yes, the code above did not take into account the correct order of operations I expected. 


```r
(5-3)*2
```

```
## [1] 4
```

```r
(8/2)**2
```

```
## [1] 16
```

***

**3. Make a new object `pi` as 3.14159265359.**

```r
pi <- 3.14159265359
```

***
**4. Is `pi` an integer or numeric? Why? Show your code.**

The object 'pi' is stored as a numeric. It is not an integer because it is not a whole number. We can check how the value is stored by running the code: 

```r
class(pi)
```

```
## [1] "numeric"
```
***

**5. You have decided to use your new analytical powers in R to become a professional gambler. Here are your winnings and losses this week. Note that you don't gamble on the weekends!**

```r
blackjack <- c(140, -20, 70, -120, 240, NA, NA)
roulette <- c(60, 50, 120, -300, 10, NA, NA)
```
<br>

**a. Build a new vector called `days` for the days of the week.**


```r
days <- c("Monday","Tuesday","Wednesday","Thursday","Friday", "Saturday", "Sunday")
```
<br>
**We will use `days` to name the elements in the poker and roulette vectors.**

```r
names(blackjack) <- days
names(roulette) <- days
```
<br>

**b. Calculate how much you won or lost in blackjack over the week.**


```r
sum(blackjack)
```

```
## [1] NA
```
<br>
**c. What is your interpretation of this result? What do you need to do to address the problem? Recalculate how much you won or lost in blackjack over the week.**

We need to remove the missing data from the sum calculation in order to get a result.


```r
blackjack
```

```
##    Monday   Tuesday Wednesday  Thursday    Friday  Saturday    Sunday 
##       140       -20        70      -120       240        NA        NA
```

```r
sum(blackjack, na.rm=TRUE)
```

```
## [1] 310
```
<br>

**d. Calculate how much you won or lost in roulette over the week.** 


```r
roulette
```

```
##    Monday   Tuesday Wednesday  Thursday    Friday  Saturday    Sunday 
##        60        50       120      -300        10        NA        NA
```

```r
sum(roulette, na.rm=TRUE)
```

```
## [1] -60
```
<br>

**e. Build a `total_week` vector to show how much you lost or won on each day over the week. Which days seem lucky or unlucky for you?**


```r
total_week <- roulette + blackjack
total_week
```

```
##    Monday   Tuesday Wednesday  Thursday    Friday  Saturday    Sunday 
##       200        30       190      -420       250        NA        NA
```
Thursday seems particularly unlucky for me, and I would probably avoid gambling on that day going forward.

<br>


**f. Should you stick to blackjack or roulette? Write a program that verifies this below.**

Do I make more money per week on blackjack or roulette?

```r
sumblackjack <- sum(blackjack, na.rm=TRUE)
sumroulette <- sum(roulette, na.rm=TRUE)

if (sumblackjack > sumroulette) {
print("Blackjack makes you more money")
} else {
  print("Roulette makes you more money")
}
```

```
## [1] "Blackjack makes you more money"
```
According to the analysis of the vectors, I should keep playing blackjack because I make more money with it per week than I do with roulette.

<br><br><br>
