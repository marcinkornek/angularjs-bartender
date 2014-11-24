angular.module('Bartender').factory "categoryData", ($resource) ->
  $resource("/api/categories/:id", {id: "@id"},
    {
      update:     {method: "PUT"},
    }
  )
