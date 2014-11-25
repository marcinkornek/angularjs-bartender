angular.module('Bartender').factory "ordersData", ($resource) ->
  $resource("/api/orders/:id", {id: "@id"},
    {
      update:        {method: "PUT"},
      order_summary: {method: "GET", isArray: false, url: '/api/order_summary'},
      order_close:   {method: "POST", url: '/api/order_close'},
    }
  )
