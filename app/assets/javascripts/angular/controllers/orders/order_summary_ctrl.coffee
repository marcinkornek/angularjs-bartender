@OrderSummaryCtrl = ($scope, $state, principal, $translate, ordersData) ->

 # loading data

  $scope.loadOrder = ->
    $scope.data = {}
    ordersData.order_summary({}
      , (orders) ->
        $scope.data.orders = orders
        # console.log 'order'
        # console.log orders
        $scope.data.currentUser = window.currentUser  # it reads userId from head (see application.html.slim)
      , (error) ->
        console.log 'error'
        console.log error.status
    )

  $scope.loadOrder()

  # functions

  $scope.closeOrder = ->
    ordersData.order_close({}
      , (orders) ->
        console.log 'order'
        console.log orders
        $state.go('order_summary')
      , (error) ->
        console.log 'error'
        console.log error.status
    )

  $scope.destroyOrder = ->
    ordersData.order_destroy({}
      , (orders) ->
        console.log 'order'
        console.log orders
        $state.go('home', {}, {reload: true})
      , (error) ->
        console.log 'error'
        console.log error.status
    )

  $scope.destroyOrderDetail = (orderId) ->
    ordersData.order_detail_destroy({orderId}
      , (orders) ->
        console.log 'order'
        console.log orders
        $state.go('home', {}, {reload: true})
      , (error) ->
        console.log 'error'
        console.log error.status
    )

  # navigation

  $scope.navHome = ->
    $state.go('home')

@OrderSummaryCtrl.$inject = ['$scope', '$state', 'principal', '$translate', 'ordersData']
