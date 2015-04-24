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

  if localStorage["mtg-settings"]
    $scope.settings = JSON.parse localStorage["mtg-settings"]
  else
    $scope.settings =
      initialScore: 20
      roll: 10
      rollOffset: false
      scoreDelay: 5

  window.addEventListener "beforeunload", ->
    localStorage["mtg-settings"] = JSON.stringify $scope.settings

  $scope.navigate = (e) ->
    direction = if e.direction == Hammer.DIRECTION_LEFT then 1 else -1
    index = _navigate.indexOf($state.current.name)
    if index == -1
      $state.go "index"
    else
      index += direction
      if index >= 0 and index < _navigate.length
        $state.go _navigate[index]
