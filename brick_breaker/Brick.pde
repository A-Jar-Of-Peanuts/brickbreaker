class Brick {
  int hp;
  int posX, posY;
  public Brick(int posX, int posY) {
    this.posX = posX;
    this.posY = posY;
    hp = 1;
  }
  public Brick(int hp, int posX, int posY) {
    this.hp = hp;
    this.posX = posX;
    this.posY = posY;
  }
  public void minusHP() {
    hp--;
  }
  public void show() {
    if (hp>0) {
      float c = map(hp, 1, 10, 0, 255);
      fill(0, c, 0);
      rect(posX, posY, 100, 50);
      //System.out.println("hi");
    }
  }
  int On(float cx, float cy, float radius) {
    if (hp<=0) {
      return 0;
    }
    // temporary variables to set edges for testing
    float testX = cx;
    float testY = cy;
    int side = 0; 
    // which edge is closest?
    if (cx < posX) {        
      testX = posX;      // test left edge
      side = 1;
    } else if (cx > posX+100) { 
      testX = posX+100;   // right edge
      side = 1;
    }
    if (cy < posY) {        
      testY = posY;      // top edge
      side = 2;
    } else if (cy > posY+50) { 
      testY = posY+50;   // bottom edge
      side = 2;
    }

    // get distance from closest edges
    float distX = cx-testX;
    float distY = cy-testY;
    float distance = sqrt( (distX*distX) + (distY*distY) );

    // if the distance is less than the radius, collision!
    if (distance <= radius) {
      return side;
    }
    return 0;
  }
}
