/*
  checkAndShowRacket()
  float r_y;  // r_hはラケットのy座標
*/
void checkAndShowRacket(float r_y) {
  float r_x = mouseX; // r_x はラケットの左側のx座標
  
  if (r_x + r_w > width) { // 右に寄りすぎていたら補正する
    r_x = width - r_w;
  } 
  
  /* ブロックがぶつかっていたら上に跳ね返る */
  if (blockHitCheck(r_x,r_y,r_w,r_h,x,y,b_w,b_h,dx,dy) > 0) {
    dy = -2;
  }
  
  rect(r_x, r_y, r_w, r_h); // racketを表示する
}
