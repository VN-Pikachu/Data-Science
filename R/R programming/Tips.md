The output type is determined from the highest type of the components in the hierarchy NULL < raw < logical < integer < double < complex < character < list < expression.

-------------------------
get the arguments of a function:
args(function)

-------------------------------
split, cut, quantile, reduce, identical, unique

-----------------------------------
get  the number of rows, columns of an array:
`ncol(object)`
`nrow(object)`

--------------------------------------
floor, ceiling, trunc, as.integer

-------------------------------------
`which()`: like `nonzero()` in numy

-----------------------------------
When you do test code, consider both how it works on typical values as well as special values and edge cases, like a vector with NA or NaN or Inf values, or an empty vector. These are where unexpected behavior is most likely to occur:
     
e.g: `is.finite(x)` if different from `!is.infinite(x)` (hint: test for NA, NaN, -Inf, Inf)

------------------------------------

base::sample

----------------------------------
to move `class` attribute, use `base::unclass`

---------------------------------
OS

`getwd()`, `setwd()`, `ls()`, `rm()`, ...

---------------------
6 ways to select values:
Positive integers
• Negative integers
• Zero
• Blank spaces
• Logical values
• Names

Or use `purrr::pluck`

------------------------------------------
`is.na()`: testing `NA`

-----------------------------------------
`base::unname()`: take a named object and return a new object with named being removed

------------------------------------------
`sytem.time(expression)` to see time to run expression

-----------------------------------------
rowSums, rowMeans, colSums, colMeans

------------------------------------
as.vector() function convert list to list, vector to vector. if you wanna convert from list to vector, you as_vector(but this function will flatten a single layer, read help to learn more). I think we can change class of the object from list to vector, too.

-------------------------
access value of vector, list:
* dplyr: first, nth, last
* purrr: pluck
* traditional way: `[`, `[[`
----------------------------
some data structures, access index out of range will return NA. some will raise an error.

--------------------------

`list(1:3)` is not the same as `list(1, 2, 3)`
`list(1:3)` return a list of length 1. The first element is a vector `1:3`
`list(1, 2, 3)` return a list of length 3.

--------------------------
    
Generally, you can test if a vector is of a given type with an `is.*()` function, but these functions need to be used with care. `is.logical()`, `is.integer()`, `is.double()`, and `is.character()` do what you might expect: they test if a vector is a character, double, integer, or logical. Avoid `is.vector()`, `is.atomic()`, and `is.numeric()`: they don’t test if you have a vector, atomic vector, or numeric vector; you’ll need to carefully read the documentation to figure out what they actually do.

------------------------
`is.atomic()` tests if an object is an atomic vector (as defined in Advanced R) or is NULL (!).
`is.numeric()` tests if an object has type integer or double and is not of class factor, Date, POSIXt or difftime.
`is.vector()` tests if an object is a vector (as defined in Advanced R) or an expression and has no attributes, apart from names.

----------------------------
Deleting elements from a list

To delete an element from a list, set the value of that element to `NULL`

---
Defensive programming: `stopifnot()`

---

**`which.max`** like **`argmax`** in numpy

---

**The number of distinct elements in a Series**
pd.Series.nunique()

---

How to create a dange range in R: **`seq(as.Date("2017-12-01"), as.Date("2017-12-31"), by="1 day")`**

---

`gtools::permutations()`, `gtools::combinations()` like permutations and combinations from intertools in python

---

to download a file from the internet: **`download.file`**

---
remove `names` in place:  
`names(obj) <- NULL`
to return a new object will removed names:  
`unname(obj)`

