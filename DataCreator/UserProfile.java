import java.util.Random;

/* 
 Cette classe permet de définir différents profils d'utilisateur
 
 Un profil d'utilisateur est défini par :
 - un nombre de sites web visités (int nbWebSiteVisited),
 - un pourcentage de temps passé sur le web (int pourcentageTempsPasse),
 - pour chaque créneau horaire de chaque jour, un nombre maximum de sites web visités (tableau maxNbWebSiteVisitedDuringDayTimeSolt),
 - les jours pour lesquels la navigation web de l'utilisateur est la même (tableau daySimilarArray),
 - les créneaux de chaque jour pour lesquels la navigation web de l'utilisateur est la même (tableau timeSoltSimilarArray).
*/

public class UserProfile
{
    private static int numberOfProfile = 6;
    
    private int nbWebSiteVisited;
    
    private int pourcentageTempsPasse;
    
    private int[][] maxNbWebSiteVisitedDuringDayTimeSolt;
    
    private int[][] daySimilarArray;
    
    private int[][][] timeSoltSimilarArray;
    
    // Constructeur pour définir les différents attributs de la classe selon le profil utilisateur considéré
    UserProfile(int id)
    {
        if (id == 0)
        {
            this.setProfileDataForUser0();
        }
        else if (id == 1)
        {
            this.setProfileDataForUser1();
        }
        else if (id == 2)
        {
            this.setProfileDataForUser2();
        }
        else if (id == 3)
        {
            this.setProfileDataForUser3();
        }
        else if (id == 4)
        {
            this.setProfileDataForUser4();
        }
        else if (id == 5)
        {
            this.setProfileDataForUser5();
        }
        this.randomUser();
    }
    
    // regarde au max 10 sites web ; comportement unique au cours de la semaine ; comportement unique le week-end ; passe du temps sur le web
    private void setProfileDataForUser0()
    {
        this.nbWebSiteVisited = 10;
        
        this.pourcentageTempsPasse = 85;
        
        // 0h-5h 5h-9h 9h-12h 12h-14h 14h-19h 19h-24h
        // < nbWebSiteVisited
        int[][] array = {
            {0, 4, 6, 2, 10, 7},
            {0, 4, 6, 2, 10, 7},
            {0, 4, 6, 2, 10, 7},
            {0, 4, 6, 2, 10, 7},
            {0, 4, 6, 2, 10, 7},
            {0, 0, 3, 0, 7, 2},
            {0, 0, 3, 0, 7, 2}
        };
        this.maxNbWebSiteVisitedDuringDayTimeSolt = array;
        
        // lundi à Dimanche => de 0 à 6
        // [sérieDeDay N°...][day similaires]
        int[][] tab = { {0,1,2,3,4}, {5,6} };
        this.daySimilarArray = tab;
        
        // timeSolt de 0 à 5
        // [jour N°...][sérieDeTimeSolt N°...][les timeSolt similaires]
        this.timeSoltSimilarArray = new int[0][0][0];
    }
    
    // passe peu de temps sur le web ; sur le web surtout la semaine et peu le week-end ; comportement un chaotique au cours de la semaine
    private void setProfileDataForUser1()
    {
        this.nbWebSiteVisited = 20;
        
        this.pourcentageTempsPasse = 25;
        
        // 0h-5h 5h-9h 9h-12h 12h-14h 14h-19h 19h-24h
        int[][] array = {
            {0, 6, 8, 10, 17, 19},
            {0, 2, 9, 11, 15, 1},
            {0, 6, 8, 10, 17, 19},
            {0, 5, 17, 7, 14, 6},
            {0, 9, 8, 8, 15, 18},
            {0, 0, 3, 0, 2, 0},
            {0, 0, 3, 0, 2, 0}
        };
        this.maxNbWebSiteVisitedDuringDayTimeSolt = array;
        
        this.daySimilarArray = new int[0][0];

        int[][][] t = {
            { {2,4}, {1,5} },
            { {2,4}, {1,5} },
            { {2,4}, {1,5} },
            { {2,4}, {1,5} },
            { {2,4}, {1,5} },
            { {2,4} },
            { {2,4} }
        };
        this.timeSoltSimilarArray = t;
    }
    
    // ce profil représente mon activité ; toujours le même comportement ; peu de site web et peu de temps
    private void setProfileDataForUser2()
    {
        this.nbWebSiteVisited = 7;
        
        this.pourcentageTempsPasse = 10;
        
        // 0h-5h 5h-9h 9h-12h 12h-14h 14h-19h 19h-24h
        int[][] array = {
            {0, 7, 7, 7, 7, 0},
            {0, 7, 7, 7, 7, 0},
            {0, 7, 7, 7, 7, 0},
            {0, 7, 7, 7, 7, 0},
            {0, 7, 7, 7, 7, 0},
            {0, 7, 7, 7, 7, 0},
            {0, 7, 7, 7, 7, 0}
        };
        this.maxNbWebSiteVisitedDuringDayTimeSolt = array;
        
        this.daySimilarArray = new int[0][0];
        
        this.timeSoltSimilarArray = new int[0][0][0];
    }
    
    // va sur le web uniquement le week-end
    private void setProfileDataForUser3()
    {
        this.nbWebSiteVisited = 9;
        
        this.pourcentageTempsPasse = 90;
        
        // 0h-5h 5h-9h 9h-12h 12h-14h 14h-19h 19h-24h
        int[][] array = {
            {0, 0, 0, 0, 0, 0},
            {0, 0, 0, 0, 0, 0},
            {0, 0, 0, 0, 0, 0},
            {0, 0, 0, 0, 0, 0},
            {0, 0, 0, 0, 0, 0},
            {0, 0, 6, 3, 9, 3},
            {0, 0, 6, 3, 9, 3}
        };
        this.maxNbWebSiteVisitedDuringDayTimeSolt = array;
        
        this.daySimilarArray = new int[0][0];
        
        this.timeSoltSimilarArray = new int[0][0][0];
    }
    
    // passe sa vie sur le web
    private void setProfileDataForUser4()
    {
        this.nbWebSiteVisited = 23;
        
        this.pourcentageTempsPasse = 100;
        
        // 0h-5h 5h-9h 9h-12h 12h-14h 14h-19h 19h-24h
        int[][] array = {
            {23, 15, 0, 0, 20, 23},
            {23, 15, 0, 0, 20, 23},
            {23, 15, 0, 0, 20, 23},
            {23, 15, 0, 0, 20, 23},
            {23, 15, 0, 0, 20, 23},
            {23, 15, 0, 0, 20, 23},
            {23, 15, 0, 0, 20, 23}
        };
        this.maxNbWebSiteVisitedDuringDayTimeSolt = array;
        
        this.daySimilarArray = new int[0][0];
        
        this.timeSoltSimilarArray = new int[0][0][0];
    }
    
    // comportement totalement chaotique
    private void setProfileDataForUser5()
    {
        this.nbWebSiteVisited = 21;
        
        this.pourcentageTempsPasse = 70;
        
        Random rand = new Random();
        
        // 0h-5h 5h-9h 9h-12h 12h-14h 14h-19h 19h-24h
        int[][] array = {
            {rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited)},
            {rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited)},
            {rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited)},
            {rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited)},
            {rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited)},
            {rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited)},
            {rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited)}
        };
        this.maxNbWebSiteVisitedDuringDayTimeSolt = array;
        
        this.daySimilarArray = new int[0][0];
        
        this.timeSoltSimilarArray = new int[0][0][0];
    }
    
    // Profil d'utilisateur totalement aléatoire : profil le plus utilisé dans la génération de données
    private void randomUser()
    {
        Random rand = new Random();
        
        this.nbWebSiteVisited = rand.nextInt(31) + 10;
        
        this.pourcentageTempsPasse = rand.nextInt(76) + 10;
        
        int[][] array1 = {
            {rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited)},
            {rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited)},
            {rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited)},
            {rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited)},
            {rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited)},
            {rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited)},
            {rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited), rand.nextInt(this.nbWebSiteVisited)}
        };
        this.maxNbWebSiteVisitedDuringDayTimeSolt = array1;
        
        int nbGroupe = rand.nextInt(4);
        int[] tailleGroupe = new int[nbGroupe];
        int max = 0;
        for (int i=0;i<nbGroupe;i++)
        {
            tailleGroupe[i] = rand.nextInt(6) + 2;
            if (max < tailleGroupe[i])
            {
                max = tailleGroupe[i];
            }
        }
        int[][] array2 = new int[nbGroupe][max];
        for (int i=0;i<nbGroupe;i++)
        {
            for (int j=0;j<max;j++)
            {
                if (j < tailleGroupe[i])
                {
                    array2[i][j] = rand.nextInt(7);
                }
                else
                {
                    array2[i][j] = -1;
                }
            }
        }
        this.daySimilarArray = array2;
        
        int[][] tailleGroupes = new int[7][3];
        for (int i=0;i<7;i++)
        {
            nbGroupe = rand.nextInt(4);
            for (int j=0;j<nbGroupe;j++)
            {
                tailleGroupes[i][j] = rand.nextInt(6);
            }
        }
        int[][][] array3 = new int[7][3][6];
        for (int i=0;i<7;i++)
        {
            for (int j=0;j<3;j++)
            {
                for (int k=0;k<6;k++)
                {
                    if (k < tailleGroupes[i][j])
                    {
                        array3[i][j][k] = rand.nextInt(6);
                    }
                    else
                    {
                        array3[i][j][k] = -1;
                    }
                }
            }
        }
        this.timeSoltSimilarArray = array3;
    }
    
    public int getNbWebSiteVisited()
    {
        return this.nbWebSiteVisited;
    }
    
    public int getPourcentageTempsPasse()
    {
        return this.pourcentageTempsPasse;
    }
    
    public int[][] getMaxNbWebSiteVisitedDuringDayTimeSolt()
    {
        return this.maxNbWebSiteVisitedDuringDayTimeSolt;
    }
    
    public int[][] getDaySimilarArray()
    {
        return this.daySimilarArray;
    }
    
    public int[][][] getTimeSoltSimilarArray()
    {
        return this.timeSoltSimilarArray;
    }
    
    public static int getNumberOfProfile()
    {
        return numberOfProfile;
    }
    
}
