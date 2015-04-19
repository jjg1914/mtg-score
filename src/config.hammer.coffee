angular.module("mtg").config (hammerDefaultOptsProvider) ->
  hammerDefaultOptsProvider.set
    recognizers: [
      [ Hammer.Tap, { event: 'tap' } ]
      [ Hammer.Press, { event: 'press' } ]
    ]
