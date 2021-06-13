class Racket {
    private float x, y, width, height;
    Racket(float x, float y, float width, float height) {
        this.x      = x;
        this.y      = y;
        this.width  = width;
        this.height = height;
    }

    void show() {
        rect(this.x, this.y, this.width, this.height); // racketを表示する
    }

    void setX(float x, float right_max_width) {
        this.x = x;
        if (this.x + this.width > right_max_width) { // 右に寄りすぎていたら補正する
            this.x = right_max_width - this.width;
        }
    }

    void applyBallBounceOrNot(Ball ball) {
        if (ball.willOverlapByPositionDifferential(this.x, this.y, this.width, this.height) > 0) {
            ball.setYSpeed(-2);
        }
    }
}