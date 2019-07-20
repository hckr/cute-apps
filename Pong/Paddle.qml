import QtQuick 2.0

Rectangle {
  property int side
  property double pos

  enum Side {
    Top = 1,
    Right,
    Bottom,
    Left
  }

  property double length: 1 / 5
  property double depth: 1 / 30
  property double moveStep: 0.005

  function inc() {
    pos = Math.min(pos + moveStep, 1 - length / 2)
  }

  function dec() {
    pos = Math.max(pos - moveStep, length / 2)
  }

  enum Orientation {
    Horizontal = 1,
    Vertical
  }

  property int orientation: [Paddle.Side.Top, Paddle.Side.Bottom].includes(
    side) ? Paddle.Orientation.Horizontal : Paddle.Orientation.Vertical

  function handleBall(ball) {
    var dist = (ball.posX - pos) / (length + ball.size / 2)
    if (Math.abs(dist) > 0.5) {
      return
    }
    var angle = Math.PI * Math.abs(dist) * 0.9
    if (side === Paddle.Side.Top && ball.posY < depth + ball.size / 2) {
      ball.speedX = ball.speed * Math.sin(angle) * (dist < 0 ? -1 : 1)
      ball.speedY = ball.speed * Math.cos(angle)
    } else if (side === Paddle.Side.Bottom
               && ball.posY > 1 - depth - ball.size / 2) {
      ball.speedX = ball.speed * Math.sin(angle) * (dist < 0 ? -1 : 1)
      ball.speedY = -ball.speed * Math.cos(angle)
    }
  }

  width: orientation === Paddle.Orientation.Horizontal ? parent.width
                                                         * length : parent.width * depth
  height: orientation === Paddle.Orientation.Horizontal ? parent.height
                                                          * depth : parent.height * length

  x: orientation === Paddle.Orientation.Horizontal
     && (pos - length / 2) * parent.width
  y: orientation === Paddle.Orientation.Vertical
     && (pos - length / 2) * parent.height

  anchors.top: side === Paddle.Side.Top ? parent.top : undefined
  anchors.right: side === Paddle.Side.Right ? parent.right : undefined
  anchors.bottom: side === Paddle.Side.Bottom ? parent.bottom : undefined
  anchors.left: side === Paddle.Side.Left ? parent.left : undefined
}
