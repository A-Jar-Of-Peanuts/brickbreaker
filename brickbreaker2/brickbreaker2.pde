int mode = 1;
map m;
boolean right=false;
boolean left = false;
int x = 80, y=800;
int x2 = 600, y2 = 800;
int s = 30;
int s2 = 100;
public void setup() {
   m = new map(s, s2);
  fullScreen();
}
public void draw() {
  switch(mode) {
    //intro
  case 1:
    background(255);
    textSize(80);
    text("brickbreaker\nPress enter play", CENTER, 80);
    //fill(255, 0, 0);
    fill(0);
    stroke(30);
    //System.out.println("hell0");
    line(80, 800, 500, 800);
    ellipse(x, y, 20, 20);
    if (mousePressed && mouseX>80 && mouseX<500 && mouseY>795 && mouseY<805) {
      x = mouseX;
      y = mouseY;
    }
    s = (int)map(x, 80, 500, 20, 100);
    ellipse(80, 500, s, s);
    m.setBallSize(s);

    line(600, 800, 1020, 800);
    ellipse(x2, y2, 20, 20);
    if (mousePressed && mouseX>600 && mouseX<1020 && mouseY>795 && mouseY<805) {
      x2 = mouseX;
      y2 = mouseY;
    }
     s2 = (int)map(x2, 600, 1020, 50, 300);
    rect(600, 500, s2, 20);
    m.setPlayerSize(s2);
    m = new map(s2, s);
    break;
    //game
  case 2:
    background(255);
    textSize(10);
    m.show();
    if (m.p.lives<=0 || m.score >= m.winningscore) {
      mode = 3;
    }
    break;
    //gameover
  case 3:
    if (m.p.lives<=0) {
      background(0);
      textSize(80);
      fill(255);
      text("You Lose\nPress enter to try again", CENTER, 80);
    } else {
      fill(255);
      background(0);
      textSize(80);
      text("You Win\nPress enter to try again", CENTER, 80);
    }
    break;
  }
}
