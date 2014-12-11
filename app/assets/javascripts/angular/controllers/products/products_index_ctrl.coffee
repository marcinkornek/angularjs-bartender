@ProductsIndexCtrl = ($scope, $state, $stateParams, $http, productData, ordersData ) ->

  # # loading data

  $scope.loadProducts = ->
    $scope.data = {}
    $scope.data.category = $stateParams.category
    $scope.data.current_user = window.currentUser
    productData.query({category: $stateParams.category}
      , (products) =>
        $scope.data.products = products
      , (error) ->
        console.log 'error'
        console.log error.status
    )

  $scope.loadProduct = ->
    $scope.data = {}
    $scope.formData = {}
    $scope.formData.amount = 1
    $scope.data.current_user = window.currentUser
    productData.get({id: $stateParams.productId}
      , (product) ->
        $scope.data.product = product
        $scope.formData.product_detail = product.product_details[1] || product.product_details[0]
      , (error) ->
        console.log 'error'
        console.log error.status
        $scope.data.product.error = 'There is no such product'
    )

  $scope.loadProducts()

  if $stateParams.productId
    $scope.loadProduct()

  # # functions

  $scope.createOrder = ->
    console.log $scope.formData.product_detail
    console.log $scope.formData.amount
    if $scope.formData.product_detail && $scope.formData.amount > 0
      amount = $scope.formData.amount
      product_id = $scope.data.product.product.id
      size_type = $scope.formData.size_type
      size = $scope.formData.product_detail.size
      price = $scope.formData.amount * $scope.formData.product_detail.price

      ordersData.save({}, {amount: amount, id: product_id, size: size, price: price }
        , (success) =>
          $state.go('home')
        , (error) ->
          console.log 'error'
          console.log error
      )

  $scope.clearOrder = ->
    productData.get({id: $stateParams.productId}
      , (product) ->
        console.log product.product_details[1] || product.product_details[0]
        $scope.formData.product_detail = product.product_details[1] || product.product_details[0])
    $scope.formData.amount = 1
    # $scope.productOrder.$setPristine()

  $scope.label = (size_type, size, price, currency) ->
    switch size_type
      when 'milliliters'
        size+"ml - "+price+" "+currency
      when 'grams'
        size+"g - "+price+" "+currency
      when 'size'
        size+" - "+price+" "+currency

  $scope.changeSelected = (sign) ->
    a = $('select')
    max_value = $scope.data.product.product_details.length - 1
    value = parseFloat(a.val())
    switch sign
      when '+'
        if value < max_value
          a.val(value + parseFloat(1))
      when '-'
        if value > 0
          a.val(value - parseFloat(1))
    return false

  $scope.changeNumber = (number, sign) ->
    switch sign
      when '+'
        if $scope.formData.amount >= 0
          $scope.formData.amount += number
      when '-'
        if $scope.formData.amount > 0
          $scope.formData.amount -= number

  # # navigation

  $scope.navProductShow = (category, productId, productName) ->
    $state.go('product_show', {category: category, productId: productId, productName: productName})

  $scope.navProductNew = ->
    $state.go('product_new')

  $scope.navProductEdit = (category, productId, productName) ->
    $state.go('product_edit', {category: category, productId: productId, productName: productName})

@ProductsIndexCtrl.$inject = ['$scope', '$state', '$stateParams', '$http', 'productData', 'ordersData']
