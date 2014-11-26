@FoodIndexCtrl = ($scope, $state, $stateParams, $http, foodData) ->

  # # loading data

  $scope.loadFood = ->
    $scope.data = {}
    foodData.query({}
      , (food) =>
        $scope.data.food = food
      , (error) ->
        console.log 'error'
        console.log error.status
    )

  $scope.loadFood()

  # # navigation

  $scope.navFoodShow = (foodId, foodName) ->
    $state.go('food_show', {foodId: foodId, foodName: foodName})

  $scope.navFoodNew = ->
    $state.go('food_new')

@FoodIndexCtrl.$inject = ['$scope', '$state', '$stateParams', '$http', 'foodData']
