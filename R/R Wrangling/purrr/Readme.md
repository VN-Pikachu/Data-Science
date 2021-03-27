# Functional 
>What is Functional
**Answer**: Functional is a function that takes another function(s) as input(s) and return a vector as an output. Since Functional receives function(s) as input, so to pass extra arguments to functions that are used as arguments, Functionals will have **`...`** as a way to pass extra argument to the functions that ared used. For example, `iris %>% modify(mean, na.rm = T)`, `na.rm = T` is a keyword argument pass to function `mean`
