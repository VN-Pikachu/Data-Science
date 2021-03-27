# Functional Programming
Depends on the type of input and output, we have different names:
- If input and input are vector, it's a normal function
- If input is a function, output is a vector, it's called **Functional**, (like `map`, `reduce`, ...)
- If input is a vector, output is a function, it's called **Function Factories**
- If input is a function, output is a function, it's called **Function operattors** (like `safely`, `possibly`, ...)