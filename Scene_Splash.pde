
class Scene_Splash extends Scene{
  
  private float time, eX, interval, eXsaved; 
  private int currentIndex;
  boolean done;
  
  void initialize(){
    background(0);
    time = 0;
    eX = 0;
    currentIndex = 0;
    eXsaved = 0;
    done = false;
  }
  
  
  void display(){
    stroke(255);
    strokeWeight(2);
    float num = 1-noise(time);
    float y = map(num, 0, 1, 0, height);
  
    time += 0.004;
    eX += 1;
    interval +=1;
  
    float c = map(num, 0, 1, 0, 235);
    if(interval%50 ==0){
      playArpeggio1();
      strokeWeight(3);
      stroke(255);
      fill(25, 25, c);
      ellipse(eX, y, 30, 30);
      eXsaved = eX;
      done = false;
    }
    
    if(interval%50 ==25){
      playArpeggio2();
      strokeWeight(1.5);
      fill(30, 30, c+5);
      ellipse(eXsaved, y-25, 15, 15);
    }
  
    if(interval%50 ==37){
      playArpeggio3();
      strokeWeight(0.75);
      fill(35, 35, c+10);
      ellipse(eXsaved, y-37, 8, 8);
    }
    
    if(interval%50 ==44){
      playArpeggio4();
      strokeWeight(0.38);
      fill(40, 40, c+20);
      ellipse(eXsaved, y-44, 4, 4);
      done = true;
    }
  
    if(eX>width && done){
      eX = 0;
      background(0);
    }
  
    if(interval==100){
      interval = 0;
    }
  } 
  
  void playArpeggio1(){
    float num = noise(time);
    currentIndex = int(map(num, 0, 1, 0, 87));
    out.playNote(keys[currentIndex]);
  }

  void playArpeggio2(){
     currentIndex += 4;
     if(currentIndex<88){
       out.playNote(keys[currentIndex]);
     }
  }

  void playArpeggio3(){
    currentIndex+=3;
    if(currentIndex<88){
      out.playNote(keys[currentIndex]);
    }
  }

  void playArpeggio4(){
    currentIndex+=5;
    if(currentIndex<88){
       out.playNote(keys[currentIndex]);
    }
  }

  
  
  
}