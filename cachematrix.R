## The following functions will take in a matrix and then return it's inverse. 


## makeCacheMatrix creates a special list where the elements contain functions to
        ## set the value of the matrix
        ## get the value of the matrix
        ## get the inverse of the matrix
        ## set the inverse of the matrix 

makeCacheMatrix <- function(x = matrix()) {

  m <- NULL  # default value - tells cacheSolve that no value is stored in memory.
  # the function set sets the value of the matrix and assigns y and m in parent environment
  set <- function(y) {  
  x <<- y
  m <<- NULL
  }
  # get function gets the value of the matrix 
  get <- function() x  
  # setsolve function sets m to the inverse of the matrix x
  setsolve <- function(solve) m <<- solve
  # getsolve function gets the value of m, which should be NULL if not already stored in memory. 
  getsolve <- function() m  
  list(set=set,get=get,
       setsolve=setsolve,
       getsolve=getsolve)
       
}


## cacheSolve takes in the special list created by makeCacheMatrix and returns the inverse of the matrix taken in by
## the makeCacheMatrix function. It first checks to see if the inverse is stored in memory, if not it calculates the
## inverse and then stores it in memory. 

cacheSolve <- function(x, ...) {
  # this call to getsolve assigns m to the value stored in memory for the inverse matrix, default = NULL
  m <- x$getsolve()
  # this if statement checks to see if the value is NULL, meaning the calculation has not yet been made and
  # has not been stored to memory. If m is not equal to NULL the function will return the value of m immediately. 
  if(!is.null(m)) { 
    message("Getting Cached Data")
    return(m)
  }
  # if m is equal to NULL the cacheSolve function will continue and calculate the inverse of the matrix. 
  # first cacheSolve uses this call to the get function to get the value of the original matrix. 
  data <- x$get()
  # now cacheSolve assigns the inverse of the matrix to m with the solve function
  m <- solve(data)
  # finally cacheSolve stores the value of m in memory with the setsolve function. 
  # the next time getsolve is called it should return the new stored value of m. 
  x$setsolve(m)
  # now cacheSolve will display the value of m which is the inverse of the matrix x
  m
}
