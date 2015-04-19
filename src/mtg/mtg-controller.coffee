angular.module("mtg").controller "mtgController", ($scope,$timeout) ->

  $scope.players = [
    {
      name: "Player 1"
      score: 20
      history: []
      historyLatest: null
    }
    {
      name: "Player 2"
      score: 20
      history: []
      historyLatest: null
    }
  ]

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
