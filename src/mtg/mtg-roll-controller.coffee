angular.module("mtg").controller "mtgRollController", ($scope,$interval) ->
  $scope.toggleRoll = ->
    unless $scope.interval?
      $scope.interval = $interval ->
        value while (value = Math.floor(Math.random() * 10)) == $scope.value
        $scope.value = value
      , 100
    else
      $scope.value = Math.floor(Math.random() * 10)
      $interval.cancel $scope.interval
      delete $scope.interval

  $scope.toggleRoll()

  $scope.$on "$destroy", ->
    $interval.cancel $scope.interval if $scope.interval?
