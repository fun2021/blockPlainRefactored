/*
 Axis-aligned bounding box の当たり判定を提供するクラス
 */

abstract class AABB {
  protected float x, y, width, height;
  AABB(float x, float y, float width, float height) {
    this.x      = x;
    this.y      = y;
    this.width  = width;
    this.height = height;
  }

  // 他のAABBとぶつかっているか？
  boolean isOverlapWith(AABB other) {
    return willOverlapWith(other, 0, 0);
  }

  // 自分をself_dx, self_dy動かしたとき、他のAABBとぶつかるか？
  boolean willOverlapWith(AABB other, float self_dx, float self_dy) {
    return this.x + self_dx < other.x + other.width &&
      other.x          < this.x  + self_dx + this.width &&
      this.y + self_dy < other.y + other.height &&
      other.y          < this.y  + self_dy + this.height;
  }
}
