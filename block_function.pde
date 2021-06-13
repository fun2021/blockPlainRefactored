float block_width, block_height = 40.0;

/*
 10個のブロックを初期化する
*/
void initBlocks() {
  for (int i = 0; i < blocks.length; i++) {
    blocks[i] = 2;
  }
  block_width = width / blocks.length; // ブロックの幅を決める
}

/*
 10個のブロックのどれかにぶつかっていたら跳ね返る
*/
void checkBlocksAndBounceBall() {
  for (int i = 0; i < blocks.length; i++) {
    if (blocks[i] > 0) {
      int ret = ball.willOverlapByPositionDifferential(i * block_width, 40, block_width, block_height);
      if (ret > 0) {
        if (ret == 1) {
          ball.bounceX();
        } else if (ret == 2) {
          ball.bounceY();
          blocks[i]--;
        } else if (ret == 3) {
          ball.bounceX();
          ball.bounceY();
          blocks[i]--;
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
  for (int i = 0; i < blocks.length; i++) {
    if (blocks[i] > 0) {
      text(blocks[i], i * block_width, block_height); // 消すために必要なhitの個数の表示
      rect(i * block_width, 40, block_width, block_height); // ブロックの形の表示
    }
  }
}
