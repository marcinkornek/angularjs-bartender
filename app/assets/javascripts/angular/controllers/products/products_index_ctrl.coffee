@ProductsIndexCtrl = ($scope, $state, $stateParams, $http, productData, ordersData ) ->

  # # loading data

  $scope.loadProducts = ->
    $scope.data = window.products || {}
    $scope.data.category = $stateParams.category
    $scope.data.current_user = window.currentUser
    productData.query({category: $stateParams.category}
      , (products) =>
        $scope.data.products = products
        window.products = products
      , (error) ->
        console.log 'error'
        console.log error.status
    )

  $scope.loadProducts()

  # # functions

  $scope.hoverIn = ->
    @hoverEdit = true

  $scope.hoverOut = ->
    @hoverEdit = false

  # # navigation

  $scope.navProductShow = (category, productId, productName) ->
    $state.go('product_show', {category: category, productId: productId, productName: productName})

  $scope.navProductNew = ->
    $state.go('product_new')

  $scope.navProductEdit = (category, productId, productName) ->
    $state.go('product_edit', {category: category, productId: productId, productName: productName})

@ProductsIndexCtrl.$inject = ['$scope', '$state', '$stateParams', '$http', 'productData', 'ordersData']
