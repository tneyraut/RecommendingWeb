/*
 Cette classe définie les données de navigation enregistrées par l'application iOS et exploitable par celle-ci ou par le script R
*/

public class Data
{
    private int user_id;
    
    // Données définissant le site visité et pendant combien de temps
    private int webSite_id;
    private String webSite;
    private int timeWebSite;
    
    // Données du contexte de la visite (jour, heure et lieu de la visite)
    private int dayWebSite;
    private int hourWebSite;
    private double latitudeWebSite;
    private double longitudeWebSite;
    
    // Constructeur pour initialiser les attributs de la classe
    Data(int user_id, String webSite, int webSite_id, int dayWebSite, int hourWebSite, int timeWebSite, double latitudeWebSite, double longitudeWebSite)
    {
        this.user_id = user_id;
        this.webSite = webSite;
        this.webSite_id = webSite_id;
        this.dayWebSite = dayWebSite;
        this.hourWebSite = hourWebSite;
        this.timeWebSite = timeWebSite;
        this.latitudeWebSite = latitudeWebSite;
        this.longitudeWebSite = longitudeWebSite;
    }
    
    // Cette méthode permet de récupérer le code Swift à intégrer dans le bon fichier du code source de l'application iOS pour y intégrer les données tests
    public String getSwiftCode()
    {
        return "array.addObject([\"" + this.webSite + "\", " + this.dayWebSite + ", " + this.hourWebSite + ", " + this.timeWebSite + ", " + this.latitudeWebSite + ", " + this.longitudeWebSite + "])\n";
    }
    
    // Cette méthode permet de récupérer le texte constituant le fichier .csv utilisé par le script R
    public String getCsvCode()
    {
        String separator = ",";
        return (this.user_id + 1) + separator + (this.webSite_id+1) + separator + this.timeWebSite + separator + this.dayWebSite + separator + this.hourWebSite + separator + this.latitudeWebSite + separator + this.longitudeWebSite + "\n";
    }
    
    public String getWebSite()
    {
        return this.webSite;
    }
    
    public int getWebSiteId()
    {
        return this.webSite_id;
    }
    
    public int getDayWebSite()
    {
        return this.dayWebSite;
    }
    
    public int getHourWebSite()
    {
        return this.hourWebSite;
    }
    
    public int getTimeWebSite()
    {
        return this.timeWebSite;
    }
    
    public double getLatitudeWebSite()
    {
        return this.latitudeWebSite;
    }
    
    public double getLongitudeWebSite()
    {
        return this.longitudeWebSite;
    }
    
}
