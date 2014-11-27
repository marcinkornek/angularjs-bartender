angular.module('Bartender').factory "productData", ($resource) ->
  $resource("/api/products/:id", {id: "@id"},
    {
      update:     {method: "PUT"},
    }
  )
