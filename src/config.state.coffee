angular.module("mtg").config ($stateProvider,$urlRouterProvider) ->
  $stateProvider
    .state "index",
      url: "/"
      templateUrl: "mtg/mtg-index.tpl.html"
      controller: "mtgIndexController"

  $urlRouterProvider.otherwise "/"
