@GlobalNavigationCtrl = ($scope, $state, sessionData, principal, $translate, ordersData) ->

  # navigation

  $scope.navHome = ->
    $state.go('home')

 # loading data

  $scope.loadOrder = ->
    $scope.data = {}
    ordersData.get({}
      , (orders) ->
        $scope.data.orders = orders
        console.log 'order'
        console.log orders
        $scope.data.currentUser = window.currentUser  # it reads userId from head (see application.html.slim)
      , (error) ->
        console.log 'error'
        console.log error.status
        $scope.data.order.error = 'There is no such order'
    )

  $scope.loadOrder(1)

@GlobalHeaderCtrl.$inject = ['$scope', '$state', 'sessionData', 'principal', '$translate', 'ordersData']
