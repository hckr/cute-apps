import QtQuick 2.12
import QtQuick.Window 2.12

Window {
  id: window
  visible: true
  width: 1024
  height: 768
  title: qsTr("Pong!")

  Game {
    id: game
    orientation: "horizontal"

    Paddle {
      id: player1

      pos: 0.5
      side: Paddle.Side.Left

      color: 'magenta'
      radius: 10

      ManualControls {
        decKey: Qt.Key_Up
        incKey: Qt.Key_Down
      }
      //      ComputerControls {}
    }

    Paddle {
      id: player2

      pos: 0.5
      side: Paddle.Side.Right

      color: 'cyan'
      radius: 10

      //      ManualControls {
      //        decKey: Qt.Key_A
      //        incKey: Qt.Key_D
      //      }
      ComputerControls {}
    }

    Ball {
      id: ball

      posX: 0.5
      posY: 0.5

      color: 'navy'
    }
  }
}
