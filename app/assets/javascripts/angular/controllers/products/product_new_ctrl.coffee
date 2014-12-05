@ProductNewCtrl = ($scope, $state, productData, FileUploader) ->

  # select fields options

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

  $scope.formData = {}
  $scope.formData.details = [{
      size: '',
      price: ''
    }]

  $scope.removeDetail = (index) ->
    $scope.formData.details.splice index, 1

  $scope.addDetail = ->
    $scope.formData.details.push {
      size: '',
      price: ''
    }

  # functions
  $scope.data = {}

  $scope.createProduct = ->
    console.log $scope.formData.details
    if $scope.formData.category && $scope.formData.size_type && $scope.formData.name && $scope.formData.details
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

