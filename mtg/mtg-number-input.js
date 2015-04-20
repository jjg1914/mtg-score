(function() {
  angular.module("mtg").directive("mtgNumberInput", function() {
    return {
      restrict: "E",
      replace: true,
      scope: {
        value: "="
      },
      templateUrl: "mtg/mtg-number-input.tpl.html",
      link: function($scope) {
        $scope.decrement = function() {
          if ($scope.value > 10) {
            return $scope.value -= 10;
          }
        };
        return $scope.increment = function() {
          if ($scope.value < 50) {
            return $scope.value += 10;
          }
        };
      }
    };
  });

}).call(this);

//# sourceMappingURL=../mtg/mtg-number-input.js.map