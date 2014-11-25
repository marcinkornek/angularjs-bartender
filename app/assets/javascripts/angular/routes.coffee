angular.module('Bartender').config ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise('/');

  $stateProvider
    .state('home', {
      url: '/',
      data: {
        roles: []
      },
      views: {
        "header":     { controller: 'GlobalHeaderCtrl', templateUrl: 'header/header.html' }
        "body":       { controller: 'SessionNewCtrl',  templateUrl: 'body/sessions/session_new.html' }
      }
      data: {
        roles: ['User']
      }
      views: {
        "header":     { controller: 'GlobalHeaderCtrl', templateUrl: 'header/header.html' }
        "navigation": { controller: 'GlobalNavigationCtrl', templateUrl: 'navigation/navigation.html' }
        "body":       { controller: 'CategoriesIndexCtrl',  templateUrl: 'body/categories/categories_index.html' }
        "order":      { controller: 'OrderSummaryCtrl',  templateUrl: 'body/orders/orders_index.html' }
      }
    })

    # Sessions
    .state('sign_in', {
      url: '/session/new',
      data: {
        roles: []
      },
      views: {
        "header": { controller: 'GlobalHeaderCtrl',   templateUrl: 'header/header.html' }
        "body":   { controller: 'SessionNewCtrl',  templateUrl: 'body/sessions/session_new.html' }
      }
    })

    # User
    .state('sign_up', {
      url: '/user/new',
      data: {
        roles: []
      },
      views: {
        "header":     { controller: 'GlobalHeaderCtrl', templateUrl: 'header/header.html' },
        "body":       { controller: 'UserNewCtrl',   templateUrl: 'body/users/user_new.html' },
        "errors@sign_up": { templateUrl: 'body/users/user_new.errors.html' },
      }
    })
    .state('user_show', {
      url: '/user/:userId',
      data: {
        roles: ['User']
      },
      views: {
        "header":     { controller: 'GlobalHeaderCtrl', templateUrl: 'header/header.html' }
        "navigation": { controller: 'GlobalNavigationCtrl', templateUrl: 'navigation/navigation.html' }
        "body":       { controller: 'UserShowCtrl',     templateUrl: 'body/users/user_show.html' }
      }
    })
    .state('user_edit', {
      url: '/user/:userId/edit',
      data: {
        roles: ['User']
      },
      views: {
        "header":     { controller: 'GlobalHeaderCtrl', templateUrl: 'header/header.html' }
        "navigation": { controller: 'GlobalNavigationCtrl', templateUrl: 'navigation/navigation.html' }
        "body":       { controller: 'UserEditCtrl',     templateUrl: 'body/users/user_edit.html' }
        "errors@user_edit": { templateUrl: 'body/users/user_edit.errors.html' },
      }
    })

    # About
    .state('about', {
      url: '/about',
      data: {
        roles: []
      },
      views: {
        "header": { controller: 'GlobalHeaderCtrl',   templateUrl: 'header/header.html' }
        "body":   { templateUrl: 'body/about.html' }
      }
    })


    # Categories

    .state('categories_index', {
      url: '/categories',
      data: {
        roles: ['User']
      },
      views: {
        "header":     { controller: 'GlobalHeaderCtrl', templateUrl: 'header/header.html' }
        "navigation": { controller: 'GlobalNavigationCtrl', templateUrl: 'navigation/navigation.html' }
        "body":       { controller: 'CategoriesIndexCtrl',  templateUrl: 'body/categories/categories_index.html' }
        "order":      { controller: 'OrderSummaryCtrl',  templateUrl: 'body/orders/orders_index.html' }
      }
    })

    .state('category_show', {
      url: '/categories/:categoryId',
      data: {
        roles: ['User']
      },
      views: {
        "header":     { controller: 'GlobalHeaderCtrl', templateUrl: 'header/header.html' }
        "navigation": { controller: 'GlobalNavigationCtrl', templateUrl: 'navigation/navigation.html' }
        "body":       { controller: 'CategoryShowCtrl',  templateUrl: 'body/categories/category_show.html' }
        "order":      { controller: 'OrderSummaryCtrl',  templateUrl: 'body/orders/orders_index.html' }
      }
    })


    # Food
    .state('food_index', {
      url: '/food',
      data: {
        roles: ['User']
      },
      views: {
        "header":     { controller: 'GlobalHeaderCtrl', templateUrl: 'header/header.html' }
        "navigation": { controller: 'GlobalNavigationCtrl', templateUrl: 'navigation/navigation.html' }
        "body":       { controller: 'FoodIndexCtrl',  templateUrl: 'body/categories/food/food_index.html' }
        "order":      { controller: 'OrderSummaryCtrl',  templateUrl: 'body/orders/orders_index.html' }
      }
    })

    .state('food_show', {
      url: '/food/:foodId',
      data: {
        roles: ['User']
      },
      views: {
        "header":     { controller: 'GlobalHeaderCtrl', templateUrl: 'header/header.html' }
        "navigation": { controller: 'GlobalNavigationCtrl', templateUrl: 'navigation/navigation.html' }
        "body":       { controller: 'FoodShowCtrl',  templateUrl: 'body/categories/food/food_show.html' }
        "order":      { controller: 'OrderSummaryCtrl',  templateUrl: 'body/orders/orders_index.html' }
      }
    })

    # Orders

    .state('order_summary', {
      url: '/orders',
      data: {
        roles: ['User']
      },
      views: {
        "header":     { controller: 'GlobalHeaderCtrl', templateUrl: 'header/header.html' }
        "navigation": { controller: 'GlobalNavigationCtrl', templateUrl: 'navigation/navigation.html' }
        "body":       { controller: 'OrderSummaryCtrl',  templateUrl: 'body/orders/order_summary.html' }
      }
    })
