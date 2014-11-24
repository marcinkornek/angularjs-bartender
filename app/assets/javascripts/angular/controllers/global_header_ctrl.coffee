@GlobalHeaderCtrl = ($scope, $state, sessionData, principal, $translate) ->

  # functions

  $scope.destroySession = ->
    sessionData.delete((response) ->
      # console.log response.token
      $('meta[name=csrf-token]').attr('content', response.token) # after logout it is necessary to assign new csrf-token
      $scope.data = {}
      window.currentUser = {}
      principal.authenticate(null)
      $state.go('home', {}, {reload: true})
    )

  $scope.changeLanguage = (key) ->
     $translate.use key

  # dropdown

  $scope.status = isopen: false

  $scope.toggled = (open) ->
    console.log "Dropdown is now: ", open

  $scope.toggleDropdown = ($event) ->
    $event.preventDefault()
    $event.stopPropagation()
    $scope.status.isopen = not $scope.status.isopen

  # loading data

  $scope.loadData = ->
    $scope.data = {}
    $scope.data.user =  window.currentUser

  $scope.loadData()

  # navigation

  $scope.navHome = ->
    $state.go('home')

  $scope.navNewSession = ->
    $state.go('sign_in')

  $scope.navNewUser = ->
    $state.go('sign_up')

  $scope.navViewUser = (userId) ->
    $state.go('user_show', {userId: userId})

  $scope.navEditUser = (userId) ->
    $state.go('user_edit', {userId: userId})


@GlobalHeaderCtrl.$inject = ['$scope', '$state', 'sessionData', 'principal', '$translate']
