class circle{
  public int posX, posY;
  public int size;
  public int speedx, speedy;
  public circle(int posX, int posY, int size, int speedx, int speedy){
    this.posX = posX;
    this.posY = posY;
    this.size = size;
    this.speedx = speedx;
    this.speedy = speedy;
  }
  public void move(){
    posX += speedx;
    posY += speedy;
  }
  public void show(){
    ellipse(posX, posY, size, size);
  }
   public void changeSpeedX(int x) {
    System.out.println("hi");
    
    speedx = x;
  }
  public void changeSpeedY(int y) {
    System.out.println("hello");
   
    speedy = y;
  }
}
