angular.module("mtg").controller "mtgController", ($scope,$state) ->

  _navigate = [
    "menu"
    "index"
    "settings"
  ]

  $scope.players = [
    {
      name: "Player 1"
      history: []
      historyLatest: null
    }
    {
      name: "Player 2"
      history: []
      historyLatest: null
    }
  ]

  $scope.settings =
    initialScore: 20

  $scope.navigate = (e) ->
    direction = if e.direction == Hammer.DIRECTION_LEFT then 1 else -1
    index = _navigate.indexOf($state.current.name) + direction
    if index >= 0 and index < _navigate.length
      $state.go _navigate[index]
