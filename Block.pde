class Block {
    private float x, y, width, height;
    private int hp;

    Block(float x, float y, float width, float height, int hp) {
        this.x      = x;
        this.y      = y;
        this.width  = width;
        this.height = height;
        this.hp     = hp;
    }

    void show() {
        if (this.hp <= 0) return;
        text(this.hp, this.x, this.y); // 消すために必要なhitの個数の表示
        rect(this.x, this.y, this.width, this.height); // ブロックの形の表示
    }

    void damage() {
        this.hp -= 1;
    }

    void applyBallBounceOrNot(Ball ball) {
        if (this.hp <= 0) return;
        int ret = ball.willOverlapByPositionDifferential(this.x, this.y, this.width, this.height);
        if (ret > 0) {
            if (ret == 1) {
                ball.bounceX();
            } else if (ret == 2) {
                ball.bounceY();
                this.damage();
            } else if (ret == 3) {
                ball.bounceX();
                ball.bounceY();
                this.damage();
            }
            return;
        }

    }
}