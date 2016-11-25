/*
 Cette classe permet de représenter les différents jours
*/

public class Day
{
    private String name;
    
    // Ensemble des créneaux horaires composants le jour
    private TimeSolt[] timeSoltArray;
    
    // Constructeur initialisant les différents attributs de la classe
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
    
    // Ajoute des données de navigation au créneau horaire correspond
    public void addDataForTimeSoltAtIndex(Data data, int index)
    {
        this.timeSoltArray[index].addData(data);
    }
    
    // Cette méthode permet de récupérer le code Swift à intégrer dans le bon fichier du code source de l'application iOS pour y intégrer les données tests
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
    
    // Cette méthode permet de récupérer le texte constituant le fichier .csv utilisé par le script R
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
    
    // Cette méthode permet de définir les données de navigation associées aux différents créneaux horaire
    // Cela signifie que le jour est similaire à un autre jour
    public void setTimeSoltArray(int user_id, TimeSolt[] array, int pourcentageTempsPasse)
    {
        for(int i=0;i<this.timeSoltArray.length;i++)
        {
            this.timeSoltArray[i].setData(user_id, array[i], pourcentageTempsPasse);
        }
    }
    
    // Cette méthode permet de définir les données de navigation associées au créneau horaire considéré
    // Cela signifie que le créneau horaire est similaire à un autre créneau horaire
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
