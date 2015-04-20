(function() {
  angular.module("mtg").controller("mtgIndexController", function($scope, $timeout) {
    var _saveHistory;
    _saveHistory = function(player) {
      if (player.historyTimeout != null) {
        $timeout.cancel(player.historyTimeout);
      }
      return player.historyTimeout = $timeout(function() {
        if (player.historyLatest) {
          player.history.push(player.historyLatest);
        }
        player.historyLatest = null;
        return delete player.historyTimeout;
      }, 5000);
    };
    $scope.decrementScore = function(player) {
      if (player.historyLatest != null) {
        player.historyLatest += player.historyLatest > 0 ? 1 : -1;
      } else {
        player.historyLatest = -1;
      }
      return _saveHistory(player);
    };
    $scope.clearScore = function(player) {
      player.historyLatest = null;
      if (player.historyTimeout != null) {
        $timeout.cancel(player.historyTimeout);
        return delete player.historyTimeout;
      }
    };
    return $scope.invertScore = function(player) {
      if (player.historyLatest != null) {
        player.historyLatest *= -1;
      }
      return _saveHistory(player);
    };
  });

}).call(this);

//# sourceMappingURL=../mtg/mtg-index-controller.js.map