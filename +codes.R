# rpcodes - en-/decode open location codes
# Notes:
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
  cmd <- ...  # 'OpenLocationCode.encode(latitude, longitude, codeLength)' lets pray R has tmplate strings!!
  return(rpc$ng$eval(cmd))
}