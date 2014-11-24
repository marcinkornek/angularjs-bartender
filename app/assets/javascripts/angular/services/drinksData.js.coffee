angular.module('Bartender').factory "drinkData", ($resource) ->
  $resource("/api/drinks/:id", {id: "@id"},
    {
      update:     {method: "PUT"},
    }
  )
