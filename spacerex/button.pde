class Button{
  protected float x, y, w, h;
  protected String label;
  protected Boolean selected, active;
  protected color primCol;
  protected int active_touch;

  Button(float x, float y, float w, String label){ //button is a square
    this.setup(x, y, w, w, label);
  }
  Button(float x, float y, float w, float h, String label){
    this.setup(x, y, w, h, label);
  }

  private void setup(float x, float y, float w, float h, String label){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.label = label;
    this.active_touch = -1;
    this.selected = false;
    this.primCol = color(230);
    this.active = true;
  }

  public void show(){
    if(!this.active){
      return;
    }

    pushStyle();
      fill(primCol,150);
      rect(this.x, this.y, this.w, this.h);

      fill(255);
      textSize(this.h/3);
      text(this.label, this.x+this.w/2, this.y+this.h/2);

      if(this.selected){
        noStroke();
        fill(255, 100);
        rect(this.x, this.y, this.w, this.h);
      }
    popStyle();
  }

  public boolean mouseOver(float x,float y){
    return(this.active && (this.x<=x && this.x+this.w>=x) && (this.y<=y && this.y+this.h>=y));
  }

  public void setSelected(boolean selected){
    this.selected = selected;
  }
  public Boolean getSelected() {
    return this.selected;
  }

  public void setActiveTouch(int i){
    this.active_touch = i;
    if(i == -1){ //if there is no active touch
      this.selected = false;
    }
  }
  public int getActiveTouch(){
    return this.active_touch;
  }

  public void setLabel(String newLabel){
    this.label = newLabel;
  }

  public void setActive(Boolean active){
    this.active = active;
  }
  public Boolean getActive(){
    return this.active;
  }
}
