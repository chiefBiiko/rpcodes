# rpcodes - working with open location codes in R
if (!'V8'%in%installed.packages()) install.packages('V8')
library(V8)
rpc <- list()  # wrapping all functions as methods of rpc
rpc$ng <- v8()  # start the V8 engine
rpc$ng$source('https://cdnjs.cloudflare.com/ajax/libs/openlocationcode/1.0.1/openlocationcode.js')
# Encodes a location to a +code
# @param {num} lat Latitude in signed decimal degrees
# @param {num} lon Longitude in signed decimal degrees
# @param {num} prcs Precision: 10..normal, 11..extra
# @return {chr} +code for given location
rpc$encode <- function(lat=NULL, lon=NULL, prcs=10) {
  if (missing(lat)||missing(lon)) stop('no input!')
  return(rpc$ng$call('OpenLocationCode.encode', lat, lon, prcs))
}
# Decodes a +code to a location object
# @param {chr} code +code to decode
# @return {list} The OpenLocationCode.CodeArea object
rpc$decode <- function(code=NULL) {
  if (missing(code)) stop('no input!')
  return(rpc$ng$call('OpenLocationCode.decode', code))
}
# Shortens a +code
# @param {chr} code +code to shorten
# @param {num} lat Latitude of the reference location
# @param {num} lon Longitude of the reference location
# @return {chr} Shortened +code that is still the closest
#               matching code to the reference location
rpc$shorten <- function(code=NULL, lat=NULL, lon=NULL) {
  if (missing(code)||missing(lat)||missing(lon)) stop('no input!')
  return(rpc$ng$call('OpenLocationCode.shorten', code, lat, lon))
}
# Recover the nearest matching +code to a specified location
# This is the counterpart to rpc$shorten()
# @param {chr} shortCode +code to recover
# @param {num} lat Latitude of the reference location
# @param {num} lon Longitude of the reference location
# @return {chr} Nearest matching full +code to the reference location
rpc$recoverNearest <- function(shortCode=NULL, lat=NULL, lon=NULL) {
  if (missing(shortCode)||missing(lat)||missing(lon)) stop('no input!')
  return(rpc$ng$call('OpenLocationCode.recoverNearest', shortCode, lat, lon))
}