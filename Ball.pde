class Ball {
    float x, y, width, height, dx, dy;

    Ball(float x, float y, float width, float height, float dx, float dy) {
        this.x      = x;
        this.y      = y;
        this.width  = width;
        this.height = height;
        this.dx     = dx;
        this.dy     = dy;
    }

    void applyDifferential() {
        this.x += this.dx;
        this.y += this.dy;
    }

    void show() {
        rect(this.x, this.y, this.width, this.height); // ball
    }

    int willOverlapByPositionDifferential(float block_x, float block_y, float w, float h) {
        int xflag = 0, yflag = 0;
        
        if (!isOverlap(block_x, block_y, w, h, this.x + this.dx, this.y + this.dy, this.width, this.height)) {
            return 0; // ぶつからなかったら 0を返す
        }
        
        if (isOverlap(block_x, block_y, w, h, this.x + this.dx, this.y, this.width, this.height)) xflag = 1;
        if (isOverlap(block_x, block_y, w, h, this.x, this.y + this.dy, this.width, this.height)) yflag = 2;
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