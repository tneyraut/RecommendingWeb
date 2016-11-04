//
//  UserData.swift
//  RecommendingWeb
//
//  Created by Thomas Mac on 28/10/2016.
//  Copyright © 2016 ThomasNeyraut. All rights reserved.
//

import UIKit

class UserData: NSObject {

    // cet utilisateur ne surfe sur le web uniquement durant son travail pour voir ses mails 4,5,6
    // son facebook, twitter, des news 7,15,0,22 durant sa pause de midi
    // cet utilisateur fait toujours la même chose les jours de la semaine aux mêmes heures
    internal static func getDataArrayForUser1() -> NSArray
    {
        let array = NSMutableArray()
        
        var day = 1
        while (day < 6)
        {
            //[webSite, dayWebSite, hourWebSite, timeWebSite, latitudeWebSite, longitudeWebSite]
            
            array.addObject(["https://www.imp.polymtl.ca", day, 9, 2 * 60, 45.496, -73.617])
            array.addObject(["https://webmail.minesdedouai.fr", day, 10, 10 * 60, 45.496, -73.617])
            array.addObject(["https://mail.google.com", day, 11, 30 * 60, 45.496, -73.617])
            
            array.addObject(["https://www.imp.polymtl.ca", day, 14, 3 * 60, 45.496, -73.617])
            array.addObject(["https://webmail.minesdedouai.fr", day, 14, 5 * 60, 45.496, -73.617])
            array.addObject(["https://mail.google.com", day, 14, 30 * 60, 45.496, -73.617])
            
            array.addObject(["http://facebook.com", day, 12, 60 * 60, 45.496, -73.617])
            array.addObject(["https://twitter.com", day, 12, 10 * 60, 45.496, -73.617])
            array.addObject(["http://www.footmercato.net", day, 12, 20 * 60, 45.496, -73.617])
            array.addObject(["http://fr.euronews.com", day, 12, 30 * 60, 45.496, -73.617])
            
            day += 1
        }
        return array
    }
    
    // un utilisateur qui est totalement random utilisateur mystère ^^
    // un utilisateur qui regarde des choses très varié en fonction de la journée
    
    internal static func getDataArrayForUser2() -> NSArray
    {
        let array = NSMutableArray()
        
        // Day : Lundi
        // TimeSolt : 0h - 5h
        array.addObject(["https://www.imp.polymtl.ca", 1, 1, 816, 45.505, -73.613])
        array.addObject(["http://www.groupes.polymtl.ca/log6308/index.php", 1, 1, 689, 45.496, -73.617])
        array.addObject(["https://mail.google.com", 1, 1, 3493, 45.505, -73.613])
        array.addObject(["https://fr.wikipedia.org", 1, 1, 318, 45.505, -73.613])
        array.addObject(["http://www.lemonde.fr", 1, 1, 3402, 45.496, -73.617])
        array.addObject(["http://9gag.com", 1, 1, 3367, 45.505, -73.613])
        array.addObject(["https://www.youtube.com", 1, 1, 1781, 45.496, -73.617])
        array.addObject(["https://www.deezer.com", 1, 1, 2438, 45.505, -73.613])
        
        // TimeSolt : 5h - 9h
        array.addObject(["https://mail.google.com", 1, 6, 1139, 45.505, -73.613])
        array.addObject(["https://www.imp.polymtl.ca", 1, 6, 1054, 45.496, -73.617])
        array.addObject(["http://www.footmercato.net", 1, 6, 2110, 45.505, -73.613])
        array.addObject(["https://github.com", 1, 6, 3315, 45.496, -73.617])
        
        // TimeSolt : 9h - 12h
        array.addObject(["http://www.clubic.com", 1, 10, 254, 45.505, -73.613])
        array.addObject(["http://www.polymtl.ca", 1, 10, 1092, 45.505, -73.613])
        array.addObject(["http://www.clubic.com", 1, 10, 1393, 45.505, -73.613])
        array.addObject(["http://www.groupes.polymtl.ca/log6308/index.php", 1, 10, 2899, 45.505, -73.613])
        array.addObject(["https://github.com", 1, 10, 2728, 45.496, -73.617])
        array.addObject(["https://github.com", 1, 10, 1742, 45.505, -73.613])
        array.addObject(["http://www.lemonde.fr", 1, 10, 1238, 45.505, -73.613])
        array.addObject(["https://fr.wikipedia.org", 1, 10, 1367, 45.496, -73.617])
        array.addObject(["https://www.deezer.com", 1, 10, 264, 45.505, -73.613])
        array.addObject(["https://fr.wikipedia.org", 1, 10, 3612, 45.496, -73.617])
        array.addObject(["http://fr.euronews.com", 1, 10, 1395, 45.505, -73.613])
        array.addObject(["http://www.samsung.com", 1, 10, 2923, 45.496, -73.617])
        array.addObject(["http://www.samsung.com", 1, 10, 1733, 45.496, -73.617])
        array.addObject(["https://github.com", 1, 10, 2588, 45.505, -73.613])
        array.addObject(["https://github.com", 1, 10, 3615, 45.505, -73.613])
        
        // TimeSolt : 12h - 14h
        array.addObject(["https://github.com", 1, 13, 1706, 45.505, -73.613])
        
        // TimeSolt : 14h - 19h
        array.addObject(["http://www.footmercato.net", 1, 15, 1045, 45.505, -73.613])
        
        // TimeSolt : 19h - 24h
        array.addObject(["http://www.clubic.com", 1, 20, 3133, 45.505, -73.613])
        array.addObject(["http://www.apple.com", 1, 20, 2977, 45.505, -73.613])
        array.addObject(["https://www.youtube.com", 1, 20, 1544, 45.505, -73.613])
        array.addObject(["https://github.com", 1, 20, 1928, 45.505, -73.613])
        array.addObject(["http://fr.euronews.com", 1, 20, 385, 45.496, -73.617])
        
        
        
        // Day : Mardi
        // TimeSolt : 0h - 5h
        array.addObject(["http://www.lemonde.fr", 2, 1, 754, 45.505, -73.613])
        array.addObject(["https://www.microsoft.com", 2, 1, 1333, 45.496, -73.617])
        array.addObject(["http://www.lemonde.fr", 2, 1, 763, 45.496, -73.617])
        array.addObject(["https://www.jamendo.com", 2, 1, 948, 45.505, -73.613])
        array.addObject(["http://www.apple.com", 2, 1, 3114, 45.505, -73.613])
        array.addObject(["http://www.apple.com", 2, 1, 3026, 45.505, -73.613])
        
        // TimeSolt : 5h - 9h
        array.addObject(["https://www.youtube.com", 2, 6, 2549, 45.496, -73.617])
        array.addObject(["https://dossieretudiant.polymtl.ca", 2, 6, 2713, 45.505, -73.613])
        array.addObject(["http://www.lequipe.fr", 2, 6, 1132, 45.496, -73.617])
        array.addObject(["https://www.microsoft.com", 2, 6, 3156, 45.505, -73.613])
        array.addObject(["http://www.footmercato.net", 2, 6, 1119, 45.496, -73.617])
        array.addObject(["https://www.jamendo.com", 2, 6, 3093, 45.505, -73.613])
        array.addObject(["http://www.groupes.polymtl.ca/log6308/index.php", 2, 6, 1758, 45.505, -73.613])
        array.addObject(["https://twitter.com", 2, 6, 1365, 45.496, -73.617])
        array.addObject(["http://www.groupes.polymtl.ca/log6308/index.php", 2, 6, 1254, 45.505, -73.613])
        array.addObject(["http://www.liberation.fr", 2, 6, 2050, 45.496, -73.617])
        array.addObject(["https://github.com", 2, 6, 2055, 45.496, -73.617])
        array.addObject(["https://dossieretudiant.polymtl.ca", 2, 6, 2312, 45.505, -73.613])
        array.addObject(["http://www.lemonde.fr", 2, 6, 3210, 45.505, -73.613])
        
        // TimeSolt : 9h - 12h
        
        // TimeSolt : 12h - 14h
        array.addObject(["http://www.clubic.com", 2, 13, 2135, 45.496, -73.617])
        array.addObject(["http://www.liberation.fr", 2, 13, 553, 45.505, -73.613])
        array.addObject(["https://moodle.polymtl.ca", 2, 13, 164, 45.496, -73.617])
        array.addObject(["http://www.groupes.polymtl.ca/log6308/index.php", 2, 13, 887, 45.496, -73.617])
        array.addObject(["https://www.microsoft.com", 2, 13, 214, 45.496, -73.617])
        array.addObject(["http://facebook.com", 2, 13, 2421, 45.496, -73.617])
        array.addObject(["https://www.microsoft.com", 2, 13, 182, 45.505, -73.613])
        array.addObject(["https://www.imp.polymtl.ca", 2, 13, 140, 45.505, -73.613])
        array.addObject(["http://www.polymtl.ca", 2, 13, 945, 45.505, -73.613])
        array.addObject(["http://www.liberation.fr", 2, 13, 144, 45.505, -73.613])
        
        // TimeSolt : 14h - 19h
        array.addObject(["http://www.liberation.fr", 2, 15, 1996, 45.505, -73.613])
        array.addObject(["https://www.microsoft.com", 2, 15, 3493, 45.505, -73.613])
        array.addObject(["https://www.deezer.com", 2, 15, 772, 45.496, -73.617])
        array.addObject(["https://www.youtube.com", 2, 15, 3523, 45.496, -73.617])
        array.addObject(["http://www.apple.com", 2, 15, 2003, 45.505, -73.613])
        array.addObject(["https://www.deezer.com", 2, 15, 2981, 45.496, -73.617])
        array.addObject(["https://www.youtube.com", 2, 15, 825, 45.505, -73.613])
        array.addObject(["https://www.imp.polymtl.ca", 2, 15, 552, 45.505, -73.613])
        array.addObject(["https://www.deezer.com", 2, 15, 1535, 45.496, -73.617])
        array.addObject(["http://www.polymtl.ca", 2, 15, 3535, 45.496, -73.617])
        array.addObject(["https://fr.wikipedia.org", 2, 15, 1816, 45.496, -73.617])
        
        // TimeSolt : 19h - 24h
        array.addObject(["https://twitter.com", 2, 20, 3265, 45.496, -73.617])
        array.addObject(["http://fr.euronews.com", 2, 20, 0, 45.496, -73.617])
        array.addObject(["https://www.deezer.com", 2, 20, 2498, 45.496, -73.617])
        array.addObject(["https://dossieretudiant.polymtl.ca", 2, 20, 2454, 45.505, -73.613])
        array.addObject(["https://fr.wikipedia.org", 2, 20, 2162, 45.496, -73.617])
        array.addObject(["http://www.polymtl.ca", 2, 20, 2094, 45.505, -73.613])
        array.addObject(["http://facebook.com", 2, 20, 3078, 45.505, -73.613])
        
        
        
        // Day : Mercredi
        // TimeSolt : 0h - 5h
        array.addObject(["https://github.com", 3, 1, 3048, 45.496, -73.617])
        array.addObject(["http://www.lequipe.fr", 3, 1, 3535, 45.496, -73.617])
        array.addObject(["https://www.jamendo.com", 3, 1, 2044, 45.505, -73.613])
        array.addObject(["http://fr.euronews.com", 3, 1, 2951, 45.505, -73.613])
        array.addObject(["http://facebook.com", 3, 1, 3024, 45.505, -73.613])
        array.addObject(["https://moodle.polymtl.ca", 3, 1, 3207, 45.505, -73.613])
        array.addObject(["https://www.imp.polymtl.ca", 3, 1, 1663, 45.496, -73.617])
        
        // TimeSolt : 5h - 9h
        array.addObject(["http://www.apple.com", 3, 6, 738, 45.496, -73.617])
        array.addObject(["https://webmail.minesdedouai.fr", 3, 6, 1269, 45.496, -73.617])
        array.addObject(["http://www.footmercato.net", 3, 6, 546, 45.505, -73.613])
        array.addObject(["https://www.microsoft.com", 3, 6, 458, 45.505, -73.613])
        array.addObject(["https://moodle.polymtl.ca", 3, 6, 1686, 45.505, -73.613])
        array.addObject(["http://9gag.com", 3, 6, 106, 45.505, -73.613])
        array.addObject(["https://mail.google.com", 3, 6, 2099, 45.505, -73.613])
        array.addObject(["https://fr.wikipedia.org", 3, 6, 847, 45.505, -73.613])
        array.addObject(["https://www.deezer.com", 3, 6, 2436, 45.505, -73.613])
        array.addObject(["http://www.polymtl.ca", 3, 6, 1948, 45.505, -73.613])
        array.addObject(["https://mail.google.com", 3, 6, 346, 45.496, -73.617])
        array.addObject(["https://dossieretudiant.polymtl.ca", 3, 6, 437, 45.496, -73.617])
        array.addObject(["https://www.imp.polymtl.ca", 3, 6, 3602, 45.496, -73.617])
        
        // TimeSolt : 9h - 12h
        array.addObject(["https://moodle.polymtl.ca", 3, 10, 549, 45.505, -73.613])
        array.addObject(["http://www.footmercato.net", 3, 10, 2075, 45.505, -73.613])
        array.addObject(["https://fr.wikipedia.org", 3, 10, 751, 45.496, -73.617])
        array.addObject(["https://www.youtube.com", 3, 10, 3262, 45.505, -73.613])
        array.addObject(["https://www.microsoft.com", 3, 10, 818, 45.505, -73.613])
        array.addObject(["http://www.samsung.com", 3, 10, 2204, 45.505, -73.613])
        array.addObject(["http://www.lemonde.fr", 3, 10, 1367, 45.505, -73.613])
        array.addObject(["http://www.clubic.com", 3, 10, 2830, 45.496, -73.617])
        array.addObject(["http://facebook.com", 3, 10, 756, 45.505, -73.613])
        array.addObject(["http://www.clubic.com", 3, 10, 838, 45.496, -73.617])
        array.addObject(["https://fr.wikipedia.org", 3, 10, 2513, 45.505, -73.613])
        array.addObject(["http://www.liberation.fr", 3, 10, 1189, 45.505, -73.613])
        array.addObject(["http://facebook.com", 3, 10, 3326, 45.505, -73.613])
        
        // TimeSolt : 12h - 14h
        array.addObject(["http://www.apple.com", 3, 13, 80, 45.496, -73.617])
        array.addObject(["http://fr.euronews.com", 3, 13, 1403, 45.496, -73.617])
        array.addObject(["https://www.imp.polymtl.ca", 3, 13, 3630, 45.505, -73.613])
        array.addObject(["https://dossieretudiant.polymtl.ca", 3, 13, 3093, 45.496, -73.617])
        array.addObject(["http://www.footmercato.net", 3, 13, 1604, 45.496, -73.617])
        array.addObject(["http://9gag.com", 3, 13, 166, 45.496, -73.617])
        
        // TimeSolt : 14h - 19h
        array.addObject(["http://www.liberation.fr", 3, 15, 924, 45.496, -73.617])
        array.addObject(["http://www.lequipe.fr", 3, 15, 2718, 45.505, -73.613])
        array.addObject(["https://www.microsoft.com", 3, 15, 2363, 45.505, -73.613])
        array.addObject(["https://twitter.com", 3, 15, 1049, 45.496, -73.617])
        array.addObject(["http://9gag.com", 3, 15, 2018, 45.496, -73.617])
        array.addObject(["https://www.jamendo.com", 3, 15, 534, 45.505, -73.613])
        array.addObject(["https://www.jamendo.com", 3, 15, 80, 45.505, -73.613])
        array.addObject(["http://www.lemonde.fr", 3, 15, 3131, 45.505, -73.613])
        array.addObject(["https://www.youtube.com", 3, 15, 1920, 45.496, -73.617])
        
        // TimeSolt : 19h - 24h
        array.addObject(["https://www.deezer.com", 3, 20, 3111, 45.496, -73.617])
        array.addObject(["http://www.footmercato.net", 3, 20, 2921, 45.496, -73.617])
        array.addObject(["https://www.deezer.com", 3, 20, 1877, 45.505, -73.613])
        array.addObject(["https://dossieretudiant.polymtl.ca", 3, 20, 1823, 45.505, -73.613])
        array.addObject(["http://www.polymtl.ca", 3, 20, 2913, 45.496, -73.617])
        array.addObject(["https://www.deezer.com", 3, 20, 141, 45.496, -73.617])
        array.addObject(["http://www.groupes.polymtl.ca/log6308/index.php", 3, 20, 2540, 45.505, -73.613])
        array.addObject(["https://www.deezer.com", 3, 20, 2247, 45.505, -73.613])
        array.addObject(["http://www.liberation.fr", 3, 20, 3657, 45.496, -73.617])
        array.addObject(["https://github.com", 3, 20, 2199, 45.496, -73.617])
        array.addObject(["https://github.com", 3, 20, 2797, 45.496, -73.617])
        array.addObject(["http://www.footmercato.net", 3, 20, 3347, 45.496, -73.617])
        array.addObject(["http://www.groupes.polymtl.ca/log6308/index.php", 3, 20, 723, 45.496, -73.617])
        
        
        
        // Day : Jeudi
        // TimeSolt : 0h - 5h
        array.addObject(["https://twitter.com", 4, 1, 2810, 45.496, -73.617])
        array.addObject(["http://www.lemonde.fr", 4, 1, 3429, 45.505, -73.613])
        array.addObject(["http://www.samsung.com", 4, 1, 2762, 45.496, -73.617])
        array.addObject(["https://www.microsoft.com", 4, 1, 1807, 45.505, -73.613])
        array.addObject(["http://www.lequipe.fr", 4, 1, 900, 45.496, -73.617])
        array.addObject(["http://www.lequipe.fr", 4, 1, 1688, 45.505, -73.613])
        
        // TimeSolt : 5h - 9h
        array.addObject(["http://www.liberation.fr", 4, 6, 434, 45.505, -73.613])
        array.addObject(["http://fr.euronews.com", 4, 6, 1056, 45.496, -73.617])
        array.addObject(["http://www.groupes.polymtl.ca/log6308/index.php", 4, 6, 3096, 45.496, -73.617])
        array.addObject(["http://www.footmercato.net", 4, 6, 1051, 45.496, -73.617])
        array.addObject(["https://www.microsoft.com", 4, 6, 119, 45.496, -73.617])
        
        // TimeSolt : 9h - 12h
        array.addObject(["https://twitter.com", 4, 10, 2541, 45.505, -73.613])
        array.addObject(["https://github.com", 4, 10, 3630, 45.505, -73.613])
        array.addObject(["https://moodle.polymtl.ca", 4, 10, 2616, 45.505, -73.613])
        array.addObject(["https://www.microsoft.com", 4, 10, 168, 45.505, -73.613])
        array.addObject(["http://www.samsung.com", 4, 10, 1813, 45.496, -73.617])
        array.addObject(["http://facebook.com", 4, 10, 789, 45.505, -73.613])
        
        // TimeSolt : 12h - 14h
        array.addObject(["https://www.deezer.com", 4, 13, 2428, 45.496, -73.617])
        array.addObject(["http://www.polymtl.ca", 4, 13, 1688, 45.496, -73.617])
        
        // TimeSolt : 14h - 19h
        array.addObject(["https://mail.google.com", 4, 15, 3185, 45.505, -73.613])
        array.addObject(["https://webmail.minesdedouai.fr", 4, 15, 1167, 45.505, -73.613])
        array.addObject(["https://github.com", 4, 15, 273, 45.496, -73.617])
        array.addObject(["https://dossieretudiant.polymtl.ca", 4, 15, 1288, 45.496, -73.617])
        array.addObject(["http://facebook.com", 4, 15, 846, 45.505, -73.613])
        array.addObject(["https://www.youtube.com", 4, 15, 2855, 45.496, -73.617])
        
        // TimeSolt : 19h - 24h
        array.addObject(["https://www.microsoft.com", 4, 20, 577, 45.505, -73.613])
        array.addObject(["http://www.groupes.polymtl.ca/log6308/index.php", 4, 20, 1199, 45.505, -73.613])
        array.addObject(["https://www.deezer.com", 4, 20, 1876, 45.505, -73.613])
        array.addObject(["http://www.samsung.com", 4, 20, 1645, 45.496, -73.617])
        
        
        
        // Day : Vendredi
        // TimeSolt : 0h - 5h
        array.addObject(["https://fr.wikipedia.org", 5, 1, 3002, 45.505, -73.613])
        array.addObject(["https://twitter.com", 5, 1, 2138, 45.496, -73.617])
        array.addObject(["https://www.jamendo.com", 5, 1, 1760, 45.505, -73.613])
        array.addObject(["http://www.lemonde.fr", 5, 1, 2492, 45.505, -73.613])
        array.addObject(["https://moodle.polymtl.ca", 5, 1, 624, 45.496, -73.617])
        array.addObject(["https://fr.wikipedia.org", 5, 1, 2997, 45.496, -73.617])
        array.addObject(["http://facebook.com", 5, 1, 1756, 45.505, -73.613])
        array.addObject(["https://www.youtube.com", 5, 1, 2873, 45.505, -73.613])
        array.addObject(["http://www.clubic.com", 5, 1, 1193, 45.496, -73.617])
        array.addObject(["https://mail.google.com", 5, 1, 3364, 45.496, -73.617])
        array.addObject(["http://www.groupes.polymtl.ca/log6308/index.php", 5, 1, 3153, 45.496, -73.617])
        array.addObject(["https://moodle.polymtl.ca", 5, 1, 82, 45.496, -73.617])
        
        // TimeSolt : 5h - 9h
        array.addObject(["http://facebook.com", 5, 6, 520, 45.505, -73.613])
        array.addObject(["http://www.groupes.polymtl.ca/log6308/index.php", 5, 6, 1907, 45.496, -73.617])
        array.addObject(["https://webmail.minesdedouai.fr", 5, 6, 2343, 45.496, -73.617])
        
        // TimeSolt : 9h - 12h
        array.addObject(["https://www.deezer.com", 5, 10, 3192, 45.496, -73.617])
        array.addObject(["http://www.lequipe.fr", 5, 10, 2437, 45.505, -73.613])
        array.addObject(["https://github.com", 5, 10, 161, 45.505, -73.613])
        array.addObject(["http://www.samsung.com", 5, 10, 3227, 45.496, -73.617])
        array.addObject(["http://9gag.com", 5, 10, 1948, 45.505, -73.613])
        array.addObject(["http://www.lemonde.fr", 5, 10, 2574, 45.496, -73.617])
        array.addObject(["http://www.clubic.com", 5, 10, 1519, 45.505, -73.613])
        array.addObject(["https://mail.google.com", 5, 10, 3474, 45.496, -73.617])
        array.addObject(["http://facebook.com", 5, 10, 3128, 45.505, -73.613])
        array.addObject(["https://twitter.com", 5, 10, 2585, 45.496, -73.617])
        array.addObject(["http://www.footmercato.net", 5, 10, 3292, 45.496, -73.617])
        array.addObject(["https://twitter.com", 5, 10, 3061, 45.505, -73.613])
        
        // TimeSolt : 12h - 14h
        array.addObject(["http://9gag.com", 5, 13, 1412, 45.496, -73.617])
        array.addObject(["https://www.youtube.com", 5, 13, 374, 45.505, -73.613])
        array.addObject(["http://fr.euronews.com", 5, 13, 3621, 45.505, -73.613])
        
        // TimeSolt : 14h - 19h
        array.addObject(["http://www.lequipe.fr", 5, 15, 3019, 45.505, -73.613])
        array.addObject(["https://www.deezer.com", 5, 15, 3116, 45.505, -73.613])
        array.addObject(["https://mail.google.com", 5, 15, 2042, 45.496, -73.617])
        array.addObject(["http://www.clubic.com", 5, 15, 595, 45.496, -73.617])
        array.addObject(["https://webmail.minesdedouai.fr", 5, 15, 441, 45.505, -73.613])
        array.addObject(["http://www.clubic.com", 5, 15, 3522, 45.496, -73.617])
        array.addObject(["http://9gag.com", 5, 15, 267, 45.496, -73.617])
        array.addObject(["https://www.deezer.com", 5, 15, 1952, 45.496, -73.617])
        array.addObject(["https://twitter.com", 5, 15, 1548, 45.505, -73.613])
        
        // TimeSolt : 19h - 24h
        array.addObject(["https://www.microsoft.com", 5, 20, 1828, 45.496, -73.617])
        array.addObject(["https://www.youtube.com", 5, 20, 2525, 45.505, -73.613])
        
        
        
        // Day : Samedi
        // TimeSolt : 0h - 5h
        array.addObject(["http://9gag.com", 6, 1, 715, 45.496, -73.617])
        array.addObject(["http://www.liberation.fr", 6, 1, 1002, 45.496, -73.617])
        array.addObject(["http://www.polymtl.ca", 6, 1, 146, 45.505, -73.613])
        array.addObject(["http://www.liberation.fr", 6, 1, 687, 45.496, -73.617])
        array.addObject(["http://www.lequipe.fr", 6, 1, 2319, 45.505, -73.613])
        array.addObject(["https://www.imp.polymtl.ca", 6, 1, 2480, 45.496, -73.617])
        array.addObject(["http://www.footmercato.net", 6, 1, 2429, 45.496, -73.617])
        array.addObject(["https://mail.google.com", 6, 1, 3193, 45.505, -73.613])
        array.addObject(["http://9gag.com", 6, 1, 1013, 45.496, -73.617])
        array.addObject(["http://www.groupes.polymtl.ca/log6308/index.php", 6, 1, 2958, 45.496, -73.617])
        array.addObject(["http://www.footmercato.net", 6, 1, 3173, 45.505, -73.613])
        array.addObject(["http://www.apple.com", 6, 1, 882, 45.505, -73.613])
        array.addObject(["https://mail.google.com", 6, 1, 106, 45.496, -73.617])
        array.addObject(["http://www.footmercato.net", 6, 1, 1572, 45.505, -73.613])
        
        // TimeSolt : 5h - 9h
        array.addObject(["https://twitter.com", 6, 6, 3419, 45.496, -73.617])
        array.addObject(["http://www.groupes.polymtl.ca/log6308/index.php", 6, 6, 668, 45.505, -73.613])
        array.addObject(["https://www.jamendo.com", 6, 6, 676, 45.496, -73.617])
        array.addObject(["https://www.deezer.com", 6, 6, 283, 45.505, -73.613])
        array.addObject(["https://mail.google.com", 6, 6, 1573, 45.505, -73.613])
        array.addObject(["http://9gag.com", 6, 6, 3358, 45.496, -73.617])
        array.addObject(["http://www.clubic.com", 6, 6, 65, 45.505, -73.613])
        array.addObject(["http://www.liberation.fr", 6, 6, 540, 45.496, -73.617])
        array.addObject(["http://www.polymtl.ca", 6, 6, 478, 45.505, -73.613])
        array.addObject(["http://www.groupes.polymtl.ca/log6308/index.php", 6, 6, 1000, 45.496, -73.617])
        array.addObject(["https://twitter.com", 6, 6, 182, 45.505, -73.613])
        
        // TimeSolt : 9h - 12h
        array.addObject(["https://www.deezer.com", 6, 10, 1315, 45.496, -73.617])
        array.addObject(["https://www.jamendo.com", 6, 10, 939, 45.505, -73.613])
        array.addObject(["http://www.liberation.fr", 6, 10, 2099, 45.505, -73.613])
        array.addObject(["https://www.deezer.com", 6, 10, 2249, 45.505, -73.613])
        array.addObject(["http://www.groupes.polymtl.ca/log6308/index.php", 6, 10, 3346, 45.496, -73.617])
        array.addObject(["https://www.microsoft.com", 6, 10, 2474, 45.505, -73.613])
        array.addObject(["https://www.youtube.com", 6, 10, 2284, 45.496, -73.617])
        
        // TimeSolt : 12h - 14h
        array.addObject(["http://www.clubic.com", 6, 13, 1691, 45.505, -73.613])
        array.addObject(["http://www.apple.com", 6, 13, 1278, 45.505, -73.613])
        array.addObject(["https://www.jamendo.com", 6, 13, 2562, 45.496, -73.617])
        array.addObject(["https://webmail.minesdedouai.fr", 6, 13, 2449, 45.496, -73.617])
        array.addObject(["http://www.footmercato.net", 6, 13, 644, 45.505, -73.613])
        
        // TimeSolt : 14h - 19h
        array.addObject(["http://www.footmercato.net", 6, 15, 597, 45.496, -73.617])
        array.addObject(["https://twitter.com", 6, 15, 1872, 45.496, -73.617])
        array.addObject(["http://9gag.com", 6, 15, 293, 45.496, -73.617])
        array.addObject(["http://www.polymtl.ca", 6, 15, 559, 45.496, -73.617])
        array.addObject(["https://mail.google.com", 6, 15, 1168, 45.496, -73.617])
        array.addObject(["https://www.imp.polymtl.ca", 6, 15, 2963, 45.505, -73.613])
        array.addObject(["http://fr.euronews.com", 6, 15, 2001, 45.505, -73.613])
        array.addObject(["http://9gag.com", 6, 15, 2338, 45.505, -73.613])
        array.addObject(["http://facebook.com", 6, 15, 3413, 45.496, -73.617])
        
        // TimeSolt : 19h - 24h
        array.addObject(["http://www.clubic.com", 6, 20, 664, 45.496, -73.617])
        
        
        
        // Day : Dimanche
        // TimeSolt : 0h - 5h
        array.addObject(["http://facebook.com", 7, 1, 235, 45.505, -73.613])
        
        // TimeSolt : 5h - 9h
        array.addObject(["https://www.imp.polymtl.ca", 7, 6, 2871, 45.505, -73.613])
        array.addObject(["https://www.youtube.com", 7, 6, 297, 45.496, -73.617])
        array.addObject(["http://fr.euronews.com", 7, 6, 1152, 45.505, -73.613])
        
        // TimeSolt : 9h - 12h
        array.addObject(["https://www.microsoft.com", 7, 10, 1419, 45.505, -73.613])
        array.addObject(["https://fr.wikipedia.org", 7, 10, 3640, 45.505, -73.613])
        array.addObject(["https://www.microsoft.com", 7, 10, 124, 45.505, -73.613])
        array.addObject(["http://fr.euronews.com", 7, 10, 2675, 45.496, -73.617])
        array.addObject(["https://dossieretudiant.polymtl.ca", 7, 10, 3502, 45.505, -73.613])
        array.addObject(["https://www.youtube.com", 7, 10, 2947, 45.496, -73.617])
        array.addObject(["https://www.imp.polymtl.ca", 7, 10, 3587, 45.496, -73.617])
        array.addObject(["https://webmail.minesdedouai.fr", 7, 10, 1624, 45.496, -73.617])
        array.addObject(["https://github.com", 7, 10, 446, 45.496, -73.617])
        array.addObject(["http://9gag.com", 7, 10, 1130, 45.496, -73.617])
        array.addObject(["http://www.lemonde.fr", 7, 10, 3381, 45.505, -73.613])
        array.addObject(["https://moodle.polymtl.ca", 7, 10, 1177, 45.496, -73.617])
        array.addObject(["http://www.footmercato.net", 7, 10, 1882, 45.505, -73.613])
        array.addObject(["https://www.jamendo.com", 7, 10, 310, 45.496, -73.617])
        
        // TimeSolt : 12h - 14h
        array.addObject(["https://www.jamendo.com", 7, 13, 2133, 45.505, -73.613])
        array.addObject(["http://9gag.com", 7, 13, 3208, 45.505, -73.613])
        array.addObject(["http://9gag.com", 7, 13, 466, 45.496, -73.617])
        array.addObject(["https://fr.wikipedia.org", 7, 13, 742, 45.496, -73.617])
        array.addObject(["http://fr.euronews.com", 7, 13, 888, 45.505, -73.613])
        array.addObject(["http://www.lemonde.fr", 7, 13, 2505, 45.505, -73.613])
        array.addObject(["http://www.samsung.com", 7, 13, 2752, 45.496, -73.617])
        array.addObject(["http://facebook.com", 7, 13, 1569, 45.496, -73.617])
        array.addObject(["https://www.youtube.com", 7, 13, 3153, 45.496, -73.617])
        array.addObject(["https://dossieretudiant.polymtl.ca", 7, 13, 3647, 45.505, -73.613])
        array.addObject(["http://www.groupes.polymtl.ca/log6308/index.php", 7, 13, 2629, 45.505, -73.613])
        array.addObject(["https://www.youtube.com", 7, 13, 3241, 45.505, -73.613])
        array.addObject(["https://github.com", 7, 13, 923, 45.505, -73.613])
        
        // TimeSolt : 14h - 19h
        
        // TimeSolt : 19h - 24h
        array.addObject(["https://www.deezer.com", 7, 20, 2146, 45.505, -73.613])
        array.addObject(["http://www.polymtl.ca", 7, 20, 163, 45.496, -73.617])
        array.addObject(["https://www.imp.polymtl.ca", 7, 20, 980, 45.505, -73.613])
        array.addObject(["https://mail.google.com", 7, 20, 2010, 45.496, -73.617])
        array.addObject(["https://fr.wikipedia.org", 7, 20, 1721, 45.505, -73.613])
        array.addObject(["http://www.apple.com", 7, 20, 3244, 45.496, -73.617])
        array.addObject(["http://www.polymtl.ca", 7, 20, 388, 45.505, -73.613])
        array.addObject(["http://9gag.com", 7, 20, 507, 45.505, -73.613])
        array.addObject(["http://www.samsung.com", 7, 20, 1190, 45.505, -73.613])
        array.addObject(["http://facebook.com", 7, 20, 1999, 45.496, -73.617])
        array.addObject(["http://www.lemonde.fr", 7, 20, 2126, 45.496, -73.617])
        array.addObject(["https://www.youtube.com", 7, 20, 420, 45.505, -73.613])
        array.addObject(["http://www.lequipe.fr", 7, 20, 1895, 45.505, -73.613])
        
        return array
    }
    
}
