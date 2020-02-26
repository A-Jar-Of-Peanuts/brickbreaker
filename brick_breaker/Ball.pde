class Ball{
  int size;
  int posX, posY;
  int speedx, speedy;
  public Ball(){
    size = 30;
    posX = width/2+size;
    posY = height-(height/10)-size;
    speedx = 0;
    speedy = 5;
  }
  public Ball(int size, int speedx, int speedy){
    this.size = size;
    this.speedx = speedx;
    this.speedy = speedy;
  }
  public void show(){
    fill(255, 0, 0);
    ellipse(posX, posY, size, size);
  }
  public void move(){
    posX += speedx;
    posY += speedy;
  }
}
