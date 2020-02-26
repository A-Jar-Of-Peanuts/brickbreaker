class Player {
  int speed;
  int posX, posY;
  int size;
  int lives = 3; 
  public Player() {
    speed = 5;
    size = 100;
    posX = width/2;
    posY = height-(height/10);
  }
  public Player(int size) {
    speed = 5;
    this.size = size;
    posX = width/2-size;
    posY = height-(height/10);
  }
  public void moveLeft() {
    posX-=speed;
  }
  public void moveRight() {
    posX+=speed;
  }
  
  boolean On(float cx, float cy, float radius) {

    // temporary variables to set edges for testing
    float testX = cx;
    float testY = cy;

    // which edge is closest?
    if (cx < posX)         testX = posX;      // test left edge
    else if (cx > posX+size) testX = posX+size;   // right edge
    if (cy < posY)         testY = posY;      // top edge
    else if (cy > posY+20) testY = posY+20;   // bottom edge

    // get distance from closest edges
    float distX = cx-testX;
    float distY = cy-testY;
    float distance = sqrt( (distX*distX) + (distY*distY) );

    // if the distance is less than the radius, collision!
    if (distance <= radius) {
      return true;
    }
    return false;
  }
  public void show() {
    rect(posX, posY, size, 20);
  }
}
