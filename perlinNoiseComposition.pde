
import ddf.minim.*;
import ddf.minim.ugens.*;

Minim minim;
AudioOutput out;

Scene currentScene;
ArrayList<Scene> scenes;

float[] keys;

void setup(){
  size(400, 400);
  background(0);
  
  minim = new Minim(this);
  out = minim.getLineOut();
  out.setTempo(60);
  
  scenes = new ArrayList<Scene>();
  scenes.add(new Scene_Inversions());
  scenes.add(new Scene_Octaves());
  scenes.add(new Scene_Beads());
  scenes.add(new Scene_Splash());
  scenes.add(new Scene_Lines());
  
  currentScene = scenes.get(0);
  currentScene.initialize();
  
  keys = new float[88];
    for(int i=0; i<88; i++){
       keys[i] = f(i);
  } 

}


void draw(){
 currentScene.display();

}

void keyPressed(){
  if (key >= '0' && key <= '9')
    {
        int index = (int)(key - '0');
        if (index < scenes.size())
        {
          currentScene = scenes.get(index);
          currentScene.initialize();
        }
    }
   if(key == 'c'){
     background(0);
   }
}

void playNote(float time){
  float num = noise(time);
  int index = int(map(num, 0, 1, 0, 87));
  out.playNote(keys[index]);
}

float f(int n){
  return 440*(pow(pow(2, (1.0/12.0)), n-48));
}
  