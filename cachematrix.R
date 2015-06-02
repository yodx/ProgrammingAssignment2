## Provide functions to cache the inverse of a matrix for later use

## Create a special matrix object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL # used to store the inverse
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setInverse <- function(inverse) {inv <<- inverse}
  getInverse <- function() inv
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}


## Computes the inverse of a special matrix object created through
## makeCacheMatrix.
cacheSolve <- function(x, ...) {
  inv <- x$getInverse()
  if(!is.null(inv)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  inv <- solve(data)
  x$setInverse(inv)
  inv
}
