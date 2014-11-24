angular.module('Bartender').factory "sessionData", ($resource) ->
  $resource("/api/session", {})
