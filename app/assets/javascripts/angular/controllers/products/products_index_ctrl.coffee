@ProductsIndexCtrl = ($scope, $state, $stateParams, $http, productData, ordersData, $cookies) ->

  # # loading data

  $scope.loadProducts = ->
    $scope.data = window.products || {}
    $scope.data.category = $stateParams.category
    $scope.data.current_user = window.currentUser
    a = productData.query({category: $stateParams.category}
      , (products) =>
        $scope.data.products = products
        # console.log products
        window.products = products
      , (error) ->
        console.log 'error'
        console.log error.status
    ).$promise.then ->
        # console.log 'promise'
        $scope.setImageSizeFromCookie()

  $scope.setImageSizeFromCookie = ->
    _.delay ->
      img = $('.product-image img')
      height = $cookies.productImageSize || 100
      img.css('height', height)
    , 1
    false

  # # functions

  $scope.hoverIn = ->
    @hoverEdit = true

  $scope.hoverOut = ->
    @hoverEdit = false

  $scope.changeImagesSize = (def, sign) ->
    img = $('.product-image img')
    current_height = img[0].height
    switch sign
      when '+'
        height = current_height + 10
      when '-'
        if current_height > 109
          height = current_height - 10
      when 'default'
        height = def
    img.css('height', height)
    $cookies.productImageSize = height
    console.log $cookies.productImageSize

    false

  $scope.loadProducts()

  # # navigation

  $scope.navProductShow = (category, productId, productName) ->
    $state.go('product_show', {category: category, productId: productId, productName: productName})

  $scope.navProductNew = ->
    $state.go('product_new')

  $scope.navProductEdit = (category, productId, productName) ->
    $state.go('product_edit', {category: category, productId: productId, productName: productName})

@ProductsIndexCtrl.$inject = ['$scope', '$state', '$stateParams', '$http', 'productData', 'ordersData', '$cookies']
