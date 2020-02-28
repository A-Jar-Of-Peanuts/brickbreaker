class brick {
  public int posX, posY;
  public int h, w;
  public int hp;
  public String powerup;
  public biggerBall b = new biggerBall(posX, posY, 5);
  public fasterSpeed fs = new fasterSpeed(posX, posY);
  public moreBalls mb = new moreBalls(posX, posY);
  public brick(int posX, int posY) {
    this.posX = posX;
    this.posY = posY;
    hp = 1;
    w = 100;
    h = 50;
    powerup = "none";
  }
  public brick(int posX, int posY, int hp, String powerup) {
    this.posX = posX;
    this.posY = posY;
    this.w = 100;
    this.h = 50;
    this.hp = hp;
    this.powerup = powerup;
  }
  public void show() {
    if (hp>0) {
      float c = map(hp, 1, 10, 0, 255);
      fill(0, c, 0);
      rect(posX, posY, w, h);
      switch(powerup) {
      case "none":
        break;
      case "biggerBall":
        fill(255, 0, 0);
        text("bb", posX, posY);
        break;
      case "moreBalls":
        fill(255, 0, 0);
        text("mb", posX, posY);
        break;
      case "fasterSpeed":
        fill(255, 0, 0);
        text("fs", posX, posY);
        break;
      }
    } else {
      switch(powerup) {
      case "none":
        break;
      case "biggerBall":
        b.show();
        break;
      case "moreBalls":
        mb.show();
        break;
      case "fasterSpeed":
        fs.show();
        break;
      }
    }
  }
  public int on(float cx, float cy, float radius) {
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
    } else if (cx > posX+w) { 
      testX = posX+w;   // right edge
      side = 1;
    }
    if (cy < posY) {        
      testY = posY;      // top edge
      side = 2;
    } else if (cy > posY+h) { 
      testY = posY+h;   // bottom edge
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
