@GlobalNavigationCtrl = ($scope, $state, sessionData, principal, $translate, ordersData) ->

  # navigation

  $scope.navHome = ->
    $state.go('home')

  $scope.navOrdersHistory = ->
    $state.go('orders_history')

@GlobalNavigationCtrl.$inject = ['$scope', '$state', 'sessionData', 'principal', '$translate', 'ordersData']
