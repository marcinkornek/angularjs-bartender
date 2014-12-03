angular.module('Bartender').factory "productData", ($resource) ->
  $resource("/api/products/:id", {id: "@id"},
    {
      query:                {isArray: false},
      update:               {method: "PUT"},
      search_results:       {method: "GET", isArray: false, url: '/api/search_results'},
      search_product_names: {method: "GET", isArray: true, url: '/api/product_names'},
    }
  )
