import java.util.ArrayList;

public class TimeSolt
{
    private ArrayList<Data> dataArray;
    
    private String name;
    
    private int hourMin;
    
    private int hourMax;
    
    TimeSolt(String name, int hourMin, int hourMax)
    {
        this.name = name;
        
        this.hourMin = hourMin;
        
        this.hourMax = hourMax;
        
        this.dataArray = new ArrayList<Data>();
    }
    
    public String getName()
    {
        return this.name;
    }
    
    public int getNbHour()
    {
        return this.hourMax - this.hourMin;
    }
    
    public void addData(Data data)
    {
        this.dataArray.add(data);
    }
    
    public String getAllSwiftCodeOfData()
    {
        String resultat = "";
        for (int i=0;i<this.dataArray.size();i++)
        {
            resultat += this.dataArray.get(i).getSwiftCode();
        }
        return resultat;
    }
    
    public String getCsvCode()
    {
        String resultat = "";
        for (int i=0;i<this.dataArray.size();i++)
        {
            resultat += this.dataArray.get(i).getCsvCode();
        }
        return resultat;
    }
    
    public void setData(int user_id, TimeSolt timeSolt, int pourcentageTempsPasse)
    {
        this.dataArray.clear();
        
        double remainingTime = DataCreator.getRemainingTime(pourcentageTempsPasse, this);
        
        for (int i=0;i<timeSolt.dataArray.size();i++)
        {
            int timeWebSite = DataCreator.getRandomTime(remainingTime);
            remainingTime -= timeWebSite;
            
            Data data = new Data(user_id, timeSolt.dataArray.get(i).getWebSite(), timeSolt.dataArray.get(i).getDayWebSite(), this.hourMin + 1, timeWebSite, timeSolt.dataArray.get(i).getLatitudeWebSite(), timeSolt.dataArray.get(i).getLongitudeWebSite());
            
            this.dataArray.add(data);
            
            if (remainingTime < 1)
            {
                break;
            }
        }
    }
    
}
