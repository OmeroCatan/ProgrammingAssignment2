## The "makeCacheMatrix" function will create a list containing
## functions to set values of both the matrix and inverse
## and get the values of both the matrix and inverse
## The list is used as input for the second function, "cacheSolve"

makeCacheMatrix <- function(x = matrix()) {
## m will be the inverse
    m <- NULL  
    set <- function(y) {
      m <<- NULL   
      x <<- y     
## The <<- operator is used to assign a value to an object
## in a different environment
    }
    get <- function() x
    setm <- function(solve) m <<- solve
    getm <- function() m
    list(set = set, get = get,
         setm = setm,
         getm = getm)
  }

## "This"casheSolve will result in the inverse of the original matrix
## input into "makeCacheMatrix"

cacheSolve <- function(x, ...) {
    m <- x$getm()
    if(!is.null(m)){
## Gets the value from the cache and no     
## calculation is needed
    message("Already Calculated") 
    return(m)                     
    }
## Gets original data from the matrix
## Provides inverse
    o.data <- x$get()  
    m <- solve(o.data, ...)  
    x$setm(m)
    return(m)
}
