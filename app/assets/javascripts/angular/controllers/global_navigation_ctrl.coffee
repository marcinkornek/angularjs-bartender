@GlobalNavigationCtrl = ($scope, $state, sessionData, principal, $translate, ordersData) ->

  # navigation

  $scope.navHome = ->
    $state.go('home')

@GlobalNavigationCtrl.$inject = ['$scope', '$state', 'sessionData', 'principal', '$translate', 'ordersData']
