@FoodNewCtrl = ($scope, $state, foodData, FileUploader) ->

  # functions
  $scope.data = {}

  $scope.createFood = ->
    if $scope.formData.name && $scope.formData.size && $scope.formData.price
      foodData.save({}, $scope.formData
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

@FoodNewCtrl.$inject = ['$scope', '$state', 'foodData', 'FileUploader']

