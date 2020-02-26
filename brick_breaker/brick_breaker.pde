int Mode = 3;
boolean left, right;
Map m;
void setup() {
  m = new Map(5);
  fullScreen();
}

void draw() {
  background(255);
  switch(Mode) {
  case 1:
    m.show();
    if (m.p.lives==0) {
      Mode = 2;
    } else if(m.score >= m.winningscore){
      Mode = 2; 
    } else{
      break;
    }
    
  case 2: 
    background(0);
    fill(255);
    textSize(100);
    if(m.p.lives==0){
      text("you lose\npress enter to restart", CENTER, height/10);
    } else{
      text("you win\npress enter to restart", CENTER, height/10);
    }
    break; 
  case 3:
    textSize(100);
    fill(0);
    text("brickbreaker\npress enter to play", CENTER, height/10);
    break;
  }
}
public void keyPressed() {
  //System.out.println("hello");
  if (keyCode == LEFT) {
    left = true;
  } else if (keyCode == RIGHT) {
    right = true;
  }
}
public void keyReleased() {
  if (keyCode == LEFT) {
    left = false;
  }
  if (keyCode == RIGHT) {
    right = false;
  }
  if(keyCode == ENTER){
    Mode = 1; 
    m = new Map((int)random(5, 10));
  }
}
