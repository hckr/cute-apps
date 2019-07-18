import QtQuick 2.0

Rectangle {
  property double posX
  property double posY
  property double size

  width: size * parent.width
  height: width
  radius: width * 0.5

  x: (posX - size / 2) * parent.width
  y: (posY - size / 2) * parent.height
}
