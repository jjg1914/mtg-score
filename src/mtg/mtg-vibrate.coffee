angular.module("mtg").factory "mtgVibrate", ->
  navigator.vibrate ?= navigator.webkitVibrate || navigator.mozVibrate ||
    navigator.msVibrate

  (millieseconds) ->
    if navigator.vibrate
      navigator.vibrate millieseconds
