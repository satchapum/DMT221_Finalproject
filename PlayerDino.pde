class PlayerDino
{
  float dinoX;
  float dinoY;
  float dinoYTemp;
  
  //jumpSystem
  float timeCount;
  float maxTimeToJump;
  float timeTojump;
  float gravity;
  float tempGravity;
  boolean IsJump;
  
  PlayerDino(){
    IsJump = false;
    dinoX = 100;
    dinoY = 425;
    dinoYTemp = dinoY;

    gravity = 3;
    tempGravity = gravity;
    timeCount = 0;
    timeTojump = 1;
  }
  
  void dinoDraw(){
    //DinoHere
    imageMode(CENTER);
    image(img, dinoX, dinoY,50,50);
    //rect(dinoX,dinoY,50,50);

    //jump
    if(IsJump == true && timeCount <=timeTojump){
      println(timeCount);
      println(maxTimeToJump);
      dinoY -= 3;
      gravity -= 0.25;
      timeCount += 0.04;
    }
    else if(timeCount > timeTojump){
      dinoY += gravity;
      gravity += 0.25;
      
      if(dinoY >= dinoYTemp){
        dinoY = dinoYTemp;
        timeCount = 0;
        IsJump = false;
        gravity = tempGravity;
      }
    }
  }
  
  void dinoJump(){
    if(IsJump == true){
      return;
    }
    else{
      IsJump = true;
    }
  }
}
