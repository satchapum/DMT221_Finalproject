import ddf.minim.*;

Minim minim;
AudioInput in;
color white;

PImage imgDino_1;
PImage imgDino_2;
boolean IsGameStart;

float playerScore;

//Dinosetting

MapCreate mapCreate = new MapCreate();
PlayerDino playerDino = new PlayerDino();

void setup() {
  //sound
  minim = new Minim(this);
  minim.debugOn();
  in = minim.getLineIn(Minim.STEREO, 512);
  //

  background(255);
  size(800, 600);
  noSmooth();
  frameRate(60);
  IsGameStart = false;
  imgDino_1 = loadImage("dino1.png");
  imgDino_2 = loadImage("dino2.png");
}

void draw() {
  background(255);

  checkSoundForJump();

  if (IsGameStart == false)
    mainmenuUI();

  else if (IsGameStart == true) {
    playerScoreUpdate();
    mapCreate.drawMap();
    playerDino.dinoDraw();
  }

}

void checkSoundForJump() {
  println(in.left.level()*(10^52));
  if (in.left.level()*(10^52) > 1 ) {
    if (playerDino.IsJump == true) {
      return;
    } else {
      playerDino.dinoJump();
    }
  }
}

void mainmenuUI() {
  fill(255);
  rectMode(CENTER);
  rect(width/2, height/2, 100, 50);
  fill(0);
  textSize(40);
  textAlign(CENTER);
  text("start", width/2, height/2+12.5);
}

void inGameUI() {
  fill(255);
  rectMode(CENTER);
  rect(width/2, height/2, 100, 50);
  fill(0);
  textSize(40);
  textAlign(CENTER);
  text("start", width/2, height/2+12.5);
}

void playerScoreUpdate() {
  fill(0);
  textSize(40);
  textAlign(RIGHT);
  text((int)playerScore, 780, 40);

  playerScore += 0.5;
}

void mousePressed() {

  //startbutton
  if (mouseX <= width/2 + 50 && mouseX >= width/2 - 50 && mouseY <= height/2 + 25 && mouseY >= height/2 - 25) {
    IsGameStart = true;
  }
}

void stop()
{
  // always close Minim audio classes when you are done with them
  in.close();
  minim.stop();
  super.stop();
}

void keyPressed() {
  //if (key==' ') {
  //  if (playerDino.IsJump == true) {
  //    return;
  //  } else {
  //    playerDino.dinoJump();
  //  }
  //}
}
