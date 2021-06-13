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

  checkBlocksAndBounceBall();
  showBlocks();

  racket.setX(mouseX, width);
  bounceBallByRacketOrNot();
  showRacket();

  // 落ちた時の判定
  if (ball.isBottomOver(height)) {
    initBall();
    initBlocks();
  }
  if (ball.isLeftOver(0) || ball.isRightOver(width)) { // 左右の壁のどちらかに突き抜けている場合
    ball.bounceX();
  }
  if (ball.isTopOver(0)) { // 上の壁に突き抜けている場合
    ball.bounceY();
  }
}
