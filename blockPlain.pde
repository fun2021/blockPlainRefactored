int block[] = new int[10];
float x, y, b_w, b_h, dx, dy;
float r_w = 50.0, r_h = 3.0;

void setup() {
  size(400,300);
  initBall();
  initBlocks();
}

void draw() {  
  x += dx; // dx は1フレームごとにx方向に動く距離(速度)
  y += dy; // dy は1フレームごとにy方向に動く距離(速度)
  
  background(192, 192, 255);
  rect(x, y, b_w, b_h); // ball

  checkBlocks();
  showBlocks();
  
  checkAndShowRacket(height-50);

  // 壁との衝突
  if (y + b_h >= height) {
    initBall();
    initBlocks();
  }
  if (x < 0 || x+b_w >=width) {dx = -dx;}
  if (y < 0) {dy = -dy;}
}
