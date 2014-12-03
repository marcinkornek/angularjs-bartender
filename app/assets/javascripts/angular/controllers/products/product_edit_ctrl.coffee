@ProductEditCtrl = ($scope, $stateParams, $state, productData, FileUploader) ->

  # select fields data

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

  # temporary data

  $scope.loadTemporaryProduct = ->
    $scope.formData =
      name: 'Loading..'
      size: 'Loading..'
      price: 'Loading..'

  # loading data

  $scope.loadProduct = ->
    productData.get({id: $stateParams.productId}
      , (product) ->
        console.log product
        $scope.formData.name = product.name
        $scope.formData.category = product.category
        $scope.formData.product_type = product.product_type
        $scope.formData.size = product.size
        $scope.formData.price = product.price
        $scope.formData.image = product.image.thumb.url
        $scope.formData.id = product.id
      , (error) ->
        console.log 'error'
        console.log error.status
        $scope.formData.error = 'There is no such product'
    )

  $scope.loadTemporaryProduct()
  $scope.loadProduct()

  # functions

  $scope.editProduct = (productId) ->
    if $scope.formData.name && $scope.formData.size && $scope.formData.price && $scope.formData.price > 0
      productData.update({}, $scope.formData
        , (success) =>
          console.log 'success'
          console.log success
          if $scope.uploader.queue[0] == undefined
            $state.go('home')
          else
            $scope.uploader.onCompleteAll = ->
              $state.go('home')
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

@ProductEditCtrl.$inject = ['$scope', '$stateParams', '$state', 'productData', 'FileUploader']
