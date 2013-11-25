PVector o, cam, p;
Boolean [] visible;
int vis;
boolean play = true;
float time;
int h = 50;

void setup()
{
    size(500, 500);
    o = new PVector(width*0.3, height*0.7);
    cam = new PVector(width*0.1, height*0.1);
    
    vis = 0;
    visible = new Boolean [3];
    for(int i = 0; i<visible.length; i++)
    {
        visible[i] = false;
    }
    time = 0;
}

void draw()
{
    background(255);
    strokeWeight(3);
    if(play) time = (time+0.5)%(0.7*width);
    p = new PVector(o.x + time, (height*0.7)-h);
    
    fill(0);
    stroke(0);
    cam();
    noFill();
    ellipse(o.x, o.y, 10, 10);
    rect(p.x, p.y, 5, h);
    
    
    
    if(visible[0]) {
      arrow(o, p, color(255, 0, 0));
      
      PVector q = PVector.add(o,p);
      q.mult(0.5);
      text("Transform T", q.x-20, q.y-20);
    }
    if(visible[1]){
      arrow(o, cam, color(0, 0, 255));
      PVector q = PVector.add(o,cam);
      q.mult(0.5);
      text("Translate C", q.x, q.y-20);
    }
    if(visible[2]){
      arrow(p, cam, color(0, 255, 0));
      PVector q = PVector.add(p,cam);
      q.mult(0.5);
      text("Inverse(T) then C", q.x, q.y-20);
    }
        
}

void arrow(PVector start, PVector end, color c)
{
    float t = float(frameCount%50)/50;
    float segLength = 25;
    stroke(c);
    fill(c);
    PVector diff = PVector.sub(end, start);
    float dist = diff.mag();
    diff.normalize();
    diff.mult(segLength);
    
    for(float i = t; i<dist/segLength-t; i++)
    {     
        pushMatrix();
          translate(start.x + i*diff.x, start.y + i*diff.y);
          //translate(diff.x*t, diff.y*t);
          line(0,0, 0.5*diff.x, 0.5*diff.y);
        popMatrix();
    }
}

void cam()
{
    pushMatrix();
      translate(cam.x-10, cam.y-30);
      rotate(PI/3);
      
      rect(0,0, 50, 20);
      rect(50, 5, 10, 10);
    popMatrix();
}

void keyPressed()
{
    if(key=='r') setup();
    if(key=='p') play = !play;
    if(key==' ')
    {
        visible[vis] = true;
        if(vis<visible.length-1) vis++;
    }
}
