class BackGround{
  ArrayList<Rock> rocks;
  ArrayList<Star> stars;
  ArrayList<AnimationI> animations;
  int starCount; //random number how often a star twinkles in the background

  BackGround(){
    this.rocks = new ArrayList<Rock>();
    this.stars = new ArrayList<Star>();
    this.starCount = 40;
    Rock r;
    for(int i=0; i<4; i++) {
      r = new Rock(1,random(0,width),random(0,height),110);
      r.changeSpeed(0.3);
      this.rocks.add(r);
    }
    this.animations = new ArrayList<AnimationI>();
  }

  void draw(){
    background(5,5,25);

    if(this.starCount <= 0){
      this.stars.add(new Star());
      this.starCount = int(random(10, 200));
    }
    this.starCount--;

    for(int i=this.stars.size()-1; i>=0; i--){
      Star s = this.stars.get(i);
      s.show();
      if(s.getDie()){
        this.stars.remove(i);
      }
    }

    for(Rock r : this.rocks){
      r.show();
      r.update();
    }

    for(int i=this.animations.size()-1; i>=0; i--) {
      AnimationI a = this.animations.get(i);
      a.show();
      if(a.isOver()) {
        this.animations.remove(a);
      }
    }
  }

  void touch() {
    PVector[] p = new PVector[1];
    p[0] = new PVector(mouseX, mouseY);
    for(int i=this.rocks.size()-1; i>=0; i--){
      Rock r = this.rocks.get(i);
      if(r.isHit(p)) {
        this.animations.add(new RockExplosion_Animation(220,220, r.getData()[1], r.getData()[2]));
        this.rocks.remove(r);

        r = new Rock(1,random(0,width),int(random(0,2))*height,110);
        r.changeSpeed(0.3);
        this.rocks.add(r);
      }
    }
  }
}
