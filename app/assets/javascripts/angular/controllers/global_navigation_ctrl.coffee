@GlobalNavigationCtrl = ($scope, $state, sessionData, principal, $translate, ordersData) ->

  # navigation

  $scope.navHome = ->
    $state.go('home')

  $scope.navProductIndex = (scope, category) ->
    $state.go(scope, {category: category})

  $scope.navOrdersHistory = ->
    $state.go('orders_history', {pageNo: 1})

@GlobalNavigationCtrl.$inject = ['$scope', '$state', 'sessionData', 'principal', '$translate', 'ordersData']
