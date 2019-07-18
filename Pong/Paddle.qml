import QtQuick 2.0

Rectangle {
  property double sizeX: 1 / 5
  property double sizeY: 1 / 30
  property double posX

  width: parent.width * sizeX
  height: parent.height * sizeY
  radius: 10

  x: (posX - sizeX / 2) * parent.width
}
