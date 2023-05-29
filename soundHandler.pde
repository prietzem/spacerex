

class SoundHandler{
  float amp;
  SoundFile[] sounds;
  

  SoundHandler(SoundFile[] sounds){
    amp = 1;
    
    this.sounds = sounds;
    
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