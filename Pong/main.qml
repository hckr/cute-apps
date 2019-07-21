import QtQuick 2.12
import QtQuick.Window 2.12

Window {
  visible: true
  width: 1024
  height: 768
  title: 'Pong!'

  Game {
    id: game
    orientation: 'vertical'

    Paddle {
      id: player1
      side: game.orientation === "horizontal" ? Paddle.Side.Left : Paddle.Side.Bottom
      color: 'magenta'

      ManualControls {
        decKey: game.orientation === "horizontal" ? Qt.Key_W : Qt.Key_Left
        incKey: game.orientation === "horizontal" ? Qt.Key_S : Qt.Key_Right
      }
      //      ComputerControls {}
    }

    Paddle {
      id: player2
      side: game.orientation === "horizontal" ? Paddle.Side.Right : Paddle.Side.Top
      color: 'cyan'

      //      ManualControls {
      //        decKey: game.orientation === "horizontal" ? Qt.Key_Up : Qt.Key_A
      //        incKey: game.orientation === "horizontal" ? Qt.Key_Down : Qt.Key_D
      //      }
      ComputerControls {}
    }

    Ball {
      id: ball
      speed: 0.008
      color: 'navy'
    }
  }

  Row {
    anchors.centerIn: parent
    spacing: 20
    property int size: 50

    Text {
      font.pixelSize: parent.size
      color: player1.color
      text: game.score1
    }

    Text {
      font.pixelSize: parent.size
      color: ball.color
      text: '–'
    }

    Text {
      font.pixelSize: parent.size
      color: player2.color
      text: game.score2
    }
  }
}
