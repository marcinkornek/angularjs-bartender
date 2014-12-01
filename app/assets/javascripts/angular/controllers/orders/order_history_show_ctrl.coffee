@OrderHistoryShowCtrl = ($scope, $state, principal, $stateParams, $translate, ordersData) ->

 # loading data

  $scope.loadOrder = ->
    $scope.data = {}
    ordersData.get({id: $stateParams.orderId}
      , (orders) ->
        $scope.data.orders = orders
        # console.log 'order'
        # console.log orders
      , (error) ->
        console.log 'error'
        console.log error.status
    )

  $scope.loadOrder()

  # navigation

  $scope.navProductShow = (category, productId, productName) ->
    $state.go('product_show', {category: category, productId: productId, productName: productName})

@OrderHistoryShowCtrl.$inject = ['$scope', '$state', 'principal', '$stateParams', '$translate', 'ordersData']
