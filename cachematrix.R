## Caching the inverse of a matrix:
## a pair of functions that cache the inverse of a matrix --
## since matrix inversion is usually a costly computation and
## there may be some benefit to caching the inverse of a 
## matrix rather than computing it repeatedly. 


## This function creates a special matrix object
## that can cache its inverse.

makeCacheMatrix <- function( m = matrix() ) {

## initialize i
    i <- NULL
    
## set matrix
    set <- function(matrix) {
      m <<- matrix
      i <<- NULL
    }

## get matrix
    get <- function() m
    
## set inverse of matrix
    setinverse <- function(inverse) {
      i <<- inverse
    }
    
## get inverse of matrix
    getinverse <- function() i
    
## return list
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}
  

## This function computes the inverse of the special
## matrix returned by makeCacheMatrix above.

cacheSolve <- function(x, ...) {
## return a matrix that is the inverse of 'x'

  m <- x$getinverse()

## return inverse if it is set
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }

## get matrix from object
  data <- x$get()
  
## calculate inverse 
  m <- solve(data)
  
## set inverse and return matrix
  x$setinverse(m)
  m
}
