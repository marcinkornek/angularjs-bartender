@ProductsSearchCtrl = ($scope, $state, $stateParams, $http, productData, ordersData) ->

  # # loading data

  $scope.searchProducts = ->
    $scope.data = {}
    productData.search_results({query: $stateParams.searchQuery}
      , (success) =>
        # console.log 'success'
        # console.log success
        $scope.data.products = success
      , (error) ->
        console.log 'error'
        console.log error
    )

  $scope.searchProducts()

  $scope.loadProduct = ->
    $scope.formData = {}
    $scope.formData.amount = 1
    $scope.data.current_user = window.currentUser
    # console.log window.currentUser
    productData.get({id: $stateParams.productId}
      , (product) ->
        $scope.data.product = product
        $scope.data.product_category = product.product.category
        $scope.formData.product_detail = product.product_details[1] || product.product_details[0]
        # console.log product
      , (error) ->
        console.log 'error'
        console.log error.status
        $scope.data.product.error = 'There is no such product'
    )

  if $stateParams.productId
    $scope.loadProduct()

  # # functions

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
          $state.go('home')
        , (error) da          console.log 'error'
          console.log error
      )

  $scope.clearOrder = ->
    productData.get({id: $stateParams.productId}
      , (product) ->
        console.log product.product_details[1] || product.product_details[0]
        $scope.formData.product_detail = product.product_details[1] || product.product_details[0])
    $scope.formData.amount = 1

  $scope.label = (size_type, size, price, currency) ->
    switch size_type
      when 'milliliters'
        size+"ml - "+price+" "+currency
      when 'grams'
        size+"g - "+price+" "+currency
      when 'size'
        size+" - "+price+" "+currency

  # # navigation

  $scope.navProductShow = (category, productId, productName) ->
    $state.go('product_show', {category: category, productId: productId, productName: productName})

@ProductsSearchCtrl.$inject = ['$scope', '$state', '$stateParams', '$http', 'productData', 'ordersData']
