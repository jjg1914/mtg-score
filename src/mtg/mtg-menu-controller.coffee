angular.module("mtg").controller "mtgMenuController", ($scope,$state,mtgVibrate) ->

  $scope.newGame = ->
    mtgVibrate 20
    $scope.players.length = 0
    $scope.players.push
      name: "Player 1"
      history: []
      historyLatest: null
    $scope.players.push
      name: "Player 2"
      history: []
      historyLatest: null
    $state.go "index"
