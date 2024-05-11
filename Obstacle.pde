class Obstacle
{
  float x;
  float y;
  float sizeX;
  float sizeY;
  
  boolean isCactus;
  boolean isBird;
  
  float animationOfBird;
  float birdAnimationNumbertarget;
  Obstacle(float _y,float size_X, float size_Y, boolean cactus, boolean bird){
    sizeX = size_X;
    sizeY = size_Y;
    isCactus = cactus;
    isBird = bird;
    
    x = width+20;
    y = _y;
    animationOfBird = 0;
    birdAnimationNumbertarget = 1;
  }
  void drawObstacle(){
    imageMode(CENTER);
    if(isCactus == true){
      image(imgcactus, x, y,sizeX,sizeY);
    }
    else if(isBird == true){
      if(animationOfBird <= birdAnimationNumbertarget/2){
        image(imgBird_1, x, y,sizeX,sizeY);
        animationOfBird += 0.075;
      }
      else if(animationOfBird <= birdAnimationNumbertarget){
        image(imgBird_2, x, y,sizeX,sizeY);
        animationOfBird += 0.075;
        if(animationOfBird > birdAnimationNumbertarget){
          animationOfBird = 0;
        }
      }
    }
  }
  
  void moveObstacle(){
    x -= 3;
  }
}
