@GlobalFooterCtrl = ($scope, $state) ->

  # navigation

  $scope.navAbout = ->
    $state.go('about')

@GlobalFooterCtrl.$inject = ['$scope', '$state']
