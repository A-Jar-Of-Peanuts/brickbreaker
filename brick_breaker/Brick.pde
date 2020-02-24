class Brick{
  int hp;
  int posX, posY;
  public Brick(int posX, int posY){
    this.posX = posX;
    this.posY = posY;
  }
  public Brick(int hp, int posX, int posY){
    this.hp = hp;
    this.posX = posX;
    this.posY = posY;
  }
  public void minusHP(){
    hp--;
  }
  public void On(int x, int y){
    
  }
}
