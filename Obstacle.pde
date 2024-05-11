class Obstacle
{
  float x;
  float y;
  float sizeX;
  float sizeY;
  
  boolean isCactus;
  boolean isBird;
  
  Obstacle(float _y,float size_X, float size_Y, boolean cactus, boolean bird){
    sizeX = size_X;
    sizeY = size_Y;
    isCactus = cactus;
    isBird = bird;
    
    x = width+20;
    y = _y;
  }
  void drawObstacle(){
    imageMode(CENTER);
    if(isCactus == true){
      image(imgcactus, x, y,sizeX,sizeY);
    }
    else if(isBird == true){
      image(imgBird_1, x, y,sizeX,sizeY);
    }
  }
  
  void moveObstacle(){
    x -= 3;
  }
}
