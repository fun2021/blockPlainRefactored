class Ball extends AABB {
  private float dx, dy;

  Ball(float x, float y, float width, float height, float dx, float dy) {
    super(x, y, width, height);
    this.dx = dx;
    this.dy = dy;
  }

  void applyDifferential() {
    this.x += this.dx;
    this.y += this.dy;
  }

  void show() {
    rect(this.x, this.y, this.width, this.height); // ball
  }

  int willOverlapByPositionDifferential(AABB other) {
    int xflag = 0, yflag = 0;

    if (!this.willOverlapWith(other, this.dx, this.dy)) {
      return 0; // ぶつからなかったら 0を返す
    }

    if (this.willOverlapWith(other, dx, 0)) xflag = 1;
    if (this.willOverlapWith(other, 0, dy)) yflag = 2;
    if (xflag + yflag > 0) return xflag + yflag;
    return 3;
  }

  void bounceX() {
    this.dx = -dx;
  }

  void bounceY() {
    this.dy = -dy;
  }

  void setXSpeed(float dx) {
    this.dx = dx;
  }

  void setYSpeed(float dy) {
    this.dy = dy;
  }

  boolean isTopOver(float y) {
    return this.y < y;
  }

  boolean isBottomOver(float y) {
    return this.y + this.height >= y;
  }

  boolean isLeftOver(float x) {
    return this.x < 0;
  }

  boolean isRightOver(float x) {
    return this.x + this.width >= x;
  }
}
