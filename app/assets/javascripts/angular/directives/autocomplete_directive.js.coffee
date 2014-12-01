angular.module("Bartender").directive "autoComplete",[ "$http", ($http) ->
  require: "ngModel"
  link: (scope, elem, attrs, ctrl) ->

    elem.one 'input', ->

    # function uses 'underscore.js' function 'debounce' -> function inside debounce is invoked after time in parameter (in miliseconds)

      debouncedRequest = _.debounce((value) ->
        params = {}
        params['query'] = value
        console.log value
        $http.get("/api/product_names",
          params: params
        )
        .success((data, status, headers, cfg) ->
          console.log 'success'
          $('#search').autocomplete
            source: data
            minLength: 2
          console.log data
        )
        .error ((data, status, headers, cfg) ->
          console.log 'error'
        )
      , 500)
      scope.$watch attrs.ngModel, debouncedRequest
 ]
