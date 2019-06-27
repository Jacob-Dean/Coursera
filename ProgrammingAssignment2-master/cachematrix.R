## The first function takes a matrix and stores it equivalently
## in a list format. The second function takes this list,
## checks if the corresponding matrix has already had its inverse
## calculated and cached to prevent unnecessary calculation. However
## if not then the function itself calculates and stores the inverse.

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setinverse <- function(solve) m <<- solve
    getinverse <- function() m
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}



cacheSolve <- function(x, ...) {   m <- x$getinverse()
if(!is.null(m)) {
    message("getting cached data")
    return(m)
}
data <- x$get()
m <- solve(data, ...)
x$setinverse(m)
m
}
