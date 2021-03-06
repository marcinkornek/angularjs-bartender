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

  # # navigation

  $scope.navProductShow = (category, productId, productName) ->
    $state.go('product_show', {category: category, productId: productId, productName: productName})

@ProductsSearchCtrl.$inject = ['$scope', '$state', '$stateParams', '$http', 'productData', 'ordersData']
