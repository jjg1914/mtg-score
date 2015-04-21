angular.module("mtg").controller "mtgIndexController", ($scope,$timeout,
  mtgVibrate) ->

  _saveHistory = (player) ->
    if player.historyTimeout?
      $timeout.cancel player.historyTimeout
    player.historyTimeout = $timeout ->
      player.history.push player.historyLatest if player.historyLatest
      player.historyLatest = null
      delete player.historyTimeout
    , 5000

  $scope.decrementScore = (player) ->
    if player.historyLatest?
      player.historyLatest += if player.historyLatest > 0 then 1 else -1
    else
      player.historyLatest = -1
    mtgVibrate 20
    _saveHistory player

  $scope.clearScore = (player) ->
    player.historyLatest = null
    if player.historyTimeout?
      mtgVibrate 20
      $timeout.cancel player.historyTimeout
      delete player.historyTimeout

  $scope.invertScore = (player) ->
    if player.historyLatest?
      player.historyLatest *= -1
      mtgVibrate 20
    _saveHistory player
