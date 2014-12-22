angular.module('Bartender', [
  'ui.router',
  'jmdobry.angular-cache',
  'pascalprecht.translate',
  'ngResource',
  'ui.bootstrap',
  'angularFileUpload',
  'ui.gravatar',
  'ngAnimate',
  'ngCookies',
])
  .factory 'railsLocalesLoader', ($http) ->
    (options) ->
      $http.get("locales/#{options.key}.json").then (response) ->
        response.data
      , (error) ->
        throw options.key

  .config ($provide, $httpProvider, $translateProvider, Rails) ->

    # Template cache
    if Rails.env != 'development'
      $provide.service '$templateCache', ['$angularCacheFactory', ($angularCacheFactory) ->
        $angularCacheFactory('templateCache', {
          maxAge: 3600000 * 24 * 7,
          storageMode: 'localStorage',
          recycleFreq: 60000
        })
      ]

    # Assets interceptor
    $provide.factory 'railsAssetsInterceptor', ($angularCacheFactory) ->
      request: (config) ->
        if assetUrl = Rails.templates[config.url]
          config.url = assetUrl
        config

    $httpProvider.interceptors.push('railsAssetsInterceptor')

    # Angular translate
    $translateProvider.useLoader('railsLocalesLoader')
    $translateProvider.preferredLanguage('pl')



angular.module('Bartender').config(["$httpProvider", (provider) ->
  provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
])

# ###
# http://stackoverflow.com/a/22540482/3922041
# ###

angular.module('Bartender').run([ "$rootScope", "$state", "$stateParams", "authorization", "principal", ($rootScope, $state, $stateParams, authorization, principal) ->
  $rootScope.$on "$stateChangeStart", (event, toState, toParams, fromState, fromParams) ->
    # console.log "toState.name: " + toState.name
    # console.log "fromState.name: " + fromState.name
    # console.log "----------------------"
    $rootScope.toState = toState
    $rootScope.toStateParams = toParams
    # console.log window.currentUser.id
    if window.currentUser.id
      # console.log 'true'
      principal.authenticate
        username: window.currentUser.username
        roles: [ window.currentUser.role ]
    else
      principal.authenticate(null)
      # console.log 'false'
    authorization.authorize()
  $rootScope.$on "$stateChangeSuccess", (event, toState, toParams, fromState, fromParams) ->
    console.log 'success'
])

angular.module("ui.gravatar").config [ "gravatarServiceProvider", (gravatarServiceProvider) ->
  gravatarServiceProvider.defaults =
    default: "mm" # Mystery man as default for missing avatars
  gravatarServiceProvider.secure = true
 ]
