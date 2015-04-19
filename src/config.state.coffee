angular.module("mtg").config ($stateProvider,$urlRouterProvider) ->
  $stateProvider
    .state "index",
      url: "/"
      templateUrl: "mtg/mtg-index.tpl.html"
      controller: "mtgIndexController"
    .state "menu",
      url: "/menu"
      templateUrl: "mtg/mtg-menu.tpl.html"
      controller: "mtgMenuController"
    .state "settings",
      url: "/settings"
      templateUrl: "mtg/mtg-settings.tpl.html"
      controller: "mtgSettingsController"

  $urlRouterProvider.otherwise "/"
