/*
  checkBounceBallByRacketOrNotAndShowRacket()
  float r_y;  // r_yはラケットのy座標
*/
void showRacket() {
  racket.show();
}

/*
  checkBounceBallByRacket()
  float r_y // r_yはラケットのy座標
*/
void bounceBallByRacketOrNot() {
  racket.applyBallBounceOrNot();
}

void initRacket() {
  racket = new Racket(0, height - 50, 50.0, 3.0);
}