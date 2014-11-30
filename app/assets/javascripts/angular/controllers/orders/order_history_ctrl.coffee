@OrderHistoryCtrl = ($scope, $state, principal, $stateParams, $translate, ordersData) ->

 # loading data

  $scope.loadOrder = (pageNo) ->
    $scope.data = {}
    ordersData.query({page: pageNo}
      , (orders) ->
        $scope.data.orders = orders
        # console.log 'order'
        # console.log orders
        $scope.totalItems = orders.number
        $scope.data.currentPage = pageNo
        $scope.data.currentUser = window.currentUser  # it reads userId from head (see application.html.slim)
      , (error) ->
        console.log 'error'
        console.log error.status
    )

  $scope.loadOrder($stateParams.pageNo)

  # pagination

  $scope.pageChanged = ->
    $state.transitionTo('orders_history', pageNo: $scope.data.currentPage, {})
    $stateParams.pageNo = $scope.data.currentPage
    console.log "Page changed to: " + $scope.data.currentPage
    $scope.loadOrder($scope.data.currentPage)

@OrderHistoryCtrl.$inject = ['$scope', '$state', 'principal', '$stateParams', '$translate', 'ordersData']
