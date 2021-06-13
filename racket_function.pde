/*
  checkBounceBallByRacketOrNotAndShowRacket()
  float r_y;  // r_yはラケットのy座標
*/
void showRacket(float r_y) {
  float r_x = mouseX; // r_x はラケットの左側のx座標
  rect(r_x, r_y, racket_width, racket_height); // racketを表示する
}

/*
  checkBounceBallByRacket()
  float r_y // r_yはラケットのy座標
*/
void bounceBallByRacketOrNot(float r_y) {
  float r_x = mouseX; // r_x はラケットの左側のx座標
  
  if (r_x + racket_width > width) { // 右に寄りすぎていたら補正する
    r_x = width - racket_width;
  } 
  
  /* ブロックがぶつかっていたら上に跳ね返る */
  if (ball.willOverlapByPositionDifferential(r_x, r_y, racket_width, racket_height) > 0) {
    ball.dy = -2;
  }
}