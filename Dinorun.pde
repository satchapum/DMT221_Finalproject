import processing.sound.*;

AudioIn in;
Amplitude analyzer;
color white;

PImage imgDino_1;
PImage imgDino_2;
PImage imgCloud;
PImage imgcactus;
PImage imgBird_1;
PImage imgBird_2;
boolean IsGameStart;

float playerScore;
float playerBestScore;

float currentTime;
float timeToCreateObstacle;
//Dinosetting

MapCreate mapCreate = new MapCreate();
PlayerDino playerDino = new PlayerDino();
ArrayList<Obstacle> obstacle = new ArrayList<Obstacle>();

void setup() {
  //obstacle
  currentTime = 0;
  timeToCreateObstacle = 2;
  //
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
  imgcactus = loadImage("cactus.png");
  imgBird_1 = loadImage("bird1.png");
  imgBird_2 = loadImage("bird2.png");
  
  playerBestScore = 0;
}

void draw() {
  background(255);

  checkSoundForJump();

  if (IsGameStart == false){ 
    mainmenuUI();
  }
  else if (IsGameStart == true) {
    playerScoreUpdate();
    mapCreate.drawMap();
    playerDino.dinoDraw();
    
    checkTimeToCreateObstacle();
    moveObstacle();
    checkDinoColliderHitTheObstacle();
  }

}

void checkDinoColliderHitTheObstacle(){
  for(int numberOfObstacle = 0; numberOfObstacle < obstacle.size() ; numberOfObstacle++){
    Obstacle currentObstacle = obstacle.get(numberOfObstacle);
    
    if(playerDino.dinoX >= (currentObstacle.x-(currentObstacle.sizeX/2)) && playerDino.dinoX <= (currentObstacle.x+(currentObstacle.sizeX/2)) 
    && playerDino.dinoY >= (currentObstacle.y-(currentObstacle.sizeY/2)) && playerDino.dinoY <= (currentObstacle.y+(currentObstacle.sizeY/2))){
      //println("hit");
      if(playerScore > playerBestScore){
        playerBestScore = playerScore;
      }
      playerScore = 0;
      playerDino.dinoY = 425;
      deleteAllObstacle();
      IsGameStart = false;
    }
  }
}

void deleteAllObstacle(){
  for(int numberOfObstacle = obstacle.size()-1; numberOfObstacle >= 0 ; numberOfObstacle--){
    obstacle.remove(numberOfObstacle);
  }
}

void checkTimeToCreateObstacle(){
  currentTime += 1/60f; //60 frame in 1 sec
  if(currentTime >= timeToCreateObstacle){
    createObstacle();
    currentTime = 0;
  }
}

void createObstacle(){
  float typeOfObstacle = random(1,5);
  
  //Cactus vvvv
  if((int)typeOfObstacle == 1 || (int)typeOfObstacle == 2 || (int)typeOfObstacle == 3){
    obstacle.add(new Obstacle(height/2+123, 70, 70, true, false));
  }
  //Bird vvvv
  else if((int)typeOfObstacle == 4){
    obstacle.add(new Obstacle(330, 80, 60, false, true));
  }
}

void moveObstacle(){
  //println(obstacle.size()-1);
  for(int numberOfObstacle = obstacle.size()-1; numberOfObstacle >= 0 ; numberOfObstacle--){
    Obstacle currentObstacle = obstacle.get(numberOfObstacle);
    currentObstacle.drawObstacle();
    currentObstacle.moveObstacle();
    
    if(currentObstacle.x <= -20){
      obstacle.remove(numberOfObstacle);
    }
  }
}

void checkSoundForJump() {
  float vol = analyzer.analyze();
  //println(vol*(10^5));
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
  
  text("Your Best Score : " + (int)playerBestScore, width/2, height/2+120);
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

void keyPressed() {
  //if (key==' ') {
  //  if (playerDino.IsJump == true) {
  //    return;
  //  } else {
  //    playerDino.dinoJump();
  //  }
  //}
}
