## These functions cache the inverse of a matrix to minimize computation time.
## If the inverse has already been calculated (and the matrix has not changed), then 
## the function cachesolve should retrieve the inverse from the cache.

## makeCacheMatrix creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
        i <<- NULL
        set <- function(y){
                 x <<- y
                 i <<- NULL
          }
         get <- function() x
         setmatrix <- function(solve) i <<- solve
        getmatrix <- function() i
        list(set= set, get= get,
        setmatrix= setmatrix,
        getmatrix= getmatrix)
}

## cacheSolve computes the inverse of the special "matrix" returned by makeCacheMatrix above. 

cacheSolve <- function(x, ...) {
i <- x$getmatrix()
    if(!is.null(i)){
         message("getting cached data")
         return(i)
        }
    data <- x$get()
    i <- solve(data, ...)
    x$setmatrix(i)
    i
}
