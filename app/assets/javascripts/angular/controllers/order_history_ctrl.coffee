@OrderHistoryCtrl = ($scope, $state, principal, $translate, ordersData) ->

 # loading data

  $scope.loadOrder = ->
    $scope.data = {}
    ordersData.query({}
      , (orders) ->
        $scope.data.orders = orders
        console.log 'order'
        console.log orders
        $scope.data.currentUser = window.currentUser  # it reads userId from head (see application.html.slim)
      , (error) ->
        console.log 'error'
        console.log error.status
    )

  $scope.loadOrder()

  # functions

@OrderHistoryCtrl.$inject = ['$scope', '$state', 'principal', '$translate', 'ordersData']
