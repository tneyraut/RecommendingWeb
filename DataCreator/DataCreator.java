import java.io.File;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Random;

public class DataCreator
{
    
    private static String[] webSiteArray = {"http://www.footmercato.net",//0
    "http://9gag.com",//1
    "http://www.polymtl.ca",//2
    "https://moodle.polymtl.ca",//3
    "https://www.imp.polymtl.ca",//4
    "https://webmail.minesdedouai.fr",//5
    "https://mail.google.com",//6
    "http://facebook.com",//7
    "https://dossieretudiant.polymtl.ca",//8
    "http://www.koreus.com",//9
    "https://fr.wikipedia.org",//10
    "https://github.com",//11
    "http://www.groupes.polymtl.ca/log6308/index.php",//12
    "http://www.apple.com",//13
    "https://www.microsoft.com",//14
    "https://twitter.com",//15
    "https://www.jamendo.com",//16
    "https://www.deezer.com",//17
    "http://www.clubic.com",//18
    "http://www.lemonde.fr",//19
    "http://www.lequipe.fr",//20
    "http://www.liberation.fr",//21
    "http://fr.euronews.com",//22
    "http://www.samsung.com"};//23
    
    public static void main(String[] args)
    {
        if (args.length == 0)
        {
            System.out.println("Veuillez fournir en paramètre l'id du profil utilisateur que vous souhaitez générer.");
            return;
        }
        
        try {
            Integer.parseInt(args[0]);
        } catch (NumberFormatException ex) {
            System.out.println("Le paramètre fournit en entrée doit être un entier.");
            return;
        }
        
        if (Integer.parseInt(args[0]) >= UserProfile.getNumberOfProfile() || Integer.parseInt(args[0]) < -2)
        {
            System.out.println("Le profil utilisateur N°" + args[0] + " n'existe pas.");
            return;
        }
        
        if (Integer.parseInt(args[0]) == -1)
        {
            String  s_txt = "";
            
            String separator = ",";
            String s_csv = "user_id" + separator + "webSite_id" + separator + "time(s)" + separator + "day" + separator + "hour" + separator + "latitude" + separator + "longitude\n";
            String i_csv = "webSite_id" + "separator" + "webSite\n";
            for (int j=0;j<UserProfile.getNumberOfProfile();j++)
            {
                Day[] dayArray = getDayArrayForUserId(j);
                
                s_txt += "// New User\n\n";
                
                for (int i=0;i<dayArray.length;i++)
                {
                    s_txt += "// Day : " + dayArray[i].getName() + "\n";
                    s_txt += dayArray[i].getAllSwiftCodeOfTimeSolt();
                    s_txt += "\n\n";
                    
                    s_csv += dayArray[i].getCsvCode();
                }
                s_txt += "\n\n";
            }
            for (int i=0;i<webSiteArray.length;i++)
            {
                i_csv += (i + 1) + separator + webSiteArray[i] + "\n";
            }
            writeInFile(s_txt, "data.txt");
            writeInFile(s_csv, "data.csv");
            writeInFile(i_csv, "item.csv");
        }
        else
        {
            Day[] dayArray = getDayArrayForUserId(Integer.parseInt(args[0]));
            
            String s_txt = "// New User\n\n";
            
            String separator = ",";
            String s_csv = "user_id" + separator + "webSite" + separator + "time" + separator + "day" + separator + "hour" + separator + "latitude" + separator + "longitude\n";
            String i_csv = "webSite_id" + separator + "webSite\n";
            for (int i=0;i<dayArray.length;i++)
            {
                s_txt += "// Day : " + dayArray[i].getName() + "\n";
                s_txt += dayArray[i].getAllSwiftCodeOfTimeSolt();
                s_txt += "\n\n";
                
                s_csv += dayArray[i].getCsvCode();
            }
            s_txt += "\n\n";
            for (int i=0;i<webSiteArray.length;i++)
            {
                i_csv += (i + 1) + separator + webSiteArray[i] + "\n";
            }
            writeInFile(s_txt, "data.txt");
            writeInFile(s_csv, "data.csv");
            writeInFile(i_csv, "item.csv");
        }
    }
    
    private static Day[] getDayArrayForUserId(int id)
    {
        UserProfile userProfile = new UserProfile(id);
        
        int nbWebSiteVisited = userProfile.getNbWebSiteVisited();
        
        int pourcentageTempsPasse = userProfile.getPourcentageTempsPasse();
        
        // 0h-5h 5h-9h 9h-12h 12h-14h 14h-19h 19h-24h
        int[][] maxNbWebSiteVisitedDuringDayTimeSolt = userProfile.getMaxNbWebSiteVisitedDuringDayTimeSolt();
        
        // lundi à Dimanche => de 0 à 6
        // [jour N°...][sérieDeTimeSolt N°...][les timeSolt similaires]
        int[][] daySimilarArray = userProfile.getDaySimilarArray();
        
        // timeSolt de 0 à 5
        // [sérieDeDay N°...][day similaires]
        int[][][] timeSoltSimilarArray = userProfile.getTimeSoltSimilarArray();
        
        double[][] positionArray = {{45.496, -73.617}, {45.505, -73.613}};
        
        int[] timeSoltMinHour = {0, 5, 9, 12, 14, 19};
        
        String[] webSiteVisitedArray = new String[nbWebSiteVisited];
        for (int i=0;i<webSiteVisitedArray.length;i++)
        {
            Random random = new Random();
            
            String s = webSiteArray[random.nextInt(webSiteArray.length)];
            
            while (webSiteAlreadyChose(s, webSiteVisitedArray))
            {
                s = webSiteArray[random.nextInt(webSiteArray.length)];
            }
            webSiteVisitedArray[i] = s;
        }
        
        String[] dayNameArray = {"Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche"};
        
        Day[] dayArray = new Day[7];
        
        for (int i=0;i<dayArray.length;i++)
        {
            Day day = new Day(dayNameArray[i]);
            
            for (int j=0;j<day.getNumberOfTimeSolt();j++)
            {
                if (maxNbWebSiteVisitedDuringDayTimeSolt[i][j] != 0)
                {
                    int numberOfWebSiteVisited = getRandomNumber(maxNbWebSiteVisitedDuringDayTimeSolt[i][j]);
                    
                    double remainingTime = getRemainingTime(pourcentageTempsPasse, day.getTimeSoltAtIndex(j));
                    
                    String[] array = new String[numberOfWebSiteVisited];
                    
                    for (int k=0;k<numberOfWebSiteVisited;k++)
                    {
                        int index = getRandomNumber(webSiteVisitedArray.length);
                        while (webSiteAlreadyChose(webSiteVisitedArray[index], array))
                        {
                            index = getRandomNumber(webSiteVisitedArray.length);
                        }
                        String webSite = webSiteVisitedArray[index];
                        array[k] = webSiteVisitedArray[index];
                        
                        int dayWebSite = i + 1;
                        int hourWebSite = timeSoltMinHour[j] + 1;
                        
                        int timeWebSite = getRandomTime(remainingTime);
                        remainingTime -= timeWebSite;
                        
                        int indice = getRandomNumber(positionArray.length);
                        double latitudeWebSite = positionArray[indice][0];
                        double longitudeWebSite = positionArray[indice][1];
                        
                        Data data = new Data(id, webSite, index, dayWebSite, hourWebSite, timeWebSite, latitudeWebSite, longitudeWebSite);
                        
                        day.addDataForTimeSoltAtIndex(data, j);
                        
                        if (remainingTime < 1)
                        {
                            break;
                        }
                    }
                }
            }
            dayArray[i] = day;
        }
        
        for(int i=0;i<daySimilarArray.length;i++)
        {
            if (daySimilarArray[i].length != 0)
            {
                Day day = dayArray[daySimilarArray[i][0]];
                for (int j=1;j<daySimilarArray[i].length;j++)
                {
                    Day d = dayArray[daySimilarArray[i][j]];
                    d.setTimeSoltArray(id, day.getTimeSoltArray(), pourcentageTempsPasse);
                }
            }
        }
        
        for (int i=0;i<timeSoltSimilarArray.length;i++)
        {
            for(int j=0;j<timeSoltSimilarArray[i].length;j++)
            {
                if (timeSoltSimilarArray[i][j].length != 0)
                {
                    Day day = dayArray[i];
                    TimeSolt timeSolt = day.getTimeSoltAtIndex(timeSoltSimilarArray[i][j][0]);
                    for (int k=1;k<timeSoltSimilarArray[i][j].length;k++)
                    {
                        day.setTimeSoltAtIndex(id, timeSoltSimilarArray[i][j][k], timeSolt, pourcentageTempsPasse);
                    }
                }
            }
        }
        return dayArray;
    }
    
    public static int getRandomTime(double max)
    {
        Random random = new Random();
        
        int result = random.nextInt(61) * 60 + random.nextInt(60);
        
        while (max < result)
        {
            result = random.nextInt(61) * 60 + random.nextInt(60);
        }
        return result;
    }
    
    private static int getRandomNumber(int max)
    {
        Random random = new Random();
        
        return random.nextInt(max);
    }
    
    public static double getRemainingTime(int maxPourcentage, TimeSolt timeSolt)
    {
        Random random = new Random();
        
        int min = maxPourcentage - 25 * maxPourcentage / 100;
        
        int pourcentage = random.nextInt(maxPourcentage - min + 1) + min;
        
        return timeSolt.getNbHour() * 60 * 60 * pourcentage / 100;
    }
    
    private static boolean webSiteAlreadyChose(String webSite, String[] webSiteVisitedArray)
    {
        for (int i=0;i<webSiteVisitedArray.length;i++)
        {
            if (webSite == webSiteVisitedArray[i])
            {
                return true;
            }
        }
        return false;
    }
    
    private static void writeInFile(String s, String name)
    {
        BufferedWriter writer = null;
        try {
            writer = new BufferedWriter(new FileWriter(new File(name)));
            
            writer.write(s);
            
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                writer.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
    
}
