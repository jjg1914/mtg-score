(function() {
  angular.module("mtg").filter("mtgScoreFormat", function() {
    return function(value, initial) {
      var e, i, len, ref;
      ref = value.history;
      for (i = 0, len = ref.length; i < len; i++) {
        e = ref[i];
        initial += e;
      }
      if (value.historyLatest != null) {
        initial += value.historyLatest;
      }
      return initial;
    };
  });

}).call(this);

//# sourceMappingURL=../mtg/mtg-score-format.js.map