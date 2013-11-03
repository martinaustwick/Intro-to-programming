void setup()
{  
    loadData();
}

void loadData()
{
    String [] sData = loadStrings("buses2.csv");
    for(int i = 1; i<sData.length; i++)
    {
        String [] thisRow = split(sData[i], ",");
        println(thisRow);
    }  
  
}
