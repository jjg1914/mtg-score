angular.module("mtg").directive "mtgNumberInput", (mtgVibrate)->
  restrict: "E"
  replace: true
  scope:
    value: "="
  templateUrl: "mtg/mtg-number-input.tpl.html"
  link: ($scope) ->
    $scope.decrement = ->
      if $scope.value > 10
        $scope.value -= 10
        mtgVibrate 20

    $scope.increment = ->
      if $scope.value < 50
        $scope.value += 10
        mtgVibrate 20
