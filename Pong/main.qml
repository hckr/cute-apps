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
  property double moveStep: 0.005

  property double ballX: 0.5
  property double ballY: 0.5

  property double ballV: 0.01
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
      if (playerPos < playerPaddle.sizeX / 2) {
        playerPos = playerPaddle.sizeX / 2
      } else if (playerPos > 1 - playerPaddle.sizeX / 2) {
        playerPos = 1 - playerPaddle.sizeX / 2
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

      var goal = ballVy < 0 ? ballX : 0.5
      var distX = computerPos - goal
      if (Math.abs(distX) > moveStep) {
        if (distX < 0) {
          computerPos += moveStep
        } else if (distX > 0) {
          computerPos -= moveStep
        }

        if (computerPos < computerPaddle.sizeX / 2) {
          computerPos = computerPaddle.sizeX / 2
        } else if (computerPos > 1 - computerPaddle.sizeX / 2) {
          computerPos = 1 - computerPaddle.sizeX / 2
        }
      }

      !function () {
        var dist = (ballX - playerPos) / (playerPaddle.sizeX + ballSize / 2)
        if (ballY > 1 - playerPaddle.sizeY && Math.abs(dist) <= 0.5) {
          var angle = Math.PI * Math.abs(dist) * 0.9
          ballVy = -ballV * Math.cos(angle)
          ballVx = ballV * Math.sin(angle) * (dist < 0 ? -1 : 1)
        }
      }()

       !function () {
         var dist = (ballX - computerPos) / (computerPaddle.sizeX + ballSize / 2)
         if (ballY < computerPaddle.sizeY - ballSize / 2 && Math.abs(
               dist) <= 0.5) {
           var angle = Math.PI * Math.abs(dist) * 0.9
           ballVy = ballV * Math.cos(angle)
           ballVx = ballV * Math.sin(angle) * (dist < 0 ? -1 : 1)
         }
       }()
    }
  }

  Paddle {
    id: computerPaddle
    color: 'magenta'
    posX: computerPos
    anchors.top: parent.top
  }

  Paddle {
    id: playerPaddle
    color: 'cyan'
    posX: playerPos
    anchors.bottom: parent.bottom
  }

  Ball {
    id: ball
    color: 'navy'
    posX: ballX
    posY: ballY
    size: ballSize
  }
}
