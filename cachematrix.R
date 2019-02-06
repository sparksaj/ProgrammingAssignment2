## These functions will make a matrix which can house the inverse
## of a given matrix and will cache the inverse. If the inverse of
## a given matrix is equal to the cached value, then the cached
## value will be returned to cut down computation time.

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinv <- function(inverse) m <<- inverse
  getinv <- function() m
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}


## cacheSolve computes the inverse of the special "matrix"
## returned by makeCacheMatrix. If the inverse has already
## been calculated (and it has not changed) then cacheSolve
## will retrieve the inverse from its cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinv()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinv(m)
  m
}
