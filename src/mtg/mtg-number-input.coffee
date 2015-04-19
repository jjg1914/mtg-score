angular.module("mtg").directive "mtgNumberInput",  ->
  restrict: "E"
  replace: true
  scope:
    value: "="
  templateUrl: "mtg/mtg-number-input.tpl.html"
  link: ($scope) ->
    $scope.decrement = ->
      $scope.value -= 10 if $scope.value > 10

    $scope.increment = ->
      $scope.value += 10 if $scope.value < 50
