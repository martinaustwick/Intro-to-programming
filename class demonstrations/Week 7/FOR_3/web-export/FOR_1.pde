void setup()
{
    size(500, 500);
    
}

void draw()
{
    background(255);
    grid();
}

void grid()
{
    for(int i =0; i<width; i+=50)
    {
        line(i,0,i,height);
    }
    for(int i =0; i<height; i+=50)
    {
        line(0,i,width,i);
    }
}

