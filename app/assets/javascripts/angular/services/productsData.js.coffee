angular.module('Bartender').factory "productData", ($resource) ->
  $resource("/api/products/:id", {id: "@id"},
    {
      update:               {method: "PUT"},
      search_results:       {method: "GET", isArray: true, url: '/api/product_search'},
      search_product_names: {method: "GET", isArray: true, url: '/api/product_names'},
    }
  )
