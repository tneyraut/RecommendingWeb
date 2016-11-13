public class Data
{
    private int user_id;
    private String webSite;
    private int webSite_id;
    private int dayWebSite;
    private int hourWebSite;
    private int timeWebSite;
    private double latitudeWebSite;
    private double longitudeWebSite;
    
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
    
    public String getSwiftCode()
    {
        return "array.addObject([\"" + this.webSite + "\", " + this.dayWebSite + ", " + this.hourWebSite + ", " + this.timeWebSite + ", " + this.latitudeWebSite + ", " + this.longitudeWebSite + "])\n";
    }
    
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
