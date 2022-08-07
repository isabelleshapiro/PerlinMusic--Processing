
class Scene_Lines extends Scene{
  private int interval;
  private int c; 
  private float time;
  
  void initialize(){
    interval = 0;
    background(0);
    time = 0;
  }
  
  
  void display(){
    float num = 1-noise(time);
    float y = map(num, 0, 1, 0, height);
    c = int(map(num, 0, 1, 0, 255));
  
    stroke(c, Math.abs(100-c), Math.abs(255-c));
    strokeWeight(2);
  
    if(interval%15==0){
      playNote(time);
      line(0, y, width, y);
    }
  
    time+=0.005;
    interval++;
  }
  
}