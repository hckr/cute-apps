import QtQuick 2.12
import QtQuick.Window 2.12

Window {
  id: window
  visible: true
  width: 1024
  height: 768
  title: qsTr("Pong!")

  Controls {
    id: keys
  }

  Paddle {
    id: computer

    pos: 0.5
    side: Paddle.Side.Top

    color: 'magenta'
    radius: 10
  }

  Paddle {
    id: player

    pos: 0.5
    side: Paddle.Side.Bottom

    color: 'cyan'
    radius: 10
  }

  Ball {
    id: ball

    posX: 0.5
    posY: 0.5

    color: 'navy'
  }

  Timer {
    interval: 10
    running: true
    repeat: true
    onTriggered: {

      if (keys._left) {
        player.dec()
      }
      if (keys._right) {
        player.inc()
      }

      var goal = ball.speedY < 0 ? ball.posX : 0.5
      var distX = computer.pos - goal
      if (Math.abs(distX) > computer.moveStep) {
        if (distX < 0) {
          computer.inc()
        } else if (distX > 0) {
          computer.dec()
        }
      }

      ball.updatePos()

      player.handleBall(ball)
      computer.handleBall(ball)
    }
  }
}
