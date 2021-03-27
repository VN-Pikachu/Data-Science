multitask <- function(x, y) {
  print(1 + 2)
  print(3 + 4)
  name <- 'VN Pikachu'
  n <- 10
  for (i in 1:10) {
    print('Hello World!')
  }
  print(name * 3)
}


first <- function() second()
second <- function() third()
third <- function() recover()