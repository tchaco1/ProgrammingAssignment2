## The following functions will take in a matrix and then return it's inverse. 


## makeCacheMatrix creates a special list where the elements contain functions to
        ## set the value of the matrix
        ## get the value of the matrix
        ## get the inverse of the matrix
        ## set the inverse of the matrix 

makeCacheMatrix <- function(x = matrix()) {

  m <- NULL
  set <- function(y) {
  x <<- y
  m <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) m <<- solve
  getsolve <- function() m
  list(set=set,get=get,
       setsolve=setsolve,
       getsolve=getsolve)
       
}


## cacheSolve takes in the special list created by makeCacheMatrix and returns the inverse of the matrix taken in by
## the makeCacheMatrix function. It first checks to see if the inverse is stored in memory, if not it calculates the
## inverse and then stores it in memory. 

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getsolve()
  if(!is.null(m)) { 
    message("Getting Cached Data")
    return(m)
  }
  data <- x$get()
  m <- solve(data)
  x$setsolve(m)
  m
}
