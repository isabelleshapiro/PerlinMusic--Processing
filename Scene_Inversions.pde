
class Scene_Inversions extends Scene{

  private float time, x; 
  private int interval;
  private float inc;
  
  void initialize(){
    super.initialize();
    time = 0;
    x = 0;
    interval = 0;
    inc = 1;

  }
  
  void display(){
    stroke(255);
    strokeWeight(3);
    float num = 1-(noise(time));
    float invNum = noise(time);
    float y = map(num, 0, 1, 0, height);
    float yInv = map(invNum, 0, 1, 0, height);
    point(x, y);
  
    stroke(255, 0, 0);
    strokeWeight(3);
    point(x, yInv);
  
    float quarterNum = abs(0.25-noise(time));
    float qY = map(quarterNum, 0, 1, 0, height);
    stroke(0, 0, 255);
    point(x, qY);
  
    time+=0.005;
    x+=1;
    interval+=inc;
  
    if(interval%15 == 0){
      playNote(time);
      playInverse();
      playQuarter();
    }
    
    if(x > width){
      x = 0;
    }
    
  
  }
  
  void playInverse(){
    float num = abs((1-noise(time)));
    int index = int(map(num, 0, 1, 0, 87));
    if(index >= 0){
      out.playNote(keys[index]);
    }
  }
  
  void playQuarter(){
    float num = abs(0.25-noise(time));
    int index = int(map(num, 0, 1, 0, 87));
    if(index>=0){
      out.playNote(keys[index]);
    }
  }
  
  

  
}