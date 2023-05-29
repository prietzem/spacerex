import processing.sound.*;

class SoundHandler{
  float amp;
  Soundfile[] sounds;
  

  SoundHandler(){
    amp = 1;
    sounds = new Soundfile[1];
    
    sounds[0] = new Soundfile(this, "shoot.mp3"); //shoot sound
    this.setAmp(amp);
  }

  playShoot(){
    sounds[0].play();
  }

  void setAmp(float amp){
    this.amp = amp
    for (sound:this.sounds){
      sound.amp(this.amp);
    }
  }

  float getAmp(){
    return this.amp;
  }
}