angular.module("mtg").config (hammerDefaultOptsProvider) ->
  hammerDefaultOptsProvider.set
    recognizers: [
      [ Hammer.Tap, { event: "tap" } ]
      [ Hammer.Press, { event: "press" } ]
      [ Hammer.Swipe,
        event: "swipe",
        direction: Hammer.DIRECTION_HORIZONTAL
      ]
    ]
