@ProductShowCtrl = ($scope, $stateParams, $state, productData, ordersData, $translate) ->

  # loading data

  $scope.loadProduct = ->
    $scope.data = {}
    $scope.data.current_user = window.currentUser
    # console.log window.currentUser
    productData.get({id: $stateParams.productId}
      , (product) ->
        $scope.data.product = product
        # console.log product
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
    console.log $scope.formData.product_detail
    if $scope.formData.product_detail && $scope.formData.amount > 0
      amount = $scope.formData.amount
      product_id = $scope.data.product.product.id
      size_type = $scope.formData.size_type
      size = $scope.formData.product_detail.size
      price = $scope.formData.amount * $scope.formData.product_detail.price

      ordersData.save({}, {amount: amount, id: product_id, size: size, price: price }
        , (success) =>
          # console.log 'success'
          # console.log success
          # $state.go('home')
          $state.go('home')
        , (error) ->
          console.log 'error'
          console.log error
      )

  $scope.clearOrder = ->
    $scope.formData.amount = ''
    $scope.formData.product_detail = ''
    $scope.productOrder.$setPristine()

  $scope.label = (size_type, size, price, currency) ->
    switch size_type
      when 'milliliters'
        size+"ml - "+price+" "+currency
      when 'grams'
        size+"g - "+price+" "+currency
      when 'size'
        size+" - "+price+" "+currency

  # navigation

  $scope.navProductEdit = (category, productId, productName) ->
    $state.go('product_edit', {category: category, productId: productId, productName: productName})

@ProductShowCtrl.$inject = ['$scope', '$stateParams', '$state', 'productData', 'ordersData', '$translate']
