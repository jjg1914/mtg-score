angular.module("mtg").controller "mtgController", ($scope) ->

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
