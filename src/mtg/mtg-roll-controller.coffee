angular.module("mtg").controller "mtgRollController", ($scope,$interval) ->
  $scope.toggleRoll = ->
    unless $scope.interval?
      $scope.interval = $interval ->
        value = $scope.value
        while value == $scope.value
          value = Math.floor(Math.random() * $scope.settings.roll)
          value += 1 if $scope.settings.rollOffset
        $scope.value = value
      , 100
    else
      $scope.value = Math.floor(Math.random() * $scope.settings.roll)
      $scope.value += 1 if $scope.settings.rollOffset
      $interval.cancel $scope.interval
      delete $scope.interval

  $scope.toggleRoll()

  $scope.$on "$destroy", ->
    $interval.cancel $scope.interval if $scope.interval?
