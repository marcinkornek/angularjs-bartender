# ###
# based on http://stackoverflow.com/a/13472605/4043909
# ###

angular.module("Bartender")
  .directive "myResizeProductImages", ["$cookies", ($cookies) ->
    (scope, element, attrs) ->
      # angular.element(element).css "color", "blue"
      if scope.$last #it starts when last element is loaded
        img = $('.product-image img')
        height = $cookies.productImageSize || 100
        img.css('height', height)
  ]
