float block_height = 40.0;

/*
 10個のブロックを初期化する
*/
void initBlocks() {
  float block_width = width / blocks.length; // ブロックの幅を決める
  for (int i = 0; i < blocks.length; i++) {
    blocks[i] = new Block(i * block_width, 40, block_width, block_height, 2);
  }
}

/*
 10個のブロックのどれかにぶつかっていたら跳ね返る
*/
void checkBlocksAndBounceBall() {
  for (int i = 0; i < blocks.length; i++) {
    blocks[i].applyBallBounceOrNot(ball);
  }  
}

/*
 10個のブロックを表示する
*/
void showBlocks() {
  for (int i = 0; i < blocks.length; i++) {
    blocks[i].show();
  }
}
