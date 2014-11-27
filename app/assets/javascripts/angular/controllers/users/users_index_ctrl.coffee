@UsersIndexCtrl = ($scope, $state, $stateParams, $http, userData) ->

  # loading data

  $scope.loadUsers = (pageNo) ->
    $scope.data = {}
    userData.query({page: pageNo}
      , (users) =>
        $scope.data.users = users.users
        $scope.totalItems = users.number
        $scope.data.currentPage = pageNo
      , (error) ->
        console.log 'error'
        console.log error.status
    )

  # pagination

  $scope.loadUsers($stateParams.pageNo)

  $scope.pageChanged = ->
    $state.transitionTo('users_index', pageNo: $scope.data.currentPage, {})
    $stateParams.pageNo = $scope.data.currentPage
    console.log "Page changed to: " + $scope.data.currentPage
    $scope.loadUsers($scope.data.currentPage)

  # navigation

  $scope.navViewUser = (userId) ->
    $state.go('user_view', {userId: userId})

@UsersIndexCtrl.$inject = ['$scope', '$state', '$stateParams', '$http', 'userData']
