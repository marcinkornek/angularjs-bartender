@ProductShowCtrl = ($scope, $stateParams, $state, productData, ordersData) ->

  # loading data

  $scope.loadProduct = ->
    $scope.data = {}
    $scope.data.current_user = window.currentUser
    console.log window.currentUser
    productData.get({id: $stateParams.productId}
      , (product) ->
        $scope.data.product = product
        console.log product
      , (error) ->
        console.log 'error'
        console.log error.status
        $scope.data.product.error = 'There is no such product'
    )

  $scope.loadProduct()

  # functions

  $scope.destroyProduct = ->
    product = $scope.data.product
    productData.delete(id: product.id)
    $state.go('home')

  $scope.createOrder = ->
    ordersData.save({}, {amount: $scope.formData.amount, type: 'Product', id: $scope.data.product.id, price: $scope.data.product.price}
      , (success) =>
        console.log 'success'
        console.log success
        $state.go('home')
      , (error) ->
        console.log 'error'
        console.log error
    )

  $scope.clearOrder = ->
    $scope.formData.amount = ''
    $scope.productOrder.$setPristine()

  # navigation

  $scope.navProductEdit = (productId, productName) ->
    $state.go('product_edit', {category: $stateParams.category, productId: productId, productName: productName})

@ProductShowCtrl.$inject = ['$scope', '$stateParams', '$state', 'productData', 'ordersData']
