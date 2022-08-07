
class Scene_Beads extends Scene{
  
  private float time, x, eX, interval;
  
  void initialize(){
    background(0);
    time = 0;
    x = 0;
    eX = 0;
  }
  
  
  void display(){
    stroke(255);
    strokeWeight(2);
    float num = 1-noise(time);
    float y = map(num, 0, 1, 0, height);
    point(x, y);
  
    time += 0.004;
    x += 1;
    eX += 1;
    interval +=1;
    
    float c = map(num, 0, 1, 0, 255);
  
    if(interval%50 ==0){
      playNote(time);
      strokeWeight(0);
      fill(20, 100, c);
      ellipse(eX, y, 30, 30);
    }
  
    if(x>width){
      x = 0;
    }
  
    if(eX>width){
      eX = 0;
    }
  
   }  
  
  
}