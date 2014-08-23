## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## makeCacheMatrix will create a matrix which can be inversed. 
## There are few methods provided in this function call

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    ##initialise the cache space with the NULL matrix
    set <- function(y){
        x <<- y
        m <<- NULL
    }
    ##intialise get function and set it to same as input
    get <- function() x
    
    ##setsolve method to set the inverse of the matrix
    setsolve <- function(solve) m <<- solve
    
    ## getsolve method to get inverser of matrix
    getsolve <- function() m

    ##list of functions used as a returnlist
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
	## Check to see if the cache value exists ; if yes : return matrix and exit
	if(!is.null(m)) {
	      message("getting cached data - Inverse of matrix")
              return(m)
	}
	##find the inverse matrix and assign it to cache
        data <- x$get()
        m <- solve(data, ...)
        x$setsolve(m)
        ## returning the inverse matrix just calculated and saved in cache
	m
}
