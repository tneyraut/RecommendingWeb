import java.util.ArrayList;

/*
 Cette classe permet de représenter les différents créneaux horaires
*/

public class TimeSolt
{
    // Données des navigations effectuées pendant le créneau horaire
    private ArrayList<Data> dataArray;
    
    private String name;
    
    private int hourMin;
    
    private int hourMax;
    
    // Constructeur initialisant les différents attributs de la classe
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
    
    // Ajout de données de navigation
    public void addData(Data data)
    {
        this.dataArray.add(data);
    }
    
    // Cette méthode permet de récupérer le code Swift à intégrer dans le bon fichier du code source de l'application iOS pour y intégrer les données tests
    public String getAllSwiftCodeOfData()
    {
        String resultat = "";
        for (int i=0;i<this.dataArray.size();i++)
        {
            resultat += this.dataArray.get(i).getSwiftCode();
        }
        return resultat;
    }
    
    // Cette méthode permet de récupérer le texte constituant le fichier .csv utilisé par le script R
    public String getCsvCode()
    {
        String resultat = "";
        for (int i=0;i<this.dataArray.size();i++)
        {
            resultat += this.dataArray.get(i).getCsvCode();
        }
        return resultat;
    }
    
    // Cette méthode permet supprimer toutes les données de navigation du créneau horaire et d'en ajouter de nouvelles correspondantes à celles d'un autre créneau horaire
    // Cela signifie que le créneau horaire est similaire à un autre créneau horaire
    public void setData(int user_id, TimeSolt timeSolt, int pourcentageTempsPasse)
    {
        this.dataArray.clear();
        
        double remainingTime = DataCreator.getRemainingTime(pourcentageTempsPasse, this);
        
        for (int i=0;i<timeSolt.dataArray.size();i++)
        {
            int timeWebSite = DataCreator.getRandomTime(remainingTime);
            remainingTime -= timeWebSite;
            
            Data data = new Data(user_id, timeSolt.dataArray.get(i).getWebSite(), timeSolt.dataArray.get(i).getWebSiteId(), timeSolt.dataArray.get(i).getDayWebSite(), this.hourMin + 1, timeWebSite, timeSolt.dataArray.get(i).getLatitudeWebSite(), timeSolt.dataArray.get(i).getLongitudeWebSite());
            
            this.dataArray.add(data);
            
            if (remainingTime < 1)
            {
                break;
            }
        }
    }
    
}
