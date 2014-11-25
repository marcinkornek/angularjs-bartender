@CategoriesIndexCtrl = ($scope, $state, $stateParams, $http, categoryData) ->

  # # loading data

  $scope.loadCategories = ->
    $scope.data = {}
    categoryData.query({}
      , (categories) =>
        $scope.data.categories = categories
      , (error) ->
        console.log 'error'
        console.log error.status
    )

  $scope.loadCategories()

  # # navigation

  $scope.navCategoryShow = (categoryId) ->
    $state.go('category_show', {categoryId: categoryId})

  $scope.navFoodIndex = ->
    $state.go('food_index')

  $scope.navDrinksIndex = ->
    $state.go('drinks_index')

  $scope.navSnacksIndex = ->
    $state.go('snacks_index')

@CategoriesIndexCtrl.$inject = ['$scope', '$state', '$stateParams', '$http', 'categoryData']
