public class Day
{
    private String name;
    
    private TimeSolt[] timeSoltArray;
    
    Day(String name)
    {
        this.name = name;
        
        this.timeSoltArray = new TimeSolt[6];
        
        int[] timeSoltMinHourArray = {0, 5, 9, 12, 14, 19};
        int[] timeSoltMaxHourArray = {5, 9, 12, 14, 19, 24};
        
        for (int i=0;i<this.timeSoltArray.length;i++)
        {
            TimeSolt timeSolt = new TimeSolt(timeSoltMinHourArray[i] + "h - " + timeSoltMaxHourArray[i] + "h", timeSoltMinHourArray[i], timeSoltMaxHourArray[i]);
            
            this.timeSoltArray[i] = timeSolt;
        }
    }
    
    public String getName()
    {
        return this.name;
    }
    
    public void addDataForTimeSoltAtIndex(Data data, int index)
    {
        this.timeSoltArray[index].addData(data);
    }
    
    public String getAllSwiftCodeOfTimeSolt()
    {
        String resultat = "";
        for (int i=0;i<this.timeSoltArray.length;i++)
        {
            resultat += "// TimeSolt : " + timeSoltArray[i].getName() + "\n";
            resultat += this.timeSoltArray[i].getAllSwiftCodeOfData();
            resultat += "\n";
        }
        return resultat;
    }
    
    public String getCsvCode()
    {
        String resultat = "";
        for (int i=0;i<this.timeSoltArray.length;i++)
        {
            resultat += this.timeSoltArray[i].getCsvCode();
        }
        return resultat;
    }
    
    public int getNumberOfTimeSolt()
    {
        return this.timeSoltArray.length;
    }
    
    public void setTimeSoltArray(int user_id, TimeSolt[] array, int pourcentageTempsPasse)
    {
        for(int i=0;i<this.timeSoltArray.length;i++)
        {
            this.timeSoltArray[i].setData(user_id, array[i], pourcentageTempsPasse);
        }
    }
    
    public void setTimeSoltAtIndex(int user_id, int index, TimeSolt timeSolt, int pourcentageTempsPasse)
    {
        this.timeSoltArray[index].setData(user_id, timeSolt, pourcentageTempsPasse);
    }
    
    public TimeSolt[] getTimeSoltArray()
    {
        return this.timeSoltArray;
    }
    
    public TimeSolt getTimeSoltAtIndex(int index)
    {
        return this.timeSoltArray[index];
    }
    
}
