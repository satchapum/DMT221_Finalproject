PImage img;
boolean IsGameStart;

//Dinosetting

MapCreate mapCreate = new MapCreate();
PlayerDino playerDino = new PlayerDino();

void setup(){
  background(255);
  size(800,600);
  
  frameRate(60);
  IsGameStart = false;
  img = loadImage("dino1.png");
}

void draw(){
  background(255);
 
  if(IsGameStart == false)
  mainmenuUI();
  
  else if(IsGameStart == true){
    mapCreate.drawMap();
    playerDino.dinoDraw();
  }
}

void mainmenuUI(){
  fill(255);
  rectMode(CENTER);
  rect(width/2,height/2,100,50);
  fill(0);
  textSize(40);
  textAlign(CENTER);
  text("start",width/2,height/2+12.5);
}

void inGameUI(){
  fill(255);
  rectMode(CENTER);
  rect(width/2,height/2,100,50);
  fill(0);
  textSize(40);
  textAlign(CENTER);
  text("start",width/2,height/2+12.5);
}

void mousePressed(){
  
  //startbutton
  if(mouseX <= width/2 + 50 && mouseX >= width/2 - 50 && mouseY <= height/2 + 25 && mouseY >= height/2 - 25){
    IsGameStart = true;
  }
}

void keyPressed() {
  if (key==' ') {
    if(playerDino.IsJump == true){
      return;
    }
    else{
      playerDino.dinoJump();
    }
  }
}
