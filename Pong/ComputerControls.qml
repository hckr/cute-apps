import QtQuick 2.0

Controls {
  function move(paddle) {
    var goal = ((paddle.side === Paddle.Side.Top && ball.speedY
                 < 0) || (paddle.side === Paddle.Side.Bottom && ball.speedY
                          > 0) || (paddle.side === Paddle.Side.Left && ball.speedX
                                   < 0) || (paddle.side === Paddle.Side.Right && ball.speedX
                                            > 0)) ? (game.orientation === 'horizontal' ? ball.posY : ball.posX) : 0.5
    var dist = paddle.pos - goal
    if (Math.abs(dist) > paddle.moveStep) {
      if (dist < 0) {
        paddle.incPos()
      } else if (dist > 0) {
        paddle.decPos()
      }
    }
  }
}
