class Player{
  int speed;
  int posX, posY;
  int size;
  public Player(){
    speed = 5;
    size = 30;
    posX = width/2-size;
    posY = width/4;
  }
  public void moveLeft(){
    posX-=speed;
  }
  public void moveRight(){
    posX+=speed;
  }
  //public void keyPressed(){
  //  if(keyCode==LEFT){
  //    moveLeft();
  //  } else if(keyCode==RIGHT){
  //    moveRight();
  //  }
  //}
  public boolean On(int x, int y){ 
    return x>=posX && x<=posX+size && y>=posY && y<=posY+5;
  }
  public void show(){
    rect(posX, posY, size, 5);
  }
}
