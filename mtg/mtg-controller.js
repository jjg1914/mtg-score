(function() {
  angular.module("mtg").controller("mtgController", function($scope, $state) {
    var _navigate;
    _navigate = ["menu", "index", "settings"];
    $scope.players = [
      {
        name: "Player 1",
        history: [],
        historyLatest: null
      }, {
        name: "Player 2",
        history: [],
        historyLatest: null
      }
    ];
    $scope.settings = {
      initialScore: 20
    };
    return $scope.navigate = function(e) {
      var direction, index;
      direction = e.direction === Hammer.DIRECTION_LEFT ? 1 : -1;
      index = _navigate.indexOf($state.current.name) + direction;
      if (index >= 0 && index < _navigate.length) {
        return $state.go(_navigate[index]);
      }
    };
  });

}).call(this);

//# sourceMappingURL=../mtg/mtg-controller.js.map