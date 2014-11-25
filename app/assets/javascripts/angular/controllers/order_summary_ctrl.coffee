@OrderSummaryCtrl = ($scope, $state, sessionData, principal, $translate, ordersData) ->

 # loading data

  $scope.loadOrder = ->
    $scope.data = {}
    ordersData.order_summary({}
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

  $scope.closeOrder = (order) ->
    ordersData.order_close({}
      , (orders) ->
        console.log 'order'
        console.log orders
        $state.go('order_summary')
      , (error) ->
        console.log 'error'
        console.log error.status
    )


@OrderSummaryCtrl.$inject = ['$scope', '$state', 'sessionData', 'principal', '$translate', 'ordersData']
