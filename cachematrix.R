## write a pair of functions that cache the inverse of a matrix
## The first function creates a special "matrix" object that can cache its inverse.
## The second function computes the inverse of the special "matrix" returned by 
## makeCacheMatrix. If the inverse has already been calculated 
##(and the matrix has not changed), then the cachesolve should retrieve 
## the inverse from the cache.


## This function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = numeric()) {
    cache <- NULL
    setMatrix <- function(newValue) {
        x <<- newValue
        cache <<- NULL
    }
    getMatrix <- function() {  # returns the stored matrix
        x
    }
    cacheInverse <- function(solve) {  # cache the given argument
        cache <<- solve
    }
    getInverse <- function() {  # get the cached value
        cache
    }
    # return a list. 
    list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)
}
# The following function calculates the inverse of a "special" matrix created with makeCacheMatrix
cacheSolve <- function(y, ...) {
    # get the cached value
    inverse <- y$getInverse()
    # if a cached value exists return it
    if(!is.null(inverse)) {
        message("getting cached data")
        return(inverse)
    }
    # otherwise get the matrix, caclulate the inverse and store it in the cache
    data <- y$getMatrix()
    inverse <- solve(data)
        y$cacheInverse(inverse)

    # return the inverse
    inverse
}
