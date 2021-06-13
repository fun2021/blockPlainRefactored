Block[] blocks = new Block[10];
Ball ball;
Racket racket;

void setup() {
  size(400, 300);
  initBall();
  initBlocks();
  initRacket();
}

void draw() {  
  ball.applyDifferential();

  background(192, 192, 255);

  ball.show();

  for (int i = 0; i < blocks.length; i++) {
    blocks[i].applyBallBounceOrNot(ball);
    blocks[i].show();
  }

  racket.setX(mouseX, width);
  racket.applyBallBounceOrNot(ball);
  racket.show();

  // 落ちた時の判定
  if (ball.isBottomOver(height)) {
    initBall();
    initBlocks();
  }

  // 左右の壁のどちらかに突き抜けている場合
  if (ball.isLeftOver(0) || ball.isRightOver(width)) {
    ball.bounceX();
  }

  // 上の壁に突き抜けている場合
  if (ball.isTopOver(0)) {
    ball.bounceY();
  }
}
