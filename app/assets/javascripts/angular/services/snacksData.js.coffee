angular.module('Bartender').factory "snackData", ($resource) ->
  $resource("/api/snacks/:id", {id: "@id"},
    {
      update:     {method: "PUT"},
    }
  )
