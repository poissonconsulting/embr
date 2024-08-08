. <- NULL

.gen_inits <- function(data) list(bIntercept = 1)

.tmb_template <- "#include <TMB.hpp>

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
}"
