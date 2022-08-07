

class Scene_Octaves extends Scene{
  
  private float time, x; 
  private int interval;
  private float inc;
  
  void initialize(){
    super.initialize();
    background(0);
    time = 0;
    x = 0;
    interval = 0;
    inc = 1;
  }
  
  void display(){
    stroke(255);
    strokeWeight(3);
    float num = 1-(noise(time));
    float y = map(num, 0, 1, 0, height);
    point(x, y);
  
    time+=0.005;
    x+=1;
    interval+=inc;
    
    if(interval%15 == 0){
      playNote(time);
    }  
    if(interval%30 ==0){
      playHarmony1();
    }
    if(interval%60 == 0){
      playOctave();
    }
    if(interval%90 == 0){
      playHarmony2();
    }
    if(x>width){
      x = 0;
      background(0);
    }
  }
  
  void playHarmony1(){
    float num = noise(time);
    int temp = int(map(num, 0, 1, 0, 87));
    float y = abs(height-(map(num, 0, 1, 0, height)));
    int index = temp + 3;
    if(index <= 87){
      out.playNote(keys[index]);
      stroke(160, 20, 180);
      point(x, y-30);
    }
  }

  void playHarmony2(){
    float num = noise(time);
    int temp = int(map(num, 0, 1, 0, 87));
    float y = abs(height-(map(num, 0, 1, 0, height)));
    int index = temp - 3;
    if(index >= 0){
      out.playNote(keys[index]);
      stroke(30, 200, 220);
      point(x, y+30);
    }
  }

  void playOctave(){
    float num = noise(time);
    int temp = int(map(num, 0, 1, 0, 87));
    float y = abs(height-(map(num, 0, 1, 0, height)));
    int index = temp - 12;
    if(index >= 0){
      out.playNote(keys[index]);
      stroke(100);
      point(x, y+120);
    }
  }
  
  
  
}