@GlobalHeaderCtrl = ($scope, $state, sessionData, productData, principal, $translate, $stateParams) ->

  # loading data

  $scope.loadSearchQuery = ->
    $scope.formData = {}
    $scope.formData.search_query = $stateParams.searchQuery

  $scope.readCookie = (name) ->
    nameEQ = name + "="
    ca = document.cookie.split(";")
    i = 0

    while i < ca.length
      c = ca[i]
      c = c.substring(1, c.length)  while c.charAt(0) is " "
      return c.substring(nameEQ.length, c.length)  if c.indexOf(nameEQ) is 0
      i++
    null

  $scope.loadSearchQuery()

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

  $scope.setLanguage = ->
    $scope.data = {}
    $scope.data.locale = $scope.readCookie('locale')
    $translate.use $scope.data.locale

  $scope.setLanguage()

  $scope.changeLanguage = (key) ->
    $translate.use key
    document.cookie = 'locale='+key+'; path=/'
    $scope.data.locale = $scope.readCookie('locale')

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
    $scope.data.locale = $scope.readCookie('locale')

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

  $scope.navOrdersHistory = ->
    $state.go('orders_history', {pageNo: 1})

@GlobalHeaderCtrl.$inject = ['$scope', '$state', 'sessionData', 'productData', 'principal', '$translate', '$stateParams']
