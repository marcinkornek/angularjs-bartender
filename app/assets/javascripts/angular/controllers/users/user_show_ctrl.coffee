@UserShowCtrl = ($scope, $stateParams, $state, userData) ->

  # temporary data

  $scope.loadTemporaryUser = ->
    $scope.data =
      user:
        username: 'Loading..'
        email: 'Loading..'
        id: 'Loading..'
        created_at: 'Loading..'
        role: 'Loading..'

  # loading data

  $scope.loadUser = ->
    userData.get({id: $stateParams.userId}
      , (user) ->
        $scope.data.user = user
        $scope.data.user.currentUser = window.currentUser  # it reads userId from head (see application.html.slim)
      , (error) ->
        console.log 'error'
        console.log error.status
        $scope.data.user.error = 'There is no such user'
    )

  $scope.loadTemporaryUser()
  $scope.loadUser()

  # functions

  $scope.destroyUser = ->
    user = $scope.data.user
    userData.delete(id: user.id)
    $state.go('home')

  # navigation

  $scope.navEditUser = (userId) ->
    $state.go('user_edit', {userId: userId})

  $scope.navViewUser = (userId) ->
    $state.go('user_view', {userId: userId})

@UserShowCtrl.$inject = ['$scope', '$stateParams', '$state', 'userData']
