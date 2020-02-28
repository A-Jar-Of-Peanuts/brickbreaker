class ball extends circle {
  public ball() {
    super(width/2+30, height-(height/10)-30, 30, 0, 5);
    //System.out.println("hello");
  }
  public ball(int posX, int posY, int size, int speedx, int speedy) {
    super(posX, posY, size, speedx, speedy);
    System.out.println("hello");
  }
  public void show() {
    fill(255, 0, 0);
    super.show();
  }
 
}
