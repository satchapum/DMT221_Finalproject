class MapCreate
{
  IntList randomNumber = new IntList(4);
  float offset;
  
  MapCreate(){
    offset = 0;
    
    for(int numberOfGround = 0; numberOfGround < 5; numberOfGround++){
      float randomGround = random(0,3);
      randomNumber.append((int)randomGround);
    }
  }
  
  void drawMap(){
    drawFloor();
    
    offset -= 3;
  }
  
  void drawFloor(){
    
    if(offset <= -200){
      float randomGround = random(0,2);
      randomNumber.append((int)randomGround);
      randomNumber.remove(0);
      offset = 0;
    }
    createGround();
  }
  
  void createGround(){
    for(int groundIndex = 0; groundIndex < 5; groundIndex++){
      drawGround(groundIndex*200 + offset,randomNumber.get(groundIndex));
    }
  }
  
  void drawGround(float offsetX, int randomGroundNumber){
    if(randomGroundNumber == 0){
      strokeWeight(1);
      line(offsetX,height/2+150,offsetX+200,height/2+150);
      imgCloud = loadImage("cloud.png");
      image(imgCloud,offsetX,100,150,60);
      
      imgcactus = loadImage("cactus.png");
      image(imgcactus,offsetX+50,height/2+123,70,70);
      drawStone(offsetX);
    }
    else if(randomGroundNumber == 1){
      strokeWeight(1);
      line(offsetX,height/2+150,offsetX+95,height/2+150);
      line(offsetX+95,height/2+150,offsetX+100,height/2+155);
      line(offsetX+100,height/2+155,offsetX+102,height/2+155);
      line(offsetX+102,height/2+155,offsetX+107,height/2+150);
      line(offsetX+107,height/2+150,offsetX+200,height/2+150);
      imgCloud = loadImage("cloud.png");
      image(imgCloud,offsetX+100,150,150,60);
      drawStone(offsetX);
    }
    else{
      strokeWeight(1);
      line(offsetX,height/2+150,offsetX+95,height/2+150);
      line(offsetX+95,height/2+150,offsetX+100,height/2+145);
      line(offsetX+100,height/2+145,offsetX+102,height/2+145);
      line(offsetX+102,height/2+145,offsetX+107,height/2+150);
      line(offsetX+107,height/2+150,offsetX+200,height/2+150);
      drawStone(offsetX);
    }
  }
  
  void drawStone(float offsetX){
    strokeWeight(2);
    line(offsetX+50,height/2+157,offsetX+55,height/2+157);
    strokeWeight(1.5);
    line(offsetX+95,height/2+160,offsetX+98,height/2+160);
    strokeWeight(1.75);
    line(offsetX+120,height/2+163,offsetX+124,height/2+163);
    strokeWeight(1.4);
    line(offsetX+160,height/2+159,offsetX+164,height/2+159);
    
  }
}
