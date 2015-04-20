angular.module("mtg").config  ->
  document.body.addEventListener "mouseenter", ->
    for e in document.getElementsByTagName "body"
      classes = e.className.split /\s+/
      if classes.indexOf("mtg-hover") == -1
        classes.push "mtg-hover"
      e.className = classes.join " "

  document.body.addEventListener "mouseleave", ->
    for e in document.getElementsByTagName "body"
      classes = e.className.split /\s+/
      if (index = classes.indexOf("mtg-hover") > -1)
        classes.splice index, 1
      e.className = classes.join " "
