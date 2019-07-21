import QtQuick 2.0

Controls {
  property var incKey
  property var decKey

  property bool inc: false
  property bool dec: false

  function move(paddle) {
    if (inc) {
      paddle.incPos()
    } else if (dec) {
      paddle.decPos()
    }
  }

  Keys.onPressed: {
    switch (event.key) {
    case incKey:
      inc = true
      break
    case decKey:
      dec = true
      break
    }
  }

  Keys.onReleased: {
    switch (event.key) {
    case incKey:
      inc = false
      break
    case decKey:
      dec = false
      break
    }
  }
}
