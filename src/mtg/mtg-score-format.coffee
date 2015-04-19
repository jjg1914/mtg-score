angular.module("mtg").filter "mtgScoreFormat", ->
  (value,initial) ->
    initial += e for e in value.history
    initial += value.historyLatest if value.historyLatest?
    initial
