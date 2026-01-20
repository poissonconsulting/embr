# MB Code

Identifies the type of the code and creates an object of the appropriate
class.

## Usage

``` r
mb_code(template)

new_mb_code(x, class)
```

## Arguments

- template:

  A string, a braced [`{}`](https://rdrr.io/r/base/Paren.html)
  expression (unquoted or quoted), or an object of class `"mb_code"`.

- x:

  A string or a braced [`{}`](https://rdrr.io/r/base/Paren.html)
  expression.

- class:

  The class of the new object.

## Value

An object inheriting from class mb_code.

## Examples

``` r
x <- mb_code(
  "#include <TMB.hpp>

template<class Type>

Type objective_function<Type>::operator() () {
DATA_VECTOR(Count);
PARAMETER(bIntercept);

int n = Count.size();

Type nll = 0.0;
for(int i = 0; i < n; i++){
  nll -= dpois(Count(i), bIntercept, true);
}
return nll;
}
"
)
class(x)
#> [1] "tmb_code" "mb_code" 
```
