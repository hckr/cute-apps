import QtQuick 2.0
import "Utils.js" as Utils

Item {
  property string orientation
  property int score1: 0
  property int score2: 0

  focus: true

  width: parent.width
  height: parent.height

  function score(pos) {
    if (orientation === 'horizontal') {

      if (pos < 0) {
        score2 += 1
      } else {
        score1 += 1
      }
    } else {
      if (pos < 0) {
        score1 += 1
      } else {
        score2 += 1
      }
    }
  }

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
