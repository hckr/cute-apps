import QtQuick 2.12
import QtQuick.Window 2.12

Window {
  id: window
  visible: true
  width: 1024
  height: 768
  title: qsTr("Pong!")

  Item {
    id: keys
    focus: true

    property bool leftPressed: false
    property bool rightPressed: false

    Keys.onPressed: {
      switch (event.key) {
      case Qt.Key_Left:
        leftPressed = true
        break
      case Qt.Key_Right:
        rightPressed = true
        break
      case Qt.Key_R:
        ballVx = 0
        ballVy = ballV
      }
    }

    Keys.onReleased: {
      switch (event.key) {
      case Qt.Key_Left:
        leftPressed = false
        break
      case Qt.Key_Right:
        rightPressed = false
        break
      }
    }
  }

  property double ballSize: 1 / 50

  property double playerPos: 0.5
  property double computerPos: 0.5
  property double moveStep: 0.01

  property double ballX: 0.5
  property double ballY: 0.5

  property double ballV: 0.005
  property double ballVx: 0
  property double ballVy: ballV

  Timer {
    interval: 10
    running: true
    repeat: true
    onTriggered: {
      if (keys.leftPressed) {
        playerPos -= moveStep
      }
      if (keys.rightPressed) {
        playerPos += moveStep
      }
      if (playerPos < 0) {
        playerPos = 0
      } else if (playerPos > 1) {
        playerPos = 1
      }

      ballX += ballVx
      ballY += ballVy

      if (ballX < 0 || ballX > 1) {
        ballVx = -ballVx
      }

      if (ballY < 0 || ballY > 1) {
        ballX = 0.5
        ballY = 0.5
        ballVx = 0
        ballVy = 0
      }

      var foo = (ballX - playerPos) / playerPaddleLoader.item.percWidth
      console.log(foo)
      if (ballY > 1 - playerPaddleLoader.item.percHeight && Math.abs(
            foo) <= 0.5) {
        var angle = Math.PI * Math.abs(foo) * 0.9
        ballVy = -ballV * Math.cos(angle)
        ballVx = ballV * Math.sin(angle) * (foo < 0 ? 1 : -1)
      }
    }
  }

  Loader {
    id: computerPaddleLoader
    sourceComponent: paddle

    property string color: 'magenta'
    property double posX: computerPos
    property double posY: 0
  }

  Loader {
    id: playerPaddleLoader
    sourceComponent: paddle

    property string color: 'cyan'
    property double posX: playerPos
    property double posY: 1
  }

  Rectangle {
    width: window.width * ballSize
    height: width
    radius: width * 0.5

    color: 'navy'

    x: ballX * (window.width - width)
    y: ballY * (window.height - height)
  }

  Component {
    id: paddle

    Rectangle {
      property double percWidth: 1 / 4
      property double percHeight: 1 / 30

      width: window.width * percWidth
      height: window.height * percHeight
      radius: 10

      color: parent.color

      x: (posX) * (window.width - width)
      y: (posY) * (window.height - height)
    }
  }
}
