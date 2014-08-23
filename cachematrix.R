## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

#makeCacheMatrix will create a matrix which can be inversed. There are few methods provided in this function call
makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y){
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setsolve <- function(solve) m <<- solve
    getsolve <- function() m
    list(set = set, get = get,
	setsolve = setsolve,
	getsolve = getsolve)


}


## Write a short comment describing this function

## This function will return the inverse matrix of the provided matrix.
## It will return the cached inv matrix if the function is already called earlier with same input.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	m <- x$getsolve()
	if(!is.null(m)) {
	      message("getting cached data - Inverse of matrix")
              return(m)
	}
        data <- x$get()
        m <- solve(data, ...)
        x$setsolve(m)
	m
}
