@CategoryShowCtrl = ($scope, $stateParams, $state, categoryData) ->

  # loading data

  $scope.loadPost = ->
    categoryData.get({id: $stateParams.postId}
      , (post) ->
        $scope.data.post = post
        # console.log post
        $scope.data.currentUser = window.currentUser  # it reads userId from head (see application.html.slim)
      , (error) ->
        console.log 'error'
        console.log error.status
        $scope.data.post.error = 'There is no such post'
    )

  $scope.loadTemporaryCategory()
  $scope.loadPost(1)

  # functions

  $scope.destroyPost = ->
    post = $scope.data.post
    categoryData.delete(id: post.id)
    $state.go('home')

  # navigation

  $scope.navEditPost = (postId) ->
    $state.go('post_edit', {postId: postId})

  $scope.navViewUser = (userId) ->
    $state.go('user_view', {userId: userId})

@CategoryShowCtrl.$inject = ['$scope', '$stateParams', '$state', 'categoryData']
