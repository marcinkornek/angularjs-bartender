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
        roles: ['User', 'Admin']
      }
      views: {
        "header":     { controller: 'GlobalHeaderCtrl', templateUrl: 'header/header.html' }
        "navigation": { controller: 'GlobalNavigationCtrl', templateUrl: 'navigation/navigation.html' }
        "body":       { controller: 'ProductsIndexCtrl',  templateUrl: 'body/products/products_index.html' }
        "order":      { controller: 'OrderSummaryCtrl',  templateUrl: 'body/orders/orders_index.html' }
      },
      resolve: {
        products: (productData, $stateParams) ->
          data = productData.query({})
          data.$promise
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
      url: '/users/new',
      data: {
        roles: []
      },
      views: {
        "header":     { controller: 'GlobalHeaderCtrl', templateUrl: 'header/header.html' },
        "body":       { controller: 'UserNewCtrl',   templateUrl: 'body/users/user_new.html' },
        "errors@sign_up": { templateUrl: 'body/users/user_new.errors.html' },
      }
    })
    .state('users_index', {
      url: '/users',
      data: {
        roles: ['Admin']
      },
      views: {
        "header":     { controller: 'GlobalHeaderCtrl', templateUrl: 'header/header.html' }
        "navigation": { controller: 'GlobalNavigationCtrl', templateUrl: 'navigation/navigation.html' }
        "body":       { controller: 'UsersIndexCtrl',     templateUrl: 'body/users/users_index.html' }
      }
    })
    .state('user_show', {
      url: '/users/:userId',
      data: {
        roles: ['User', 'Admin']
      },
      views: {
        "header":     { controller: 'GlobalHeaderCtrl', templateUrl: 'header/header.html' }
        "navigation": { controller: 'GlobalNavigationCtrl', templateUrl: 'navigation/navigation.html' }
        "body":       { controller: 'UserShowCtrl',     templateUrl: 'body/users/user_show.html' }
      }
    })
    .state('user_edit', {
      url: '/users/:userId/edit',
      data: {
        roles: ['User', 'Admin']
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
        "navigation": { controller: 'GlobalNavigationCtrl', templateUrl: 'navigation/navigation.html' }
        "body":   { templateUrl: 'body/about.html' }
      }
    })

    # Orders
    .state('order_summary', {
      url: '/order_summary',
      data: {
        roles: ['User', 'Admin']
      },
      views: {
        "header":     { controller: 'GlobalHeaderCtrl', templateUrl: 'header/header.html' }
        "navigation": { controller: 'GlobalNavigationCtrl', templateUrl: 'navigation/navigation.html' }
        "body":       { controller: 'OrderSummaryCtrl',  templateUrl: 'body/orders/order_summary.html' }
      }
    })

    .state('orders_history', {
      url: '/orders/page-:pageNo',
      data: {
        roles: ['User', 'Admin']
      },
      views: {
        "header":     { controller: 'GlobalHeaderCtrl', templateUrl: 'header/header.html' }
        "navigation": { controller: 'GlobalNavigationCtrl', templateUrl: 'navigation/navigation.html' }
        "body":       { controller: 'OrderHistoryCtrl',  templateUrl: 'body/orders/orders_history.html' }
      }
    })

    .state('orders_history_show', {
      url: '/orders/:orderId',
      data: {
        roles: ['User', 'Admin']
      },
      views: {
        "header":     { controller: 'GlobalHeaderCtrl', templateUrl: 'header/header.html' }
        "navigation": { controller: 'GlobalNavigationCtrl', templateUrl: 'navigation/navigation.html' }
        "body":       { controller: 'OrderHistoryShowCtrl',  templateUrl: 'body/orders/orders_history_show.html' }
      }
    })


    # Products
    .state('product_new', {
      url: '/products/new',
      data: {
        roles: ['Admin']
      },
      views: {
        "header":     { controller: 'GlobalHeaderCtrl', templateUrl: 'header/header.html' }
        "navigation": { controller: 'GlobalNavigationCtrl', templateUrl: 'navigation/navigation.html' }
        "body":       { controller: 'ProductNewCtrl',  templateUrl: 'body/products/product_new.html' }
        "errors@product_new": { templateUrl: 'body/products/product_new.errors.html' }
      }
    })

    .state('recent_products_index', {
      url: '/products/recent',
      data: {
        roles: ['User', 'Admin']
      },
      views: {
        "header":     { controller: 'GlobalHeaderCtrl', templateUrl: 'header/header.html' }
        "navigation": { controller: 'GlobalNavigationCtrl', templateUrl: 'navigation/navigation.html' }
        "body":       { controller: 'ProductsIndexCtrl',  templateUrl: 'body/products/recent_products_index.html' }
        "order":      { controller: 'OrderSummaryCtrl',  templateUrl: 'body/orders/orders_index.html' }
      },
      resolve: {
        products: (productData, $stateParams) ->
          data = productData.query({})
          data.$promise
      }
    })
      .state('recent_products_index.product_details', {
        url: '/:productId=:productName',
        data: {
          roles: ['User', 'Admin']
        },
        templateUrl: 'body/products/products_index.product_details.html'
        controller: 'ProductsIndexDetailsCtrl'
      })

    .state('products_index', {
      url: '/products/:category',
      data: {
        roles: ['User', 'Admin']
      },
      views: {
        "header":     { controller: 'GlobalHeaderCtrl', templateUrl: 'header/header.html' }
        "navigation": { controller: 'GlobalNavigationCtrl', templateUrl: 'navigation/navigation.html' }
        "body":       { controller: 'ProductsIndexCtrl',  templateUrl: 'body/products/products_index.html' }
        "order":      { controller: 'OrderSummaryCtrl',  templateUrl: 'body/orders/orders_index.html' }
      },
      resolve: {
        products: (productData, $stateParams) ->
          category = $stateParams.category || null
          console.log category
          data = productData.query({category: category})
          data.$promise
      }
    })
      .state('products_index.product_details', {
        url: '/:productId=:productName',
        data: {
          roles: ['User', 'Admin']
        },
        templateUrl: 'body/products/products_index.product_details.html'
        controller: 'ProductsIndexDetailsCtrl'
      })

    # .state('product_show', {
    #   url: '/products/:category/:productId=:productName',
    #   data: {
    #     roles: ['User', 'Admin']
    #   },
    #   views: {
    #     "header":     { controller: 'GlobalHeaderCtrl', templateUrl: 'header/header.html' }
    #     "navigation": { controller: 'GlobalNavigationCtrl', templateUrl: 'navigation/navigation.html' }
    #     "body":       { controller: 'ProductShowCtrl',  templateUrl: 'body/products/product_show.html' }
    #     "order":      { controller: 'OrderSummaryCtrl',  templateUrl: 'body/orders/orders_index.html' }
    #   }
    # })

    .state('product_edit', {
      url: '/products/:category/:productId=:productName/edit',
      data: {
        roles: ['Admin']
      },
      views: {
        "header":     { controller: 'GlobalHeaderCtrl', templateUrl: 'header/header.html' }
        "navigation": { controller: 'GlobalNavigationCtrl', templateUrl: 'navigation/navigation.html' }
        "body":       { controller: 'ProductEditCtrl',  templateUrl: 'body/products/product_edit.html' }
        "errors@product_edit": { templateUrl: 'body/products/product_edit.errors.html' }
      }
    })

    .state('products_search', {
      url: '/products/search/:searchQuery',
      data: {
        roles: ['User', 'Admin']
      },
      views: {
        "header":     { controller: 'GlobalHeaderCtrl', templateUrl: 'header/header.html' }
        "navigation": { controller: 'GlobalNavigationCtrl', templateUrl: 'navigation/navigation.html' }
        "body":       { controller: 'ProductsSearchCtrl',  templateUrl: 'body/products/products_search_results.html' }
      }
    })
      .state('products_search.product_details', {
        url: '/:productId=:productName',
        data: {
          roles: ['User', 'Admin']
        },
        templateUrl: 'body/products/products_index.product_details.html'
        controller: 'ProductsIndexDetailsCtrl'
      })
