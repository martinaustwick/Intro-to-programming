 boolean play = false;
//for animation
float prop;
float propInc = 0.01;
int currentStep, waitCount;
PMatrix2D p;

PVector point, disp;

void setup()
{
    size(500, 500); 
     prop = 0;
     currentStep = 0;
     waitCount = 0;
     disp = new PVector(90, 120);
}

void draw()
{
    background(255);
    strokeWeight(3);
    color c = color(0,200, 200, 30); 
    grid(c);
    
    strokeWeight(1);
    pushMatrix();
      update();
      grid(color(0, 0, 0, 200));
    popMatrix();
    
    p.translate(disp.x, disp.y);
    point = new PVector(p.m02, p.m12);
    stroke(200, 0, 0, 200);
    strokeWeight(2);
    line(0,0, point.x, point.y);
    line(point.x, 0, point.x, point.y);
    line(0,point.y, point.x, point.y);
    text(point.x +","+point.y, point.x + 10, point.y);
}

void basegrid()
{
    //baseline
    strokeWeight(3);
    color c = color(0,200, 200, 100); 
    grid(c);
    strokeWeight(1);
    grid(c);
}

void grid(color c)
{
    noFill();
    stroke(c);
    ellipse(0,0,15,15);
    for(int i =0; i<width; i+=100)
    {
        line(i,0,i,height);
    }
    for(int i =0; i<height; i+=100)
    {
        line(0,i,width,i);
    }
    
    fill(c);
    triangle(30, -10, 50, 0, 30, 10);
    text("x", 20, 10);
    
    triangle(-10, 30, 0, 50, 10, 30);
    text("y", 0, 25);
    
    line(0,0,disp.x, disp.y);
    rect(disp.x, disp.y, 50, 50);

    
}
