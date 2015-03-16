## Put comments here that give an overall description of what your
## functions do

## This function creates a matrix that will store the inverse of the argument matrix

makeCacheMatrix <- function(x = matrix()) {

  m <- NULL
  set <- function(y) {
  x <<- y
  m <<- NULL
  }
  get<-function()x
  setsolve<-function(solve) m<<-solve
  getsolve<-function() m
  list(set=set,get=get,
       setsolve=setsolve,
       getsolve=getsolve)
  
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
} 