@ProductNewCtrl = ($scope, $state, productData, FileUploader) ->

  $scope.categories = [
    'food',
    'drinks',
    'alcohol'
    'snacks'
  ]

  $scope.types = [
    'milliliters',
    'grams',
    'size'
  ]

  $scope.sizes = [
    'small',
    'medium',
    'large'
  ]

  # functions
  $scope.data = {}

  $scope.createProduct = ->
    if $scope.formData.category && $scope.formData.product_type && $scope.formData.name && $scope.formData.size && $scope.formData.price
      productData.save({}, $scope.formData
        , (success) =>
          console.log 'success'
          console.log success
          if $scope.uploader.queue[0] == undefined
            $state.go('products_index', {category: success.category})
          else
            $scope.uploader.onCompleteAll = ->
              $state.go('products_index', {category: success.category})
            $('.btn-primary').text('Please wait - file is uploading')
            $('.btn-primary').addClass('disabled')
            $scope.uploader.uploadAll()
        , (error) ->
          console.log 'error'
          console.log error
      )

  csrf_token = document.querySelector('meta[name="csrf-token"]').getAttribute('content')

  $scope.uploader = new FileUploader({
    url: "api/products/upload"
    headers : {
        'X-CSRF-TOKEN': csrf_token
    }
    removeAfterUpload : 'true'
    queueLimit : '1'
  })

@ProductNewCtrl.$inject = ['$scope', '$state', 'productData', 'FileUploader']

