class Gameover implements Window{
  private int endWave, highscore; //current end score
  private int coolDown;
  private boolean achievementCompleted;

  Gameover(){
    this.endWave = getWave()-1;
    setWave(1);
    updateStats("finishedGames");
    this.highscore = getStat("highscore");
    updateStats("highscore", max(this.endWave, this.highscore));
    this.achievementCompleted = TestAchievements();
    this.setup();
  }

  public void setup(){
    coolDown = 0;
  }

  public void draw(){
    background(0);
    bg.drawStars();
    fill(255);
    textSize(height/13);
    if(this.highscore < this.endWave){
      text("NEW HIGHSCORE: "+this.endWave, width/2, height/3);
    }
    else{
      text("YOU SURVIVED: " +this.endWave, width/2, height/3);
    }
    text("HIGHSCORE: " +this.highscore, width/2, height*2/3);

    if(this.achievementCompleted){
      textSize(height/26);
      text("Achievement unlocked", width/2, height*4/5);
    }

    if(coolDown < 120){
      coolDown++;
    }
  }

  public void touchEnded(){
    if(coolDown >= 120){
      setWave(1);
      setWindow(1);
    }
  }

  public void goBack(){
    setWindow(1);
  }

  public void touchStarted(){}
  public void touchMoved(){}
}
