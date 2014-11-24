@GlobalNavigationCtrl = ($scope, $state, sessionData, principal, $translate) ->

  # navigation

  $scope.navHome = ->
    $state.go('home')

@GlobalHeaderCtrl.$inject = ['$scope', '$state', 'sessionData', 'principal', '$translate']
