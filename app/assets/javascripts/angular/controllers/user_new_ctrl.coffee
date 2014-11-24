@UserNewCtrl = ($scope, $state, userData, principal) ->

  # function

  $scope.principal = principal
  $scope.show = false

  $scope.showMe = ->
    if $scope.show == false
      $scope.show = true
    else
      $scope.show = false

  $scope.createUser = ->
    if $scope.formData.username && $scope.formData.email && $scope.formData.password && $scope.formData.password_confirmation
      userData.save({}, $scope.formData
        , (success) =>
          # console.log 'success'
          # console.log success.user
          # window.currentUser = success.user
          # principal.authenticate
          #   username: success.user.username
          #   roles: [ "User" ]
          $state.go('home')
        , (error) ->
          console.log 'error'
          console.log error
      )

@UserNewCtrl.$inject = ['$scope', '$state', 'userData', 'principal']

