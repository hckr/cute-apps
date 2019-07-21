import QtQuick 2.0

Rectangle {
  property double size: 0.02
  property double speed: 0.005

  property double posX
  property double posY
  property double speedX
  property double speedY

  Component.onCompleted: reset()

  function updatePos() {
    posX += speedX
    posY += speedY

    if (game.orientation === 'horizontal') {
      if (posY <= size / 2 || posY >= 1 - size / 2) {
        speedY = -speedY
      }

      if (posX < 0 || posX > 1) {
        game.score(posX)
        reset()
      }
    } else {
      if (posX <= size / 2 || posX >= 1 - size / 2) {
        speedX = -speedX
      }

      if (posY < 0 || posY > 1) {
        game.score(posY)
        reset()
      }
    }
  }

  function reset() {
    posX = 0.5
    posY = 0.5
    var angle = Math.random() * Math.PI * 0.5

    speedX = speed * Math.cos(angle) * (Math.random() < 0.5 ? -1 : 1)
    speedY = speed * Math.sin(angle) * (Math.random() < 0.5 ? -1 : 1)
  }

  width: size * parent.width
  height: width
  radius: width * 0.5

  x: (posX - size / 2) * parent.width
  y: (posY - size / 2) * parent.height
}
