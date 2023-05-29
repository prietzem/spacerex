

class SoundHandler{
  float amp;
  SoundFile[] sounds;
  

  SoundHandler(SoundFile[] sounds){
    amp = 1;
    
    this.sounds = new SoundFile[1];
    this.sounds[0] = sounds[0];
    
    this.setAmp(amp);
  }

  void playShoot(){
    sounds[0].play();
  }

  void setAmp(float amp){
    this.amp = amp;
    for (SoundFile sound:this.sounds){
      sound.amp(this.amp);
    }
  }

  float getAmp(){
    return this.amp;
  }
}