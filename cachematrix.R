## Create matrix, find inverse matrix and cache, pull from cache

## creates a matric that has a list of functions associated with it

makeCacheMatrix <- function(x = matrix()) {
    s <- NULL
    set <- function(y) {
        x <<- y
        s <<- NULL
    }
    get <- function() x
    setinverse <- function(solve) s <<- solve
    getinverse <- function() s
    list(set=set, get=get,
         setinverse=setinverse,
         getinverse=getinverse)
}


## create inverse of designated matrix, or pull previously created inverse

cacheSolve <- function(x, ...) {
    s <- x$getinverse()
    if(!is.null(s)) {
        message("geting cached matrix")
        return(s)
    }
    data <- x$get()
    s <- solve(data, ...)
    x$setinverse(s)
    s
        ## Return a matrix that is the inverse of 'x'
}
