@FoodShowCtrl = ($scope, $stateParams, $state, foodData, ordersData) ->

  # loading data

  $scope.loadFood = ->
    $scope.data = {}
    foodData.get({id: $stateParams.foodId}
      , (food) ->
        $scope.data.food = food
        console.log food
        $scope.data.currentUser = window.currentUser  # it reads userId from head (see application.html.slim)
      , (error) ->
        console.log 'error'
        console.log error.status
        $scope.data.food.error = 'There is no such food'
    )

  $scope.loadFood(1)

  # functions

  $scope.destroyFood = ->
    food = $scope.data.food
    foodData.delete(id: food.id)
    $state.go('home')

  $scope.createOrder = ->
    ordersData.save({}, {amount: $scope.formData.amount, type: 'Food', id: $scope.data.food.id, price: $scope.data.food.price}
      , (success) =>
        console.log 'success'
        console.log success
        $state.go('home')
      , (error) ->
        console.log 'error'
        console.log error
    )

  $scope.clearOrder = ->
    $scope.formData.amount = ''
    $scope.foodOrder.$setPristine()



  # navigation

  $scope.navEditFood = (foodId) ->
    $state.go('food_edit', {foodId: foodId})

@FoodShowCtrl.$inject = ['$scope', '$stateParams', '$state', 'foodData', 'ordersData']
