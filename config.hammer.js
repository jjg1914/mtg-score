(function() {
  angular.module("mtg").config(function(hammerDefaultOptsProvider) {
    return hammerDefaultOptsProvider.set({
      recognizers: [
        [
          Hammer.Tap, {
            event: "tap"
          }
        ], [
          Hammer.Press, {
            event: "press"
          }
        ], [
          Hammer.Swipe, {
            event: "swipe",
            direction: Hammer.DIRECTION_HORIZONTAL
          }
        ]
      ]
    });
  });

}).call(this);

//# sourceMappingURL=config.hammer.js.map