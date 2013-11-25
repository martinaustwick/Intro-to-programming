String [] sequence = {"Translate: 125, 75", "Rotate: 30", "Scale:1.5"};
//String [] sequence = {"Rotate: 30","Translate: 125, 75"};
//String [] sequence = {"Rotate: 30","Translate: 125, 75", "Rotate: -30", "Scale: 1.25", "Translate: 50, -20"};


void transform(String step)
{
    String [] thisStep = split(step, ":");
    if(thisStep[0].equals("Translate"))
    {
        String [] pv = split(thisStep[1], ",");
        p.translate(float(pv[0]), float(pv[1]));
    }
    
    if(thisStep[0].equals("Rotate"))
    {
        p.rotate(radians(float(thisStep[1])));
    }
    
    if(thisStep[0].equals("Scale"))
    {
        p.scale(float(thisStep[1]));
    }
    
    //grid(color(0,0,255,100));
}

void animate(String step)
{
    String [] thisStep = split(step, ":");
    
   
    if(thisStep[0].equals("Translate"))
    {
        String [] pv = split(thisStep[1], ",");
        p.translate(float(pv[0])*prop, float(pv[1])*prop);
        
    }
    
    if(thisStep[0].equals("Rotate"))
    {
        p.rotate(prop*radians(float(thisStep[1])));
    }
    
    if(thisStep[0].equals("Scale"))
    {
        float pscale = 1 + prop*(float(thisStep[1])-1);
        p.scale(pscale);
    }
      
    applyMatrix(p);
    
    if(play) 
    {
      prop+=propInc;
    }
    
    
    if(prop>=1)
    {
        prop = 1;
        if(waitCount>50)
        {
          currentStep = (currentStep+1)%sequence.length;
          prop = 0;
          waitCount = 0;
        }
        else if(play) waitCount++;
    }
    
}

void update()
{
    p = new PMatrix2D();
    
    for(int i = 0; i<currentStep; i++)
    {
        transform(sequence[i]);
    }
    
    animate(sequence[currentStep]);
    
}
