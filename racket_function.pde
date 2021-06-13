/*
  checkAndShowRacket()
  float r_y;  // r_hはラケットのy座標
*/
void checkAndShowRacket(float r_y) {
  float r_x = mouseX; // r_x はラケットの左側のx座標
  
  if (r_x + racket_width > width) { // 右に寄りすぎていたら補正する
    r_x = width - racket_width;
  } 
  
  /* ブロックがぶつかっていたら上に跳ね返る */
  if (blockHitCheck(r_x,r_y,racket_width,racket_height,ball_x,ball_y,ball_width,ball_height,ball_dx,ball_dy) > 0) {
    ball_dy = -2;
  }
  
  rect(r_x, r_y, racket_width, racket_height); // racketを表示する
}
