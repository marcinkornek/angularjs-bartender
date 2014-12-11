@ProductEditCtrl = ($scope, $stateParams, $state, productData, FileUploader) ->

  # select fields data

  $scope.categories = [
    'food',
    'drinks',
    'alcohol',
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

  # product details dynamic fields

  $scope.removeDetail = (index) ->
    $scope.formData.details.splice index, 1

  $scope.addDetail = ->
    $scope.formData.details.push {
      size: '',
      price: ''
    }

  # temporary data

  $scope.loadTemporaryProduct = ->
    $scope.formData =
      name: 'Loading..'

  # loading data

  $scope.loadProduct = ->
    productData.get({id: $stateParams.productId}
      , (product) ->
        # console.log product
        $scope.formData.product = product
        $scope.formData.name = product.product.name
        $scope.formData.size_type = product.product.size_type
        $scope.formData.category = product.product.category
        $scope.formData.description = product.product.description
        $scope.formData.image = product.product.image.image.thumb.url
        $scope.formData.id = product.product.id
        $scope.formData.details = product.product_details
      , (error) ->
        console.log 'error'
        console.log error.status
        $scope.formData.error = 'There is no such product'
    )

  $scope.loadTemporaryProduct()
  $scope.loadProduct()

  # functions

  $scope.editProduct = (productId) ->
    console.log $scope.formData.details
    if $scope.formData.category && $scope.formData.size_type && $scope.formData.name && $scope.formData.details
      productData.update({}, $scope.formData
        , (success) =>
          console.log 'success'
          # console.log success
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
