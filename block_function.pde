float bw, bh = 40.0;

/*
 10個のブロックを初期化する
*/
void initBlocks() {
  for (int i = 0; i < block.length ; i++) {
    block[i] = 2;
  }
  bw = width / block.length; // ブロックの幅を決める
}

/*
 10個のブロックのどれかにぶつかっていたら跳ね返る
*/
void checkBlocks() {
  for (int i = 0; i < block.length ; i++) {
    if (block[i] > 0) {
      int ret = blockHitCheck(i*bw,40,bw,bh,x,y,b_w,b_h,dx,dy);
      if (ret > 0) {
        if (ret == 1) {
          dx = -dx;
        } else if (ret == 2) {
          dy = -dy;
          block[i]--;
        } else if (ret == 3) {
          dx = -dx;
          dy = -dy;
          block[i]--;
        }
        return;
      }
    }
  }  
}

/*
 10個のブロックを表示する
*/
void showBlocks() {
  for (int i = 0; i < block.length ; i++) {
    if (block[i] > 0) {
      text(block[i], i * bw, bh); // 消すために必要なhitの個数
      rect(i * bw, 40, bw, bh); // ブロックの形の表示
    }
  }
}
