angular.module("mtg").directive "mtgNumberInput", (mtgVibrate)->
  restrict: "E"
  replace: true
  scope:
    value: "="
    min: "="
    max: "="
    step: "="
    format: "@"
  templateUrl: "mtg/mtg-number-input.tpl.html"
  link: ($scope) ->
    $scope.format ?= "%i"

    $scope.decrement = ->
      if $scope.value > $scope.min
        $scope.value -= ($scope.step || 1)
        mtgVibrate 20

    $scope.increment = ->
      if $scope.value < $scope.max
        $scope.value += ($scope.step || 1)
        mtgVibrate 20
