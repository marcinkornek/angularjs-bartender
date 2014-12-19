# ###
# This img directive makes it so that if you put a loaded="" attribute on any
# img element in your app, the expression of that attribute will be evaluated
# after the images has finished loading. Use this to, for example, remove
# loading animations after images have finished loading.
# ###

angular.module("Bartender").directive "img", ->
  restrict: "E"
  link: ($scope, $element, $attributes) ->
    $element.bind "load", ->
      $scope.$eval $attributes.loaded  if $attributes.loaded
