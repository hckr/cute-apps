import QtQuick 2.0
import "Utils.js" as Utils

Item {
  property string orientation

  focus: true

  width: parent.width
  height: parent.height

  Timer {
    interval: 10
    running: true
    repeat: true
    onTriggered: {

      player1.move()
      player2.move()

      ball.updatePos()

      player1.handleBall(ball)
      player2.handleBall(ball)
    }
  }

  Component.onCompleted: {
    var children = Utils.collectChildrenRecursive([], this, 3)

    Keys.forwardTo = children.filter(function (c) {
      return c instanceof ManualControls
    })
  }
}
