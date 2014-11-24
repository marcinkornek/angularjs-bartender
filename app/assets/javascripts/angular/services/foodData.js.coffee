angular.module('Bartender').factory "foodData", ($resource) ->
  $resource("/api/food/:id", {id: "@id"},
    {
      update:     {method: "PUT"},
    }
  )
