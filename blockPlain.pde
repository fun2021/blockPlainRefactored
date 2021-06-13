int blocks[] = new int[10];
Ball ball;
float racket_width = 50.0, racket_height = 3.0;

void setup() {
  size(400, 300);
  initBall();
  initBlocks();
}

void draw() {  
  ball.applyDifferential();

  background(192, 192, 255);

  ball.showBall();

  checkBlocksAndBounceBall();
  showBlocks();

  bounceBallByRacketOrNot(height - 50);
  showRacket(height - 50);

  // 落ちた時の判定
  if (ball.y + ball.height >= height) {
    initBall();
    initBlocks();
  }
  if (ball.x < 0 || ball.x + ball.width >= width) { // 左右の壁のどちらかに突き抜けている場合
    ball.bounceX();
  }
  if (ball.y < 0) { // 上の壁に突き抜けている場合
    ball.bounceY();
  }
}
