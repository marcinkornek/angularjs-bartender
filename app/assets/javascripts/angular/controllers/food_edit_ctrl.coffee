@FoodEditCtrl = ($scope, $stateParams, $state, foodData, FileUploader) ->

  # temporary data

  $scope.loadTemporaryFood = ->
    $scope.formData =
      title: 'Loading..'
      contents: 'Loading..'

  # loading data

  $scope.loadFood = ->
    foodData.get({id: $stateParams.foodId}
      , (food) ->
        console.log food
        $scope.formData.name = food.name
        $scope.formData.size = food.size
        $scope.formData.price = food.price
        $scope.formData.image = food.image.thumb.url
        $scope.formData.id = food.id
      , (error) ->
        console.log 'error'
        console.log error.status
        $scope.formData.error = 'There is no such food'
    )

  $scope.loadTemporaryFood()
  $scope.loadFood()

  # functions

  $scope.editFood = (foodId) ->
    if $scope.formData.name && $scope.formData.size && $scope.formData.price && $scope.formData.price > 0
      foodData.update({}, $scope.formData
        , (success) =>
          console.log 'success'
          console.log success
          if $scope.uploader.queue[0] == undefined
            $state.go('food_index')
          else
            $scope.uploader.onCompleteAll = ->
              $state.go('food_index')
            $('.btn-primary').text('Please wait - file is uploading')
            $('.btn-primary').addClass('disabled')
            $scope.uploader.uploadAll()
        , (error) ->
          console.log 'error'
          console.log error
      )

  csrf_token = document.querySelector('meta[name="csrf-token"]').getAttribute('content')

  $scope.uploader = new FileUploader({
    url: "api/food/upload"
    headers : {
        'X-CSRF-TOKEN': csrf_token
    }
    removeAfterUpload : 'true'
    queueLimit : '1'
  })

@FoodEditCtrl.$inject = ['$scope', '$stateParams', '$state', 'foodData', 'FileUploader']
