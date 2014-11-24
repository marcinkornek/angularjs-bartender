angular.module('Bartender').factory "categoryData", ($resource) ->
  $resource("/api/categories/:id", {id: "@id"},
    {
      save:       {method: "POST", url: '/api/comments' },
      update:     {method: "PUT"},
    }
  )
