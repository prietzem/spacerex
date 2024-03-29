class UpgradeBox{
  private float x, y, w, h;
  private int maxEquipped;
  private ArrayList<Upgrade> equipped;

  UpgradeBox(float x,float y,float w,float h){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.maxEquipped = 3;

    this.loadData();
  }

  public void show(){
    pushStyle();
      noFill();
      rect(x, y, w, h);
    popStyle();
    for(Upgrade u : this.equipped){
      u.show();
    }
  }

  public void click(){
    for(int i=0; i<this.equipped.size(); i++){
      if(this.equipped.get(i).isMouseOver(mouseX, mouseY)){
        unEquipUpgrade(this.equipped.get(i).getFullId());
        this.equipped.remove(i);
        window.update();
        return;
      }
    }
  }

  public boolean canTake(int id){
    if(this.maxEquipped > this.equipped.size()){
      return true;
    } else{
      for(Upgrade u : this.equipped){
        if(u.getId() == id){
          return true;
        }
      }
    }
    return false;
  }

  public void loadData(){
    String[] ids = getList("equipped_upgrades"); //all IDs of all upgrades in player's inventory in order
    IntDict equipped_anz = new IntDict(); //to store all currently equiped ubgrades
    this.equipped = new ArrayList<Upgrade>(); //empty list to not load more items when equiping items

    if(!ids[0].equals("")){ //if there is any upgrade actually equipped
      for(int i=0; i<ids.length; i++){
        String tempId = split(ids[i], ",")[0];
        int tempNum = int(split(ids[i], ",")[1]);
        if(equipped_anz.hasKey(tempId)){
          equipped_anz.add(tempId, tempNum);
        }else{
          equipped_anz.set(tempId, tempNum);
        }
      }

      float size_temp = this.w/10; //half size of one upgrade
      String allUpgrades[][] = readFileM1("upgrades.m1");
      for(int i=0; i<allUpgrades.length; i++){
        if(equipped_anz.hasKey(allUpgrades[i][0])){
          this.equipped.add(new Upgrade(this.x+size_temp*2+size_temp*this.equipped.size()*3, this.y+this.h/2, size_temp*2, int(allUpgrades[i][0]), allUpgrades[i][1], allUpgrades[i][2], allUpgrades[i][3], equipped_anz.get(allUpgrades[i][0])));
        }
      }
    }
  }
}
