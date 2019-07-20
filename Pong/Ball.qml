import QtQuick 2.0

Rectangle {
  property double posX
  property double posY

  property double size: 0.02
  property double speed: 0.01
  property double speedX: 0
  property double speedY: speed

  function updatePos() {
    posX += speedX
    posY += speedY

    if (posX < size || posX > 1 - size) {
      speedX = -speedX
    }

    if (posY < 0 || posY > 1) {
      posX = 0.5
      posY = 0.5
      speedX = 0
      speedY = speed
    }
  }

  width: size * parent.width
  height: width
  radius: width * 0.5

  x: (posX - size / 2) * parent.width
  y: (posY - size / 2) * parent.height
}
