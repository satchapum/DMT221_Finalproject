import processing.sound.*;

AudioIn in;
Amplitude analyzer;
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
  in = new AudioIn(this,0);
  in.start();
  analyzer = new Amplitude(this);
  analyzer.input(in);
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
  float vol = analyzer.analyze();
  ellipse(width/2, height/2, 10+vol*200, 10+vol*200);
  println(vol*(10^5));
  if (vol*(10^5) > 1f ) {
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
  //in.close();
  //minim.stop();
  //super.stop();
  
  in.stop();
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
