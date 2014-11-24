angular.module('Bartender').factory "orderDetailsData", ($resource) ->
  $resource("/api/order_details/:id", {id: "@id"},
    {
      update:     {method: "PUT"},
    }
  )
