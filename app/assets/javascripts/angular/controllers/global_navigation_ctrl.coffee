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

  $scope.navProductRecent = ->
    $state.go('recent_products_index')

@GlobalNavigationCtrl.$inject = ['$scope', '$state', 'principal', '$translate']
