(function() {
  angular.module("mtg").controller("mtgMenuController", function($scope, $state) {
    return $scope.newGame = function() {
      $scope.players.length = 0;
      $scope.players.push({
        name: "Player 1",
        history: [],
        historyLatest: null
      });
      $scope.players.push({
        name: "Player 2",
        history: [],
        historyLatest: null
      });
      return $state.go("index");
    };
  });

}).call(this);

//# sourceMappingURL=../mtg/mtg-menu-controller.js.map