# rpcodes - working with open location codes in R
# Note:
#   mapping is performed in js, thus requires V8
library(V8)
rpc <- list()  # wrapping all functions as methods of rpc
rpc$ng <- v8()  # start the V8 engine
rpc$ng$source('https://cdnjs.cloudflare.com/ajax/libs/openlocationcode/1.0.1/openlocationcode.js')
# Encodes a location to a +code
# @param {num} lat Latitude in signed decimal degrees
# @param {num} lon Longitude in signed decimal degrees
# @param {num} prcs Precision: 10..normal, 11..extra
# @return {str} +code for given location
rpc$encode <- function(lat=NULL, lon=NULL, prcs=10) {
  if (missing(lat)|missing(lon)) stop('no input!')
  return(rpc$ng$call('OpenLocationCode.encode', lat, lon, prcs))
}
# Decodes a +code to a location object
# @param {str} code +code to decode
# @return {list} The OpenLocationCode.CodeArea object
rpc$decode <- function(code=NULL) {
  if (missing(code)) stop('no input!')
  return(rpc$ng$call('OpenLocationCode.decode', code))
}
