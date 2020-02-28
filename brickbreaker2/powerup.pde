class powerup extends circle {
  public powerup(int posX, int posY) {
    super(posX, posY, 30, 5, 5);
  }
  public boolean on(int x, int y, int radius) {
    if (dist(x, y, posX, posY) < radius+15) {
      return true;
    }
    return false;
  }
  public void show() {
    fill(0, 0, 255);
    super.show();
  }
}
class biggerBall extends powerup {
  public int by;
  public int time = 5;
  public biggerBall(int posX, int posY, int by) {
    super(posX, posY);
    this.by = by;
  }
  public void show() {
    super.show();
    fill(225, 0, 0);
    text("bb", posX, posY);
  }
}
class moreBalls extends powerup {
  public int time = 5;
  public moreBalls(int posX, int posY) {
    super(posX, posY);
  }
  public boolean on(int x, int y, int radius) {
    if (dist(x, y, posX, posY) < radius+5) {
      return true;
    }
    return false;
  }
  public void show() {
    super.show();
    fill(255, 0, 0);
    text("mb", posX, posY);
  }
}
class fasterSpeed extends powerup {
  public int time = 5; 
  public fasterSpeed(int posx, int posY) {
    super(posx, posY);
  }
}
