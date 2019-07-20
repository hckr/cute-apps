import QtQuick 2.0

Item {
  focus: true

  property bool _up: false
  property bool _right: false
  property bool _bottom: false
  property bool _left: false

  Keys.onPressed: {
    switch (event.key) {
    case Qt.Key_Up:
    case Qt.Key_W:
      _up = true
      break
    case Qt.Key_Right:
    case Qt.Key_D:
      _right = true
      break
    case Qt.Key_Bottom:
    case Qt.Key_S:
      _bottom = true
      break
    case Qt.Key_Left:
    case Qt.Key_A:
      _left = true
      break
    }
  }

  Keys.onReleased: {
    switch (event.key) {
    case Qt.Key_Up:
    case Qt.Key_W:
      _up = false
      break
    case Qt.Key_Right:
    case Qt.Key_D:
      _right = false
      break
    case Qt.Key_Bottom:
    case Qt.Key_S:
      _bottom = false
      break
    case Qt.Key_Left:
    case Qt.Key_A:
      _left = false
      break
    }
  }
}
