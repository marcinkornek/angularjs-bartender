@GlobalNavigationCtrl = ($scope, $state, principal, $translate) ->

  # # loading data

  $scope.loadProducts = ->
    $scope.data = {}
    $scope.data.categories = window.categories

  $scope.loadProducts()

  # navigation

  $scope.navHome = ->
    $state.go('home')

  $scope.navProductIndex = (category) ->
    $state.go('products_index', {category: category})

  $scope.navOrdersHistory = ->
    $state.go('orders_history', {pageNo: 1})

@GlobalNavigationCtrl.$inject = ['$scope', '$state', 'principal', '$translate']
