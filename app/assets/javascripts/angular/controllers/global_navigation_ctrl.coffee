@GlobalNavigationCtrl = ($scope, $state, sessionData, principal, $translate, ordersData) ->

  # navigation

  $scope.navHome = ->
    $state.go('home')

  $scope.navFood = ->
    $state.go('food_index')

  $scope.navDrinks = ->
    $state.go('home')

  $scope.navSnacks = ->
    $state.go('home')

  $scope.navOrdersHistory = ->
    $state.go('orders_history', {pageNo: 1})

@GlobalNavigationCtrl.$inject = ['$scope', '$state', 'sessionData', 'principal', '$translate', 'ordersData']
