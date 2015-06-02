## Provide functions to cache the inverse of a matrix for later use

## Create a special matrix object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL # used to store the inverse
  set <- function(y) { # set the value of a matrix
    x <<- y
    inv <<- NULL
  }
  get <- function() x # get the value of a matrix
  setInverse <- function(inverse) {inv <<- inverse} # set the inverse
  getInverse <- function() inv # get the inverse
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse) # return a list of functions
}


## Computes the inverse of a special matrix object created through makeCacheMatrix.
cacheSolve <- function(x, ...) {
  inv <- x$getInverse() # get cached inverse
  
  # if inverse is not null, return cached inverse and exit
  if(!is.null(inv)) {
    message("getting cached data")
    return(m)
  }
  
  # else, calculate inverse and store
  data <- x$get()
  inv <- solve(data)
  x$setInverse(inv)
  
  # return inverse
  inv
}
