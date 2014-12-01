@GlobalHeaderCtrl = ($scope, $state, sessionData, productData, principal, $translate) ->

  $scope.names = ["john", "bill", "charlie", "robert", "alban", "oscar", "marie", "celine", "brad", "drew", "rebecca", "michel", "francis", "jean", "paul", "pierre", "nicolas", "alfred", "gerard", "louis", "albert", "edouard", "benoit", "guillaume", "nicolas", "joseph"]

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

  $scope.searchProducts = ->
    if $scope.formData.search_query
      $state.go('products_search', {searchQuery: $scope.formData.search_query})


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


@GlobalHeaderCtrl.$inject = ['$scope', '$state', 'sessionData', 'productData', 'principal', '$translate']
