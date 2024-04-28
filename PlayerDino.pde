class PlayerDino
{
  float dinoX;
  float dinoY;
  float dinoYTemp;
  
  //jumpSystem
  float timeCount;
  float maxTimeToJump;
  float timeTojump;
  boolean IsJump;
  
  PlayerDino(){
    IsJump = false;
    dinoX = 100;
    dinoY = 425;
    dinoYTemp = dinoY;
    
    timeCount = 0;
    timeTojump = 1;
  }
  
  void dinoDraw(){

    rect(dinoX,dinoY,50,50);

    //jump
    if(IsJump == true && timeCount <=timeTojump){
      println(timeCount);
      println(maxTimeToJump);
      dinoY -= 3;
      timeCount += 0.04;
    }
    else if(timeCount > timeTojump){
      dinoY += 3;
      
      if(dinoY >= dinoYTemp){
        dinoY = dinoYTemp;
        timeCount = 0;
        IsJump = false;
      }
    }
  }
  
  void dinoJump(){
    if(IsJump == true){
      return;
    }
    else{
      //setTimeTojump();
      IsJump = true;
    }
  }
  
  void setTimeTojump(){
    maxTimeToJump = timeTojump;
  }
}
