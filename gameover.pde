class Gameover implements Window{

    int endWave;
    int coolDown;

    Gameover(){
        this.endWave = getWave()-1;
        setWave(1);
        this.setup();
    }


    void setup(){
        coolDown = 0;
    }

    void draw(){
        background(5,5,25);
        fill(255);
        text("YOU SURVIVED: " + Integer.toString(endWave),width/2,height/2);

        if(coolDown < 180){
            coolDown++;
        }
        
    }
    
    void touchStarted(){}
    
    void touchEnded(){
        if(coolDown >= 180){
            setWave(nextWave);

            window = 1;
        }

    }
    
    void touchMoved(){}
    void goBack(){}
}