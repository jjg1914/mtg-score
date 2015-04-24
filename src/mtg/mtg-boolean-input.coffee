angular.module("mtg").directive "mtgBooleanInput", (mtgVibrate)->
  restrict: "E"
  replace: true
  scope:
    value: "="
  templateUrl: "mtg/mtg-boolean-input.tpl.html"
  link: ($scope) ->
    $scope.toggle = ->
      mtgVibrate 20
      $scope.value = !$scope.value
