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

  $scope.readCookie = (name) ->
    nameEQ = name + "="
    ca = document.cookie.split(";")
    i = 0

    while i < ca.length
      c = ca[i]
      c = c.substring(1, c.length)  while c.charAt(0) is " "
      return c.substring(nameEQ.length, c.length)  if c.indexOf(nameEQ) is 0
      i++
    null

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
    document.cookie =
      'productImageSize='+height+'; path=/'
    console.log $scope.readCookie('productImageSize')
    false

  $scope.setImageSizeFromCookie = ->
    # _.delay ->
    img = $('.product-image img')
    # console.log img
    height = $scope.readCookie('productImageSize') || 100
    # console.log height
    img.css('height', height)
    # , 2000
    false

  # $scope.setImageSizeFromCookie()

  # # navigation

  $scope.navProductShow = (category, productId, productName) ->
    $state.go('product_show', {category: category, productId: productId, productName: productName})

  $scope.navProductNew = ->
    $state.go('product_new')

  $scope.navProductEdit = (category, productId, productName) ->
    $state.go('product_edit', {category: category, productId: productId, productName: productName})

@ProductsIndexCtrl.$inject = ['$scope', '$state', '$stateParams', '$http', 'productData', 'ordersData']
