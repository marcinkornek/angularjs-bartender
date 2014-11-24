angular.module('Bartender').factory "commentData", ($resource) ->
  $resource("/api/comments/", {},
    {
      save:       {method: "POST", url: '/api/comments' },
      update:     {method: "PUT"},
      query:      {method: "GET", isArray: false}
    }
  )
