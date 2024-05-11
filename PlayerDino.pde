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
  float dinoAnimationNumber;
  float dinoAnimationNumbertarget;
  float nuberPerOneFrame;
  boolean IsJump;
  
  PlayerDino(){
    IsJump = false;
    dinoX = 100;
    dinoY = 425;
    dinoYTemp = dinoY;

    gravity = 4;
    tempGravity = gravity;
    timeCount = 0;
    timeTojump = 1;
    dinoAnimationNumber = 0;
    dinoAnimationNumbertarget = 1;

  }
  
  void dinoDraw(){
    //DinoHere
    imageMode(CENTER);
    if(dinoAnimationNumber <= dinoAnimationNumbertarget/2){
      image(imgDino_1, dinoX, dinoY,50,50);
      dinoAnimationNumber += 0.075;
    }
    else if(dinoAnimationNumber <= dinoAnimationNumbertarget){
      image(imgDino_2, dinoX, dinoY,50,50);
      dinoAnimationNumber += 0.075;
      if(dinoAnimationNumber > dinoAnimationNumbertarget){
        dinoAnimationNumber = 0;
      }
    }



    //jump
    if(IsJump == true && timeCount <=timeTojump){
      //println(timeCount);
      //println(maxTimeToJump);
      dinoY -= 3;
      gravity -= 0.25;
      timeCount += 0.04;
      if (!dinojump.isPlaying()){
      dinojump.play();
      }
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
