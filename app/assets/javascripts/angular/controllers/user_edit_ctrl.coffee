@UserEditCtrl = ($scope, $stateParams, $state, userData, FileUploader) ->

  # temporary data

  $scope.loadTemporaryUser = ->
    $scope.formData =
      username: 'Loading..'
      email: 'Loading..'

  # loading data

  $scope.loadUser = ->
    userData.get({id: $stateParams.userId}
      , (user) ->
        # console.log user
        $scope.formData.username = user.username
        $scope.formData.email = user.email
        $scope.formData.id = user.id
        $scope.formData.avatar = user.avatar.avatar.thumb.url
      , (error) ->
        console.log 'error'
        console.log error.status
        $scope.formData.error = 'There is no such user'
    )

  $scope.loadTemporaryUser()
  $scope.loadUser()

  # functions

  $scope.editUser = (userId) ->
    if $scope.formData.email && $scope.formData.username
      user = $scope.formData
      userData.update({}, user
        , (success) =>
          # console.log 'success'
          # console.log success
          window.currentUser.username = success.username
          if $scope.uploader.queue[0] == undefined
            $state.go('user_show', {userId: userId})
          else
            $scope.uploader.onCompleteAll = ->
              $state.go('user_show', {userId: userId})
            $('.btn-primary').text('Please wait - file is uploading')
            $('.btn-primary').addClass('disabled')
            $scope.uploader.uploadAll()
        , (error) ->
          console.log 'error'
          # console.log error.data.error
          $scope.formData.user_error = error.data.error
          $scope.formData.username_error = 'Username ' + error.data.username if error.data.username
          $scope.formData.email_error = 'Email ' + error.data.email if error.data.email
      )

  csrf_token = document.querySelector('meta[name="csrf-token"]').getAttribute('content')

  $scope.uploader = new FileUploader({
    url: "api/users/upload"
    headers : {
        'X-CSRF-TOKEN': csrf_token
    }
    removeAfterUpload : 'true'
    queueLimit : '1'
  })

@UserEditCtrl.$inject = ['$scope', '$stateParams', '$state', 'userData', 'FileUploader']
