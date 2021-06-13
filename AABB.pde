/*
 Axis-aligned bounding box の当たり判定を実装するクラス
 */

abstract class AABB {
    protected float x, y, width, height;
    AABB(float x, float y, float width, float height) {
        this.x      = x;
        this.y      = y;
        this.width  = width;
        this.height = height;
    }

    boolean isOverlapWith(AABB other) {
        return willOverlapWith(other, 0, 0);
    }

    boolean willOverlapWith(AABB other, float self_dx, float self_dy) {
        return this.x + self_dx < other.x + other.width &&
               other.x          < this.x  + self_dx + this.width &&
               this.y + self_dy < other.y + other.height &&
               other.y          < this.y  + self_dy + this.height;
    }
}