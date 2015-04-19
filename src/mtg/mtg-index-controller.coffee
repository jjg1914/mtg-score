angular.module("mtg").controller "mtgIndexController", ($scope,$timeout) ->

  $scope.score = (player,amount) ->
    player.score += amount

    player.historyLatest += amount

    if player.historyTimeout?
      $timeout.cancel player.historyTimeout
    player.historyTimeout = $timeout ->
      player.history.push player.historyLatest if player.historyLatest
      player.historyLatest = null
      delete player.historyTimeout
    , 5000
