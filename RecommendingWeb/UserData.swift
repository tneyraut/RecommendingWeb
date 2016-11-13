//
//  UserData.swift
//  RecommendingWeb
//
//  Created by Thomas Mac on 28/10/2016.
//  Copyright © 2016 ThomasNeyraut. All rights reserved.
//
//  Cette classe permet de définir des données tests. Chaque méthode définit un utilisateur.
//

import UIKit

class UserData: NSObject {

    // cet utilisateur ne surfe sur le web uniquement durant son travail pour voir ses mails 4,5,6
    // son facebook, twitter, des news 7,15,0,22 durant sa pause de midi
    // cet utilisateur fait toujours la même chose les jours de la semaine aux mêmes heures
    internal static func getDataArrayForUser7() -> NSArray
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
    
    internal static func getDataArrayForUser1() -> NSArray
    {
        let array = NSMutableArray()
        
        // Day : Lundi
        // TimeSolt : 0h - 5h
        
        // TimeSolt : 5h - 9h
        
        // TimeSolt : 9h - 12h
        array.addObject(["https://fr.wikipedia.org", 1, 10, 209, 45.505, -73.613])
        array.addObject(["http://www.lequipe.fr", 1, 10, 2769, 45.505, -73.613])
        
        // TimeSolt : 12h - 14h
        array.addObject(["https://www.jamendo.com", 1, 13, 2018, 45.505, -73.613])
        
        // TimeSolt : 14h - 19h
        array.addObject(["http://www.lemonde.fr", 1, 15, 900, 45.496, -73.617])
        array.addObject(["https://fr.wikipedia.org", 1, 15, 196, 45.496, -73.617])
        array.addObject(["https://dossieretudiant.polymtl.ca", 1, 15, 228, 45.496, -73.617])
        array.addObject(["http://www.koreus.com", 1, 15, 620, 45.496, -73.617])
        array.addObject(["http://www.footmercato.net", 1, 15, 2338, 45.505, -73.613])
        
        // TimeSolt : 19h - 24h
        array.addObject(["https://webmail.minesdedouai.fr", 1, 20, 92, 45.505, -73.613])
        
        
        
        // Day : Mardi
        // TimeSolt : 0h - 5h
        
        // TimeSolt : 5h - 9h
        
        // TimeSolt : 9h - 12h
        array.addObject(["https://fr.wikipedia.org", 1, 10, 2733, 45.505, -73.613])
        array.addObject(["http://www.lequipe.fr", 1, 10, 270, 45.505, -73.613])
        
        // TimeSolt : 12h - 14h
        array.addObject(["https://www.jamendo.com", 1, 13, 3409, 45.505, -73.613])
        
        // TimeSolt : 14h - 19h
        array.addObject(["http://www.lemonde.fr", 1, 15, 3018, 45.496, -73.617])
        array.addObject(["https://fr.wikipedia.org", 1, 15, 2842, 45.496, -73.617])
        array.addObject(["https://dossieretudiant.polymtl.ca", 1, 15, 943, 45.496, -73.617])
        array.addObject(["http://www.koreus.com", 1, 15, 383, 45.496, -73.617])
        array.addObject(["http://www.footmercato.net", 1, 15, 3164, 45.505, -73.613])
        
        // TimeSolt : 19h - 24h
        array.addObject(["https://webmail.minesdedouai.fr", 1, 20, 3486, 45.505, -73.613])
        
        
        
        // Day : Mercredi
        // TimeSolt : 0h - 5h
        
        // TimeSolt : 5h - 9h
        
        // TimeSolt : 9h - 12h
        array.addObject(["https://fr.wikipedia.org", 1, 10, 655, 45.505, -73.613])
        array.addObject(["http://www.lequipe.fr", 1, 10, 334, 45.505, -73.613])
        
        // TimeSolt : 12h - 14h
        array.addObject(["https://www.jamendo.com", 1, 13, 924, 45.505, -73.613])
        
        // TimeSolt : 14h - 19h
        array.addObject(["http://www.lemonde.fr", 1, 15, 2981, 45.496, -73.617])
        array.addObject(["https://fr.wikipedia.org", 1, 15, 822, 45.496, -73.617])
        array.addObject(["https://dossieretudiant.polymtl.ca", 1, 15, 1770, 45.496, -73.617])
        array.addObject(["http://www.koreus.com", 1, 15, 48, 45.496, -73.617])
        array.addObject(["http://www.footmercato.net", 1, 15, 3445, 45.505, -73.613])
        
        // TimeSolt : 19h - 24h
        array.addObject(["https://webmail.minesdedouai.fr", 1, 20, 1190, 45.505, -73.613])
        
        
        
        // Day : Jeudi
        // TimeSolt : 0h - 5h
        
        // TimeSolt : 5h - 9h
        
        // TimeSolt : 9h - 12h
        array.addObject(["https://fr.wikipedia.org", 1, 10, 3231, 45.505, -73.613])
        array.addObject(["http://www.lequipe.fr", 1, 10, 438, 45.505, -73.613])
        
        // TimeSolt : 12h - 14h
        array.addObject(["https://www.jamendo.com", 1, 13, 2027, 45.505, -73.613])
        
        // TimeSolt : 14h - 19h
        array.addObject(["http://www.lemonde.fr", 1, 15, 3411, 45.496, -73.617])
        array.addObject(["https://fr.wikipedia.org", 1, 15, 3217, 45.496, -73.617])
        array.addObject(["https://dossieretudiant.polymtl.ca", 1, 15, 2725, 45.496, -73.617])
        array.addObject(["http://www.koreus.com", 1, 15, 464, 45.496, -73.617])
        array.addObject(["http://www.footmercato.net", 1, 15, 869, 45.505, -73.613])
        
        // TimeSolt : 19h - 24h
        array.addObject(["https://webmail.minesdedouai.fr", 1, 20, 555, 45.505, -73.613])
        
        
        
        // Day : Vendredi
        // TimeSolt : 0h - 5h
        
        // TimeSolt : 5h - 9h
        
        // TimeSolt : 9h - 12h
        array.addObject(["https://fr.wikipedia.org", 1, 10, 1695, 45.505, -73.613])
        array.addObject(["http://www.lequipe.fr", 1, 10, 1319, 45.505, -73.613])
        
        // TimeSolt : 12h - 14h
        array.addObject(["https://www.jamendo.com", 1, 13, 487, 45.505, -73.613])
        
        // TimeSolt : 14h - 19h
        array.addObject(["http://www.lemonde.fr", 1, 15, 1588, 45.496, -73.617])
        array.addObject(["https://fr.wikipedia.org", 1, 15, 3118, 45.496, -73.617])
        array.addObject(["https://dossieretudiant.polymtl.ca", 1, 15, 435, 45.496, -73.617])
        array.addObject(["http://www.koreus.com", 1, 15, 2933, 45.496, -73.617])
        array.addObject(["http://www.footmercato.net", 1, 15, 61, 45.505, -73.613])
        
        // TimeSolt : 19h - 24h
        array.addObject(["https://webmail.minesdedouai.fr", 1, 20, 3359, 45.505, -73.613])
        
        
        
        // Day : Samedi
        // TimeSolt : 0h - 5h
        
        // TimeSolt : 5h - 9h
        
        // TimeSolt : 9h - 12h
        array.addObject(["https://webmail.minesdedouai.fr", 6, 10, 1714, 45.496, -73.617])
        array.addObject(["http://www.koreus.com", 6, 10, 2409, 45.496, -73.617])
        
        // TimeSolt : 12h - 14h
        
        // TimeSolt : 14h - 19h
        array.addObject(["http://www.footmercato.net", 6, 15, 2690, 45.505, -73.613])
        array.addObject(["https://dossieretudiant.polymtl.ca", 6, 15, 439, 45.496, -73.617])
        array.addObject(["http://www.lemonde.fr", 6, 15, 2472, 45.505, -73.613])
        array.addObject(["https://fr.wikipedia.org", 6, 15, 171, 45.496, -73.617])
        array.addObject(["https://mail.google.com", 6, 15, 2576, 45.496, -73.617])
        
        // TimeSolt : 19h - 24h
        
        
        
        // Day : Dimanche
        // TimeSolt : 0h - 5h
        
        // TimeSolt : 5h - 9h
        
        // TimeSolt : 9h - 12h
        array.addObject(["https://webmail.minesdedouai.fr", 6, 10, 3434, 45.496, -73.617])
        array.addObject(["http://www.koreus.com", 6, 10, 3411, 45.496, -73.617])
        
        // TimeSolt : 12h - 14h
        
        // TimeSolt : 14h - 19h
        array.addObject(["http://www.footmercato.net", 6, 15, 1953, 45.505, -73.613])
        array.addObject(["https://dossieretudiant.polymtl.ca", 6, 15, 259, 45.496, -73.617])
        array.addObject(["http://www.lemonde.fr", 6, 15, 407, 45.505, -73.613])
        array.addObject(["https://fr.wikipedia.org", 6, 15, 906, 45.496, -73.617])
        array.addObject(["https://mail.google.com", 6, 15, 2025, 45.496, -73.617])
        
        // TimeSolt : 19h - 24h
        
        return array
    }
    
    internal static func getDataArrayForUser2() -> NSArray
    {
        let array = NSMutableArray()
        
        // Day : Lundi
        // TimeSolt : 0h - 5h
        
        // TimeSolt : 5h - 9h
        
        // TimeSolt : 9h - 12h
        array.addObject(["http://www.lequipe.fr", 1, 10, 345, 45.496, -73.617])
        array.addObject(["http://www.clubic.com", 1, 10, 1619, 45.496, -73.617])
        
        // TimeSolt : 12h - 14h
        array.addObject(["https://www.deezer.com", 1, 13, 226, 45.496, -73.617])
        array.addObject(["http://www.polymtl.ca", 1, 13, 482, 45.505, -73.613])
        array.addObject(["http://www.footmercato.net", 1, 13, 317, 45.496, -73.617])
        array.addObject(["https://www.imp.polymtl.ca", 1, 13, 154, 45.496, -73.617])
        array.addObject(["http://www.lequipe.fr", 1, 13, 162, 45.505, -73.613])
        array.addObject(["https://fr.wikipedia.org", 1, 13, 10, 45.505, -73.613])
        array.addObject(["http://9gag.com", 1, 13, 16, 45.496, -73.617])
        
        // TimeSolt : 14h - 19h
        array.addObject(["http://www.lequipe.fr", 1, 15, 2947, 45.496, -73.617])
        array.addObject(["http://www.clubic.com", 1, 15, 207, 45.496, -73.617])
        
        // TimeSolt : 19h - 24h
        
        
        
        // Day : Mardi
        // TimeSolt : 0h - 5h
        
        // TimeSolt : 5h - 9h
        array.addObject(["https://mail.google.com", 2, 6, 2607, 45.505, -73.613])
        
        // TimeSolt : 9h - 12h
        array.addObject(["http://9gag.com", 2, 10, 148, 45.496, -73.617])
        array.addObject(["https://fr.wikipedia.org", 2, 10, 370, 45.496, -73.617])
        array.addObject(["http://www.apple.com", 2, 10, 972, 45.505, -73.613])
        array.addObject(["http://www.clubic.com", 2, 10, 717, 45.505, -73.613])
        array.addObject(["http://www.groupes.polymtl.ca/log6308/index.php", 2, 10, 11, 45.505, -73.613])
        array.addObject(["https://dossieretudiant.polymtl.ca", 2, 10, 144, 45.496, -73.617])
        
        // TimeSolt : 12h - 14h
        array.addObject(["http://www.lemonde.fr", 2, 13, 888, 45.505, -73.613])
        
        // TimeSolt : 14h - 19h
        array.addObject(["http://9gag.com", 2, 15, 288, 45.496, -73.617])
        array.addObject(["https://fr.wikipedia.org", 2, 15, 356, 45.496, -73.617])
        array.addObject(["http://www.apple.com", 2, 15, 23, 45.505, -73.613])
        array.addObject(["http://www.clubic.com", 2, 15, 1698, 45.505, -73.613])
        array.addObject(["http://www.groupes.polymtl.ca/log6308/index.php", 2, 15, 1026, 45.505, -73.613])
        array.addObject(["https://dossieretudiant.polymtl.ca", 2, 15, 24, 45.496, -73.617])
        
        // TimeSolt : 19h - 24h
        array.addObject(["https://mail.google.com", 2, 20, 1897, 45.505, -73.613])
        
        
        
        // Day : Mercredi
        // TimeSolt : 0h - 5h
        
        // TimeSolt : 5h - 9h
        array.addObject(["http://www.apple.com", 3, 6, 1450, 45.505, -73.613])
        array.addObject(["https://github.com", 3, 6, 657, 45.496, -73.617])
        array.addObject(["http://fr.euronews.com", 3, 6, 478, 45.505, -73.613])
        array.addObject(["http://www.lequipe.fr", 3, 6, 131, 45.505, -73.613])
        
        // TimeSolt : 9h - 12h
        array.addObject(["http://www.polymtl.ca", 3, 10, 1952, 45.496, -73.617])
        array.addObject(["http://www.clubic.com", 3, 10, 378, 45.505, -73.613])
        array.addObject(["http://9gag.com", 3, 10, 15, 45.496, -73.617])
        array.addObject(["https://www.microsoft.com", 3, 10, 46, 45.505, -73.613])
        array.addObject(["https://www.imp.polymtl.ca", 3, 10, 93, 45.496, -73.617])
        
        // TimeSolt : 12h - 14h
        array.addObject(["http://www.groupes.polymtl.ca/log6308/index.php", 3, 13, 1250, 45.505, -73.613])
        array.addObject(["http://9gag.com", 3, 13, 202, 45.505, -73.613])
        array.addObject(["https://github.com", 3, 13, 148, 45.496, -73.617])
        array.addObject(["http://www.polymtl.ca", 3, 13, 18, 45.505, -73.613])
        array.addObject(["http://www.apple.com", 3, 13, 9, 45.496, -73.617])
        array.addObject(["http://www.clubic.com", 3, 13, 20, 45.496, -73.617])
        array.addObject(["https://webmail.minesdedouai.fr", 3, 13, 6, 45.505, -73.613])
        array.addObject(["https://www.imp.polymtl.ca", 3, 13, 2, 45.496, -73.617])
        
        // TimeSolt : 14h - 19h
        array.addObject(["http://www.polymtl.ca", 3, 15, 3437, 45.496, -73.617])
        array.addObject(["http://www.clubic.com", 3, 15, 508, 45.505, -73.613])
        array.addObject(["http://9gag.com", 3, 15, 201, 45.496, -73.617])
        array.addObject(["https://www.microsoft.com", 3, 15, 10, 45.505, -73.613])
        array.addObject(["https://www.imp.polymtl.ca", 3, 15, 162, 45.496, -73.617])
        
        // TimeSolt : 19h - 24h
        array.addObject(["http://www.apple.com", 3, 20, 3478, 45.505, -73.613])
        array.addObject(["https://github.com", 3, 20, 41, 45.496, -73.617])
        array.addObject(["http://fr.euronews.com", 3, 20, 1, 45.505, -73.613])
        array.addObject(["http://www.lequipe.fr", 3, 20, 115, 45.505, -73.613])
        
        
        
        // Day : Jeudi
        // TimeSolt : 0h - 5h
        
        // TimeSolt : 5h - 9h
        array.addObject(["http://www.polymtl.ca", 4, 6, 316, 45.496, -73.617])
        
        // TimeSolt : 9h - 12h
        array.addObject(["https://github.com", 4, 10, 1760, 45.505, -73.613])
        array.addObject(["http://www.lemonde.fr", 4, 10, 146, 45.496, -73.617])
        array.addObject(["https://mail.google.com", 4, 10, 38, 45.496, -73.617])
        array.addObject(["https://www.microsoft.com", 4, 10, 62, 45.505, -73.613])
        array.addObject(["http://www.polymtl.ca", 4, 10, 2, 45.505, -73.613])
        array.addObject(["https://www.jamendo.com", 4, 10, 0, 45.496, -73.617])
        array.addObject(["http://www.footmercato.net", 4, 10, 15, 45.496, -73.617])
        
        // TimeSolt : 12h - 14h
        array.addObject(["https://github.com", 4, 13, 123, 45.505, -73.613])
        array.addObject(["https://mail.google.com", 4, 13, 1331, 45.505, -73.613])
        array.addObject(["https://www.deezer.com", 4, 13, 120, 45.496, -73.617])
        array.addObject(["https://www.imp.polymtl.ca", 4, 13, 2, 45.505, -73.613])
        
        // TimeSolt : 14h - 19h
        array.addObject(["https://github.com", 4, 15, 2613, 45.505, -73.613])
        array.addObject(["http://www.lemonde.fr", 4, 15, 628, 45.496, -73.617])
        array.addObject(["https://mail.google.com", 4, 15, 78, 45.496, -73.617])
        array.addObject(["https://www.microsoft.com", 4, 15, 3, 45.505, -73.613])
        array.addObject(["http://www.polymtl.ca", 4, 15, 91, 45.505, -73.613])
        array.addObject(["https://www.jamendo.com", 4, 15, 3, 45.496, -73.617])
        array.addObject(["http://www.footmercato.net", 4, 15, 2, 45.496, -73.617])
        
        // TimeSolt : 19h - 24h
        array.addObject(["http://www.polymtl.ca", 4, 20, 2781, 45.496, -73.617])
        
        
        
        // Day : Vendredi
        // TimeSolt : 0h - 5h
        
        // TimeSolt : 5h - 9h
        array.addObject(["http://fr.euronews.com", 5, 6, 748, 45.496, -73.617])
        array.addObject(["https://webmail.minesdedouai.fr", 5, 6, 1399, 45.505, -73.613])
        array.addObject(["http://www.polymtl.ca", 5, 6, 299, 45.505, -73.613])
        array.addObject(["https://www.deezer.com", 5, 6, 294, 45.505, -73.613])
        array.addObject(["https://fr.wikipedia.org", 5, 6, 73, 45.505, -73.613])
        
        // TimeSolt : 9h - 12h
        array.addObject(["http://www.footmercato.net", 5, 10, 1333, 45.496, -73.617])
        array.addObject(["http://www.clubic.com", 5, 10, 520, 45.505, -73.613])
        array.addObject(["https://www.imp.polymtl.ca", 5, 10, 64, 45.505, -73.613])
        array.addObject(["https://mail.google.com", 5, 10, 152, 45.505, -73.613])
        array.addObject(["http://www.apple.com", 5, 10, 83, 45.496, -73.617])
        array.addObject(["https://www.deezer.com", 5, 10, 26, 45.496, -73.617])
        
        // TimeSolt : 12h - 14h
        
        // TimeSolt : 14h - 19h
        array.addObject(["http://www.footmercato.net", 5, 15, 3303, 45.496, -73.617])
        array.addObject(["http://www.clubic.com", 5, 15, 811, 45.505, -73.613])
        array.addObject(["https://www.imp.polymtl.ca", 5, 15, 148, 45.505, -73.613])
        array.addObject(["https://mail.google.com", 5, 15, 90, 45.505, -73.613])
        array.addObject(["http://www.apple.com", 5, 15, 132, 45.496, -73.617])
        array.addObject(["https://www.deezer.com", 5, 15, 9, 45.496, -73.617])
        
        // TimeSolt : 19h - 24h
        array.addObject(["http://fr.euronews.com", 5, 20, 626, 45.496, -73.617])
        array.addObject(["https://webmail.minesdedouai.fr", 5, 20, 3640, 45.505, -73.613])
        array.addObject(["http://www.polymtl.ca", 5, 20, 16, 45.505, -73.613])
        array.addObject(["https://www.deezer.com", 5, 20, 36, 45.505, -73.613])
        array.addObject(["https://fr.wikipedia.org", 5, 20, 2, 45.505, -73.613])
        
        
        
        // Day : Samedi
        // TimeSolt : 0h - 5h
        
        // TimeSolt : 5h - 9h
        
        // TimeSolt : 9h - 12h
        array.addObject(["https://webmail.minesdedouai.fr", 6, 10, 2531, 45.496, -73.617])
        array.addObject(["https://www.deezer.com", 6, 10, 27, 45.505, -73.613])
        
        // TimeSolt : 12h - 14h
        
        // TimeSolt : 14h - 19h
        array.addObject(["https://webmail.minesdedouai.fr", 6, 15, 2218, 45.496, -73.617])
        array.addObject(["https://www.deezer.com", 6, 15, 855, 45.505, -73.613])
        
        // TimeSolt : 19h - 24h
        
        
        
        // Day : Dimanche
        // TimeSolt : 0h - 5h
        
        // TimeSolt : 5h - 9h
        
        // TimeSolt : 9h - 12h
        array.addObject(["https://fr.wikipedia.org", 7, 10, 483, 45.505, -73.613])
        
        // TimeSolt : 12h - 14h
        
        // TimeSolt : 14h - 19h
        array.addObject(["https://fr.wikipedia.org", 7, 15, 304, 45.505, -73.613])
        
        // TimeSolt : 19h - 24h
        
        return array
    }
    
    internal static func getDataArrayForUser3() -> NSArray
    {
        let array = NSMutableArray()
        
        // Day : Lundi
        // TimeSolt : 0h - 5h
        
        // TimeSolt : 5h - 9h
        array.addObject(["http://www.apple.com", 1, 6, 702, 45.496, -73.617])
        array.addObject(["http://www.koreus.com", 1, 6, 462, 45.496, -73.617])
        array.addObject(["https://webmail.minesdedouai.fr", 1, 6, 13, 45.505, -73.613])
        
        // TimeSolt : 9h - 12h
        array.addObject(["https://mail.google.com", 1, 10, 638, 45.505, -73.613])
        array.addObject(["http://www.apple.com", 1, 10, 234, 45.496, -73.617])
        array.addObject(["https://www.deezer.com", 1, 10, 153, 45.505, -73.613])
        array.addObject(["https://moodle.polymtl.ca", 1, 10, 33, 45.505, -73.613])
        array.addObject(["http://www.koreus.com", 1, 10, 22, 45.505, -73.613])
        
        // TimeSolt : 12h - 14h
        array.addObject(["https://moodle.polymtl.ca", 1, 13, 449, 45.496, -73.617])
        
        // TimeSolt : 14h - 19h
        array.addObject(["https://moodle.polymtl.ca", 1, 15, 364, 45.505, -73.613])
        array.addObject(["https://mail.google.com", 1, 15, 1068, 45.496, -73.617])
        array.addObject(["http://www.koreus.com", 1, 15, 245, 45.496, -73.617])
        array.addObject(["https://webmail.minesdedouai.fr", 1, 15, 95, 45.496, -73.617])
        array.addObject(["https://www.deezer.com", 1, 15, 15, 45.496, -73.617])
        array.addObject(["http://www.samsung.com", 1, 15, 9, 45.496, -73.617])
        
        // TimeSolt : 19h - 24h
        
        
        
        // Day : Mardi
        // TimeSolt : 0h - 5h
        
        // TimeSolt : 5h - 9h
        
        // TimeSolt : 9h - 12h
        
        // TimeSolt : 12h - 14h
        array.addObject(["http://www.samsung.com", 2, 13, 251, 45.505, -73.613])
        array.addObject(["https://mail.google.com", 2, 13, 264, 45.505, -73.613])
        array.addObject(["https://www.deezer.com", 2, 13, 88, 45.496, -73.617])
        array.addObject(["http://www.apple.com", 2, 13, 26, 45.505, -73.613])
        array.addObject(["http://www.koreus.com", 2, 13, 3, 45.496, -73.617])
        
        // TimeSolt : 14h - 19h
        array.addObject(["https://webmail.minesdedouai.fr", 2, 15, 706, 45.496, -73.617])
        array.addObject(["http://www.samsung.com", 2, 15, 369, 45.505, -73.613])
        array.addObject(["https://www.deezer.com", 2, 15, 7, 45.505, -73.613])
        
        // TimeSolt : 19h - 24h
        
        
        
        // Day : Mercredi
        // TimeSolt : 0h - 5h
        
        // TimeSolt : 5h - 9h
        array.addObject(["https://mail.google.com", 3, 6, 739, 45.505, -73.613])
        array.addObject(["https://www.deezer.com", 3, 6, 248, 45.505, -73.613])
        array.addObject(["http://www.koreus.com", 3, 6, 68, 45.505, -73.613])
        array.addObject(["https://webmail.minesdedouai.fr", 3, 6, 30, 45.505, -73.613])
        array.addObject(["https://moodle.polymtl.ca", 3, 6, 37, 45.505, -73.613])
        array.addObject(["http://www.samsung.com", 3, 6, 5, 45.505, -73.613])
        
        // TimeSolt : 9h - 12h
        
        // TimeSolt : 12h - 14h
        array.addObject(["https://moodle.polymtl.ca", 3, 13, 575, 45.505, -73.613])
        
        // TimeSolt : 14h - 19h
        array.addObject(["http://www.apple.com", 3, 15, 802, 45.496, -73.617])
        array.addObject(["http://www.samsung.com", 3, 15, 134, 45.496, -73.617])
        array.addObject(["https://moodle.polymtl.ca", 3, 15, 454, 45.496, -73.617])
        array.addObject(["http://www.koreus.com", 3, 15, 5, 45.496, -73.617])
        array.addObject(["https://mail.google.com", 3, 15, 44, 45.496, -73.617])
        
        // TimeSolt : 19h - 24h
        
        
        
        // Day : Jeudi
        // TimeSolt : 0h - 5h
        
        // TimeSolt : 5h - 9h
        array.addObject(["https://moodle.polymtl.ca", 4, 6, 407, 45.496, -73.617])
        array.addObject(["https://www.deezer.com", 4, 6, 463, 45.505, -73.613])
        
        // TimeSolt : 9h - 12h
        array.addObject(["https://webmail.minesdedouai.fr", 4, 10, 181, 45.496, -73.617])
        
        // TimeSolt : 12h - 14h
        array.addObject(["http://www.koreus.com", 4, 13, 372, 45.496, -73.617])
        array.addObject(["https://moodle.polymtl.ca", 4, 13, 129, 45.496, -73.617])
        array.addObject(["http://www.samsung.com", 4, 13, 74, 45.496, -73.617])
        array.addObject(["https://webmail.minesdedouai.fr", 4, 13, 7, 45.496, -73.617])
        array.addObject(["https://mail.google.com", 4, 13, 64, 45.505, -73.613])
        array.addObject(["http://www.apple.com", 4, 13, 2, 45.505, -73.613])
        
        // TimeSolt : 14h - 19h
        
        // TimeSolt : 19h - 24h
        
        
        
        // Day : Vendredi
        // TimeSolt : 0h - 5h
        
        // TimeSolt : 5h - 9h
        array.addObject(["http://www.apple.com", 5, 6, 790, 45.505, -73.613])
        array.addObject(["https://moodle.polymtl.ca", 5, 6, 85, 45.505, -73.613])
        
        // TimeSolt : 9h - 12h
        array.addObject(["https://mail.google.com", 5, 10, 1078, 45.496, -73.617])
        
        // TimeSolt : 12h - 14h
        
        // TimeSolt : 14h - 19h
        
        // TimeSolt : 19h - 24h
        
        
        
        // Day : Samedi
        // TimeSolt : 0h - 5h
        
        // TimeSolt : 5h - 9h
        array.addObject(["https://moodle.polymtl.ca", 6, 6, 57, 45.496, -73.617])
        array.addObject(["http://www.koreus.com", 6, 6, 849, 45.496, -73.617])
        array.addObject(["http://www.apple.com", 6, 6, 53, 45.496, -73.617])
        array.addObject(["https://www.deezer.com", 6, 6, 473, 45.505, -73.613])
        array.addObject(["http://www.samsung.com", 6, 6, 8, 45.496, -73.617])
        
        // TimeSolt : 9h - 12h
        array.addObject(["http://www.samsung.com", 6, 10, 116, 45.505, -73.613])
        array.addObject(["https://mail.google.com", 6, 10, 728, 45.505, -73.613])
        array.addObject(["https://www.deezer.com", 6, 10, 14, 45.496, -73.617])
        array.addObject(["https://webmail.minesdedouai.fr", 6, 10, 6, 45.505, -73.613])
        
        // TimeSolt : 12h - 14h
        array.addObject(["http://www.apple.com", 6, 13, 306, 45.496, -73.617])
        array.addObject(["https://moodle.polymtl.ca", 6, 13, 227, 45.505, -73.613])
        array.addObject(["https://www.deezer.com", 6, 13, 33, 45.505, -73.613])
        array.addObject(["https://webmail.minesdedouai.fr", 6, 13, 4, 45.496, -73.617])
        
        // TimeSolt : 14h - 19h
        array.addObject(["https://mail.google.com", 6, 15, 553, 45.496, -73.617])
        
        // TimeSolt : 19h - 24h
        
        
        
        // Day : Dimanche
        // TimeSolt : 0h - 5h
        
        // TimeSolt : 5h - 9h
        array.addObject(["https://webmail.minesdedouai.fr", 7, 6, 724, 45.505, -73.613])
        array.addObject(["https://mail.google.com", 7, 6, 283, 45.496, -73.617])
        array.addObject(["https://moodle.polymtl.ca", 7, 6, 197, 45.496, -73.617])
        array.addObject(["http://www.koreus.com", 7, 6, 72, 45.505, -73.613])
        array.addObject(["https://www.deezer.com", 7, 6, 35, 45.496, -73.617])
        array.addObject(["http://www.apple.com", 7, 6, 60, 45.505, -73.613])
        
        // TimeSolt : 9h - 12h
        
        // TimeSolt : 12h - 14h
        array.addObject(["http://www.apple.com", 7, 13, 283, 45.505, -73.613])
        array.addObject(["http://www.samsung.com", 7, 13, 33, 45.496, -73.617])
        array.addObject(["https://mail.google.com", 7, 13, 169, 45.496, -73.617])
        array.addObject(["http://www.koreus.com", 7, 13, 28, 45.496, -73.617])
        array.addObject(["https://moodle.polymtl.ca", 7, 13, 41, 45.496, -73.617])
        
        // TimeSolt : 14h - 19h
        array.addObject(["http://www.samsung.com", 7, 15, 134, 45.496, -73.617])
        array.addObject(["http://www.apple.com", 7, 15, 280, 45.505, -73.613])
        
        // TimeSolt : 19h - 24h
        
        return array
    }
    
    internal static func getDataArrayForUser4() -> NSArray
    {
        let array = NSMutableArray()
        
        // Day : Lundi
        // TimeSolt : 0h - 5h
        
        // TimeSolt : 5h - 9h
        
        // TimeSolt : 9h - 12h
        
        // TimeSolt : 12h - 14h
        
        // TimeSolt : 14h - 19h
        
        // TimeSolt : 19h - 24h
        
        
        
        // Day : Mardi
        // TimeSolt : 0h - 5h
        
        // TimeSolt : 5h - 9h
        
        // TimeSolt : 9h - 12h
        
        // TimeSolt : 12h - 14h
        
        // TimeSolt : 14h - 19h
        
        // TimeSolt : 19h - 24h
        
        
        
        // Day : Mercredi
        // TimeSolt : 0h - 5h
        
        // TimeSolt : 5h - 9h
        
        // TimeSolt : 9h - 12h
        
        // TimeSolt : 12h - 14h
        
        // TimeSolt : 14h - 19h
        
        // TimeSolt : 19h - 24h
        
        
        
        // Day : Jeudi
        // TimeSolt : 0h - 5h
        
        // TimeSolt : 5h - 9h
        
        // TimeSolt : 9h - 12h
        
        // TimeSolt : 12h - 14h
        
        // TimeSolt : 14h - 19h
        
        // TimeSolt : 19h - 24h
        
        
        
        // Day : Vendredi
        // TimeSolt : 0h - 5h
        
        // TimeSolt : 5h - 9h
        
        // TimeSolt : 9h - 12h
        
        // TimeSolt : 12h - 14h
        
        // TimeSolt : 14h - 19h
        
        // TimeSolt : 19h - 24h
        
        
        
        // Day : Samedi
        // TimeSolt : 0h - 5h
        
        // TimeSolt : 5h - 9h
        
        // TimeSolt : 9h - 12h
        array.addObject(["https://www.imp.polymtl.ca", 6, 10, 1019, 45.496, -73.617])
        array.addObject(["https://www.microsoft.com", 6, 10, 2442, 45.496, -73.617])
        
        // TimeSolt : 12h - 14h
        
        // TimeSolt : 14h - 19h
        array.addObject(["http://www.lemonde.fr", 6, 15, 51, 45.505, -73.613])
        array.addObject(["https://fr.wikipedia.org", 6, 15, 2769, 45.496, -73.617])
        array.addObject(["http://www.groupes.polymtl.ca/log6308/index.php", 6, 15, 67, 45.496, -73.617])
        array.addObject(["http://www.clubic.com", 6, 15, 723, 45.505, -73.613])
        array.addObject(["https://www.microsoft.com", 6, 15, 2104, 45.496, -73.617])
        array.addObject(["http://www.liberation.fr", 6, 15, 2342, 45.496, -73.617])
        
        // TimeSolt : 19h - 24h
        
        
        
        // Day : Dimanche
        // TimeSolt : 0h - 5h
        
        // TimeSolt : 5h - 9h
        
        // TimeSolt : 9h - 12h
        array.addObject(["http://www.liberation.fr", 7, 10, 2060, 45.505, -73.613])
        
        // TimeSolt : 12h - 14h
        array.addObject(["http://www.lemonde.fr", 7, 13, 1048, 45.496, -73.617])
        array.addObject(["https://mail.google.com", 7, 13, 2756, 45.496, -73.617])
        
        // TimeSolt : 14h - 19h
        array.addObject(["http://www.groupes.polymtl.ca/log6308/index.php", 7, 15, 3310, 45.505, -73.613])
        array.addObject(["http://www.clubic.com", 7, 15, 2376, 45.496, -73.617])
        array.addObject(["https://www.microsoft.com", 7, 15, 7, 45.496, -73.617])
        array.addObject(["https://fr.wikipedia.org", 7, 15, 3023, 45.496, -73.617])
        array.addObject(["http://www.liberation.fr", 7, 15, 1593, 45.505, -73.613])
        
        // TimeSolt : 19h - 24h
        
        return array
    }
    
    internal static func getDataArrayForUser5() -> NSArray
    {
        let array = NSMutableArray()
        
        // Day : Lundi
        // TimeSolt : 0h - 5h
        array.addObject(["https://www.microsoft.com", 1, 1, 790, 45.496, -73.617])
        array.addObject(["http://www.polymtl.ca", 1, 1, 1638, 45.496, -73.617])
        array.addObject(["https://fr.wikipedia.org", 1, 1, 639, 45.496, -73.617])
        array.addObject(["https://www.imp.polymtl.ca", 1, 1, 2772, 45.496, -73.617])
        array.addObject(["http://facebook.com", 1, 1, 1313, 45.505, -73.613])
        array.addObject(["http://www.lemonde.fr", 1, 1, 2390, 45.496, -73.617])
        array.addObject(["https://github.com", 1, 1, 2262, 45.505, -73.613])
        array.addObject(["http://www.koreus.com", 1, 1, 992, 45.496, -73.617])
        array.addObject(["https://twitter.com", 1, 1, 3112, 45.505, -73.613])
        array.addObject(["http://www.samsung.com", 1, 1, 421, 45.505, -73.613])
        array.addObject(["https://moodle.polymtl.ca", 1, 1, 44, 45.496, -73.617])
        
        // TimeSolt : 5h - 9h
        array.addObject(["http://www.apple.com", 1, 6, 3448, 45.505, -73.613])
        array.addObject(["http://9gag.com", 1, 6, 318, 45.505, -73.613])
        array.addObject(["https://www.microsoft.com", 1, 6, 420, 45.505, -73.613])
        array.addObject(["https://webmail.minesdedouai.fr", 1, 6, 1541, 45.496, -73.617])
        array.addObject(["https://www.imp.polymtl.ca", 1, 6, 1214, 45.505, -73.613])
        array.addObject(["https://fr.wikipedia.org", 1, 6, 3509, 45.505, -73.613])
        
        // TimeSolt : 9h - 12h
        
        // TimeSolt : 12h - 14h
        
        // TimeSolt : 14h - 19h
        
        // TimeSolt : 19h - 24h
        array.addObject(["http://www.koreus.com", 1, 20, 2202, 45.496, -73.617])
        array.addObject(["http://fr.euronews.com", 1, 20, 1172, 45.496, -73.617])
        array.addObject(["http://9gag.com", 1, 20, 993, 45.505, -73.613])
        array.addObject(["http://www.clubic.com", 1, 20, 1182, 45.505, -73.613])
        array.addObject(["https://moodle.polymtl.ca", 1, 20, 3531, 45.496, -73.617])
        array.addObject(["https://twitter.com", 1, 20, 3506, 45.496, -73.617])
        
        
        
        // Day : Mardi
        // TimeSolt : 0h - 5h
        array.addObject(["http://www.clubic.com", 2, 1, 2323, 45.505, -73.613])
        
        // TimeSolt : 5h - 9h
        array.addObject(["https://twitter.com", 2, 6, 2870, 45.505, -73.613])
        array.addObject(["https://www.microsoft.com", 2, 6, 3389, 45.496, -73.617])
        array.addObject(["http://www.groupes.polymtl.ca/log6308/index.php", 2, 6, 3046, 45.505, -73.613])
        array.addObject(["https://www.imp.polymtl.ca", 2, 6, 2387, 45.496, -73.617])
        array.addObject(["http://www.samsung.com", 2, 6, 1148, 45.496, -73.617])
        array.addObject(["http://www.footmercato.net", 2, 6, 67, 45.505, -73.613])
        array.addObject(["https://github.com", 2, 6, 134, 45.496, -73.617])
        array.addObject(["https://mail.google.com", 2, 6, 17, 45.505, -73.613])
        
        // TimeSolt : 9h - 12h
        
        // TimeSolt : 12h - 14h
        
        // TimeSolt : 14h - 19h
        array.addObject(["http://www.lemonde.fr", 2, 15, 3542, 45.505, -73.613])
        array.addObject(["http://facebook.com", 2, 15, 2450, 45.505, -73.613])
        array.addObject(["https://github.com", 2, 15, 3527, 45.505, -73.613])
        array.addObject(["http://www.polymtl.ca", 2, 15, 76, 45.505, -73.613])
        array.addObject(["http://www.samsung.com", 2, 15, 3289, 45.496, -73.617])
        array.addObject(["http://www.groupes.polymtl.ca/log6308/index.php", 2, 15, 2983, 45.496, -73.617])
        array.addObject(["https://moodle.polymtl.ca", 2, 15, 22, 45.505, -73.613])
        array.addObject(["https://mail.google.com", 2, 15, 1754, 45.496, -73.617])
        array.addObject(["http://www.footmercato.net", 2, 15, 152, 45.496, -73.617])
        array.addObject(["https://www.deezer.com", 2, 15, 25, 45.505, -73.613])
        
        // TimeSolt : 19h - 24h
        array.addObject(["http://www.lemonde.fr", 2, 20, 1419, 45.496, -73.617])
        array.addObject(["https://www.imp.polymtl.ca", 2, 20, 1339, 45.496, -73.617])
        array.addObject(["http://www.clubic.com", 2, 20, 1302, 45.496, -73.617])
        array.addObject(["http://www.liberation.fr", 2, 20, 1193, 45.505, -73.613])
        array.addObject(["http://www.apple.com", 2, 20, 3024, 45.505, -73.613])
        array.addObject(["http://www.samsung.com", 2, 20, 1665, 45.505, -73.613])
        array.addObject(["http://9gag.com", 2, 20, 2081, 45.496, -73.617])
        array.addObject(["https://webmail.minesdedouai.fr", 2, 20, 2756, 45.505, -73.613])
        array.addObject(["http://facebook.com", 2, 20, 189, 45.505, -73.613])
        array.addObject(["http://www.lequipe.fr", 2, 20, 117, 45.496, -73.617])
        array.addObject(["https://github.com", 2, 20, 20, 45.496, -73.617])
        array.addObject(["http://fr.euronews.com", 2, 20, 15, 45.505, -73.613])
        
        
        
        // Day : Mercredi
        // TimeSolt : 0h - 5h
        array.addObject(["http://www.lequipe.fr", 3, 1, 1492, 45.505, -73.613])
        array.addObject(["http://facebook.com", 3, 1, 2715, 45.496, -73.617])
        
        // TimeSolt : 5h - 9h
        
        // TimeSolt : 9h - 12h
        
        // TimeSolt : 12h - 14h
        
        // TimeSolt : 14h - 19h
        array.addObject(["https://twitter.com", 3, 15, 3137, 45.496, -73.617])
        array.addObject(["http://fr.euronews.com", 3, 15, 1950, 45.505, -73.613])
        array.addObject(["http://www.koreus.com", 3, 15, 2941, 45.496, -73.617])
        array.addObject(["http://www.footmercato.net", 3, 15, 3204, 45.505, -73.613])
        array.addObject(["http://facebook.com", 3, 15, 2741, 45.496, -73.617])
        array.addObject(["https://www.microsoft.com", 3, 15, 1588, 45.496, -73.617])
        array.addObject(["https://webmail.minesdedouai.fr", 3, 15, 48, 45.505, -73.613])
        array.addObject(["https://moodle.polymtl.ca", 3, 15, 73, 45.505, -73.613])
        array.addObject(["https://mail.google.com", 3, 15, 119, 45.496, -73.617])
        
        // TimeSolt : 19h - 24h
        array.addObject(["http://facebook.com", 3, 20, 2548, 45.505, -73.613])
        array.addObject(["https://twitter.com", 3, 20, 2156, 45.505, -73.613])
        array.addObject(["https://www.imp.polymtl.ca", 3, 20, 2882, 45.496, -73.617])
        array.addObject(["http://www.clubic.com", 3, 20, 1369, 45.505, -73.613])
        
        
        
        // Day : Jeudi
        // TimeSolt : 0h - 5h
        array.addObject(["http://www.lemonde.fr", 4, 1, 3013, 45.505, -73.613])
        array.addObject(["https://www.deezer.com", 4, 1, 2688, 45.496, -73.617])
        array.addObject(["http://www.polymtl.ca", 4, 1, 464, 45.496, -73.617])
        array.addObject(["http://www.liberation.fr", 4, 1, 2549, 45.496, -73.617])
        array.addObject(["https://moodle.polymtl.ca", 4, 1, 2861, 45.496, -73.617])
        array.addObject(["http://www.clubic.com", 4, 1, 1844, 45.505, -73.613])
        array.addObject(["http://www.koreus.com", 4, 1, 768, 45.496, -73.617])
        array.addObject(["https://www.imp.polymtl.ca", 4, 1, 1049, 45.496, -73.617])
        array.addObject(["http://facebook.com", 4, 1, 27, 45.496, -73.617])
        array.addObject(["https://webmail.minesdedouai.fr", 4, 1, 18, 45.505, -73.613])
        array.addObject(["http://fr.euronews.com", 4, 1, 9, 45.505, -73.613])
        
        // TimeSolt : 5h - 9h
        array.addObject(["http://www.lemonde.fr", 4, 6, 3641, 45.496, -73.617])
        array.addObject(["http://fr.euronews.com", 4, 6, 1469, 45.496, -73.617])
        array.addObject(["http://www.liberation.fr", 4, 6, 3115, 45.505, -73.613])
        array.addObject(["https://fr.wikipedia.org", 4, 6, 2409, 45.496, -73.617])
        array.addObject(["https://www.imp.polymtl.ca", 4, 6, 339, 45.496, -73.617])
        array.addObject(["http://www.groupes.polymtl.ca/log6308/index.php", 4, 6, 472, 45.505, -73.613])
        array.addObject(["http://www.koreus.com", 4, 6, 474, 45.505, -73.613])
        array.addObject(["http://www.samsung.com", 4, 6, 325, 45.496, -73.617])
        
        // TimeSolt : 9h - 12h
        
        // TimeSolt : 12h - 14h
        
        // TimeSolt : 14h - 19h
        array.addObject(["https://twitter.com", 4, 15, 1533, 45.505, -73.613])
        array.addObject(["http://www.liberation.fr", 4, 15, 140, 45.496, -73.617])
        array.addObject(["https://moodle.polymtl.ca", 4, 15, 1601, 45.496, -73.617])
        array.addObject(["https://dossieretudiant.polymtl.ca", 4, 15, 2134, 45.505, -73.613])
        array.addObject(["https://www.microsoft.com", 4, 15, 1338, 45.496, -73.617])
        array.addObject(["http://facebook.com", 4, 15, 2478, 45.505, -73.613])
        array.addObject(["https://webmail.minesdedouai.fr", 4, 15, 3001, 45.496, -73.617])
        array.addObject(["https://fr.wikipedia.org", 4, 15, 1153, 45.496, -73.617])
        array.addObject(["https://www.deezer.com", 4, 15, 3128, 45.496, -73.617])
        array.addObject(["http://www.clubic.com", 4, 15, 212, 45.496, -73.617])
        array.addObject(["http://www.lequipe.fr", 4, 15, 2, 45.496, -73.617])
        array.addObject(["http://fr.euronews.com", 4, 15, 8, 45.496, -73.617])
        
        // TimeSolt : 19h - 24h
        array.addObject(["http://www.polymtl.ca", 4, 20, 2784, 45.496, -73.617])
        array.addObject(["https://github.com", 4, 20, 1158, 45.496, -73.617])
        array.addObject(["https://dossieretudiant.polymtl.ca", 4, 20, 536, 45.505, -73.613])
        array.addObject(["http://fr.euronews.com", 4, 20, 512, 45.505, -73.613])
        array.addObject(["http://facebook.com", 4, 20, 2566, 45.505, -73.613])
        array.addObject(["http://www.lemonde.fr", 4, 20, 1756, 45.496, -73.617])
        array.addObject(["https://webmail.minesdedouai.fr", 4, 20, 3447, 45.505, -73.613])
        array.addObject(["http://www.footmercato.net", 4, 20, 1404, 45.505, -73.613])
        array.addObject(["https://fr.wikipedia.org", 4, 20, 793, 45.505, -73.613])
        array.addObject(["https://twitter.com", 4, 20, 73, 45.496, -73.617])
        
        
        
        // Day : Vendredi
        // TimeSolt : 0h - 5h
        array.addObject(["http://www.koreus.com", 5, 1, 1161, 45.496, -73.617])
        
        // TimeSolt : 5h - 9h
        array.addObject(["http://www.polymtl.ca", 5, 6, 418, 45.496, -73.617])
        array.addObject(["https://www.imp.polymtl.ca", 5, 6, 1106, 45.505, -73.613])
        array.addObject(["http://www.groupes.polymtl.ca/log6308/index.php", 5, 6, 3118, 45.505, -73.613])
        array.addObject(["https://fr.wikipedia.org", 5, 6, 1286, 45.505, -73.613])
        array.addObject(["http://www.samsung.com", 5, 6, 1777, 45.496, -73.617])
        array.addObject(["https://www.microsoft.com", 5, 6, 3415, 45.496, -73.617])
        array.addObject(["http://fr.euronews.com", 5, 6, 2328, 45.496, -73.617])
        array.addObject(["https://moodle.polymtl.ca", 5, 6, 455, 45.496, -73.617])
        array.addObject(["http://www.footmercato.net", 5, 6, 78, 45.505, -73.613])
        array.addObject(["http://www.lequipe.fr", 5, 6, 34, 45.505, -73.613])
        array.addObject(["http://facebook.com", 5, 6, 56, 45.496, -73.617])
        
        // TimeSolt : 9h - 12h
        
        // TimeSolt : 12h - 14h
        
        // TimeSolt : 14h - 19h
        array.addObject(["http://9gag.com", 5, 15, 3481, 45.496, -73.617])
        array.addObject(["http://www.polymtl.ca", 5, 15, 240, 45.505, -73.613])
        array.addObject(["https://moodle.polymtl.ca", 5, 15, 1154, 45.496, -73.617])
        array.addObject(["http://www.samsung.com", 5, 15, 3372, 45.505, -73.613])
        array.addObject(["http://fr.euronews.com", 5, 15, 3485, 45.496, -73.617])
        array.addObject(["https://mail.google.com", 5, 15, 195, 45.496, -73.617])
        array.addObject(["https://www.microsoft.com", 5, 15, 649, 45.505, -73.613])
        array.addObject(["https://fr.wikipedia.org", 5, 15, 654, 45.505, -73.613])
        array.addObject(["http://www.lemonde.fr", 5, 15, 178, 45.505, -73.613])
        array.addObject(["https://www.imp.polymtl.ca", 5, 15, 28, 45.505, -73.613])
        array.addObject(["https://dossieretudiant.polymtl.ca", 5, 15, 226, 45.505, -73.613])
        array.addObject(["https://www.deezer.com", 5, 15, 9, 45.505, -73.613])
        array.addObject(["http://www.groupes.polymtl.ca/log6308/index.php", 5, 15, 8, 45.496, -73.617])
        array.addObject(["http://www.liberation.fr", 5, 15, 1, 45.496, -73.617])
        
        // TimeSolt : 19h - 24h
        array.addObject(["https://www.microsoft.com", 5, 20, 2677, 45.505, -73.613])
        array.addObject(["http://www.clubic.com", 5, 20, 2691, 45.505, -73.613])
        array.addObject(["https://fr.wikipedia.org", 5, 20, 2866, 45.496, -73.617])
        array.addObject(["http://www.lequipe.fr", 5, 20, 2853, 45.496, -73.617])
        array.addObject(["https://moodle.polymtl.ca", 5, 20, 1525, 45.496, -73.617])
        array.addObject(["https://github.com", 5, 20, 67, 45.505, -73.613])
        array.addObject(["http://www.samsung.com", 5, 20, 833, 45.505, -73.613])
        array.addObject(["http://www.lemonde.fr", 5, 20, 247, 45.496, -73.617])
        array.addObject(["http://www.polymtl.ca", 5, 20, 170, 45.505, -73.613])
        array.addObject(["https://www.imp.polymtl.ca", 5, 20, 282, 45.505, -73.613])
        array.addObject(["https://webmail.minesdedouai.fr", 5, 20, 399, 45.496, -73.617])
        array.addObject(["http://www.groupes.polymtl.ca/log6308/index.php", 5, 20, 870, 45.505, -73.613])
        
        
        
        // Day : Samedi
        // TimeSolt : 0h - 5h
        array.addObject(["https://github.com", 6, 1, 501, 45.496, -73.617])
        array.addObject(["https://webmail.minesdedouai.fr", 6, 1, 1368, 45.496, -73.617])
        array.addObject(["http://www.samsung.com", 6, 1, 2343, 45.505, -73.613])
        array.addObject(["http://www.clubic.com", 6, 1, 2462, 45.505, -73.613])
        array.addObject(["http://www.koreus.com", 6, 1, 3057, 45.496, -73.617])
        array.addObject(["https://dossieretudiant.polymtl.ca", 6, 1, 366, 45.496, -73.617])
        array.addObject(["http://9gag.com", 6, 1, 3010, 45.496, -73.617])
        array.addObject(["http://www.groupes.polymtl.ca/log6308/index.php", 6, 1, 113, 45.505, -73.613])
        array.addObject(["http://fr.euronews.com", 6, 1, 1612, 45.496, -73.617])
        array.addObject(["https://www.deezer.com", 6, 1, 966, 45.496, -73.617])
        array.addObject(["http://www.polymtl.ca", 6, 1, 26, 45.505, -73.613])
        array.addObject(["http://facebook.com", 6, 1, 1, 45.505, -73.613])
        array.addObject(["http://www.lemonde.fr", 6, 1, 11, 45.496, -73.617])
        array.addObject(["https://mail.google.com", 6, 1, 3, 45.496, -73.617])
        array.addObject(["http://www.liberation.fr", 6, 1, 1, 45.505, -73.613])
        
        // TimeSolt : 5h - 9h
        array.addObject(["https://fr.wikipedia.org", 6, 6, 2815, 45.505, -73.613])
        array.addObject(["https://moodle.polymtl.ca", 6, 6, 858, 45.505, -73.613])
        array.addObject(["http://www.polymtl.ca", 6, 6, 2700, 45.496, -73.617])
        array.addObject(["http://www.lemonde.fr", 6, 6, 1569, 45.496, -73.617])
        array.addObject(["https://webmail.minesdedouai.fr", 6, 6, 2657, 45.496, -73.617])
        array.addObject(["http://fr.euronews.com", 6, 6, 187, 45.505, -73.613])
        array.addObject(["https://www.imp.polymtl.ca", 6, 6, 148, 45.505, -73.613])
        array.addObject(["http://www.lequipe.fr", 6, 6, 124, 45.496, -73.617])
        array.addObject(["https://twitter.com", 6, 6, 25, 45.496, -73.617])
        array.addObject(["http://www.clubic.com", 6, 6, 4, 45.505, -73.613])
        array.addObject(["http://www.apple.com", 6, 6, 0, 45.505, -73.613])
        array.addObject(["http://www.samsung.com", 6, 6, 0, 45.505, -73.613])
        array.addObject(["https://github.com", 6, 6, 1, 45.505, -73.613])
        
        // TimeSolt : 9h - 12h
        
        // TimeSolt : 12h - 14h
        
        // TimeSolt : 14h - 19h
        array.addObject(["http://www.clubic.com", 6, 15, 1211, 45.505, -73.613])
        array.addObject(["https://twitter.com", 6, 15, 1847, 45.496, -73.617])
        array.addObject(["https://fr.wikipedia.org", 6, 15, 3078, 45.496, -73.617])
        array.addObject(["http://www.liberation.fr", 6, 15, 1835, 45.505, -73.613])
        array.addObject(["http://www.koreus.com", 6, 15, 2022, 45.505, -73.613])
        array.addObject(["http://fr.euronews.com", 6, 15, 1314, 45.496, -73.617])
        array.addObject(["https://mail.google.com", 6, 15, 1494, 45.496, -73.617])
        array.addObject(["http://www.lequipe.fr", 6, 15, 514, 45.505, -73.613])
        array.addObject(["http://www.lemonde.fr", 6, 15, 551, 45.496, -73.617])
        array.addObject(["https://dossieretudiant.polymtl.ca", 6, 15, 477, 45.496, -73.617])
        array.addObject(["https://webmail.minesdedouai.fr", 6, 15, 6, 45.505, -73.613])
        array.addObject(["http://www.polymtl.ca", 6, 15, 20, 45.496, -73.617])
        array.addObject(["https://www.deezer.com", 6, 15, 3, 45.505, -73.613])
        array.addObject(["http://www.apple.com", 6, 15, 27, 45.496, -73.617])
        array.addObject(["https://www.imp.polymtl.ca", 6, 15, 0, 45.505, -73.613])
        array.addObject(["http://www.samsung.com", 6, 15, 1, 45.505, -73.613])
        
        // TimeSolt : 19h - 24h
        
        
        
        // Day : Dimanche
        // TimeSolt : 0h - 5h
        array.addObject(["https://moodle.polymtl.ca", 7, 1, 1066, 45.496, -73.617])
        array.addObject(["http://www.liberation.fr", 7, 1, 1974, 45.505, -73.613])
        array.addObject(["http://www.apple.com", 7, 1, 1921, 45.496, -73.617])
        array.addObject(["http://www.clubic.com", 7, 1, 1551, 45.505, -73.613])
        array.addObject(["https://www.deezer.com", 7, 1, 2771, 45.505, -73.613])
        array.addObject(["https://fr.wikipedia.org", 7, 1, 2140, 45.505, -73.613])
        array.addObject(["https://dossieretudiant.polymtl.ca", 7, 1, 2539, 45.505, -73.613])
        array.addObject(["http://facebook.com", 7, 1, 54, 45.496, -73.617])
        array.addObject(["http://www.lemonde.fr", 7, 1, 564, 45.505, -73.613])
        array.addObject(["http://www.groupes.polymtl.ca/log6308/index.php", 7, 1, 439, 45.505, -73.613])
        array.addObject(["http://www.polymtl.ca", 7, 1, 198, 45.496, -73.617])
        array.addObject(["https://mail.google.com", 7, 1, 8, 45.505, -73.613])
        array.addObject(["http://fr.euronews.com", 7, 1, 23, 45.496, -73.617])
        array.addObject(["https://twitter.com", 7, 1, 0, 45.496, -73.617])
        array.addObject(["http://www.koreus.com", 7, 1, 17, 45.496, -73.617])
        array.addObject(["https://webmail.minesdedouai.fr", 7, 1, 12, 45.505, -73.613])
        array.addObject(["https://www.microsoft.com", 7, 1, 18, 45.496, -73.617])
        array.addObject(["https://github.com", 7, 1, 2, 45.505, -73.613])
        array.addObject(["http://www.lequipe.fr", 7, 1, 0, 45.505, -73.613])
        
        // TimeSolt : 5h - 9h
        
        // TimeSolt : 9h - 12h
        
        // TimeSolt : 12h - 14h
        
        // TimeSolt : 14h - 19h
        array.addObject(["https://www.imp.polymtl.ca", 7, 15, 515, 45.505, -73.613])
        array.addObject(["http://www.samsung.com", 7, 15, 1526, 45.496, -73.617])
        
        // TimeSolt : 19h - 24h
        
        return array
    }
    
    internal static func getDataArrayForUser6() -> NSArray
    {
        let array = NSMutableArray()
        
        // Day : Lundi
        // TimeSolt : 0h - 5h
        array.addObject(["https://www.jamendo.com", 1, 1, 240, 45.505, -73.613])
        
        // TimeSolt : 5h - 9h
        array.addObject(["https://github.com", 1, 6, 2608, 45.496, -73.617])
        
        // TimeSolt : 9h - 12h
        array.addObject(["https://github.com", 1, 10, 1806, 45.505, -73.613])
        array.addObject(["https://www.jamendo.com", 1, 10, 117, 45.496, -73.617])
        array.addObject(["https://twitter.com", 1, 10, 1847, 45.505, -73.613])
        array.addObject(["http://www.polymtl.ca", 1, 10, 125, 45.505, -73.613])
        array.addObject(["https://moodle.polymtl.ca", 1, 10, 2247, 45.505, -73.613])
        array.addObject(["http://www.liberation.fr", 1, 10, 12, 45.505, -73.613])
        array.addObject(["https://fr.wikipedia.org", 1, 10, 2, 45.496, -73.617])
        
        // TimeSolt : 12h - 14h
        array.addObject(["http://9gag.com", 1, 13, 1766, 45.505, -73.613])
        
        // TimeSolt : 14h - 19h
        array.addObject(["http://fr.euronews.com", 1, 15, 3418, 45.496, -73.617])
        array.addObject(["http://www.lequipe.fr", 1, 15, 1696, 45.496, -73.617])
        array.addObject(["http://www.clubic.com", 1, 15, 1770, 45.496, -73.617])
        array.addObject(["https://www.imp.polymtl.ca", 1, 15, 2360, 45.505, -73.613])
        
        // TimeSolt : 19h - 24h
        array.addObject(["https://github.com", 1, 20, 3083, 45.496, -73.617])
        array.addObject(["http://www.polymtl.ca", 1, 20, 2343, 45.505, -73.613])
        array.addObject(["http://www.lequipe.fr", 1, 20, 1610, 45.505, -73.613])
        array.addObject(["http://9gag.com", 1, 20, 2148, 45.496, -73.617])
        array.addObject(["https://mail.google.com", 1, 20, 883, 45.505, -73.613])
        array.addObject(["https://www.microsoft.com", 1, 20, 614, 45.496, -73.617])
        array.addObject(["http://www.koreus.com", 1, 20, 481, 45.496, -73.617])
        array.addObject(["https://twitter.com", 1, 20, 283, 45.496, -73.617])
        
        
        
        // Day : Mardi
        // TimeSolt : 0h - 5h
        
        // TimeSolt : 5h - 9h
        array.addObject(["http://fr.euronews.com", 2, 6, 1649, 45.505, -73.613])
        
        // TimeSolt : 9h - 12h
        array.addObject(["https://www.jamendo.com", 2, 10, 2069, 45.505, -73.613])
        
        // TimeSolt : 12h - 14h
        array.addObject(["http://www.koreus.com", 2, 13, 2554, 45.505, -73.613])
        array.addObject(["https://mail.google.com", 2, 13, 1081, 45.496, -73.617])
        array.addObject(["http://www.lequipe.fr", 2, 13, 100, 45.505, -73.613])
        array.addObject(["http://www.clubic.com", 2, 13, 2, 45.505, -73.613])
        array.addObject(["http://www.footmercato.net", 2, 13, 607, 45.496, -73.617])
        array.addObject(["http://www.groupes.polymtl.ca/log6308/index.php", 2, 13, 91, 45.505, -73.613])
        array.addObject(["https://fr.wikipedia.org", 2, 13, 8, 45.496, -73.617])
        array.addObject(["http://www.liberation.fr", 2, 13, 10, 45.505, -73.613])
        array.addObject(["http://www.polymtl.ca", 2, 13, 11, 45.505, -73.613])
        
        // TimeSolt : 14h - 19h
        array.addObject(["http://www.clubic.com", 2, 15, 2268, 45.505, -73.613])
        
        // TimeSolt : 19h - 24h
        array.addObject(["http://www.apple.com", 2, 20, 3525, 45.496, -73.617])
        array.addObject(["http://9gag.com", 2, 20, 1995, 45.496, -73.617])
        array.addObject(["https://fr.wikipedia.org", 2, 20, 3225, 45.505, -73.613])
        array.addObject(["https://www.microsoft.com", 2, 20, 1896, 45.496, -73.617])
        array.addObject(["http://facebook.com", 2, 20, 283, 45.496, -73.617])
        array.addObject(["http://fr.euronews.com", 2, 20, 154, 45.496, -73.617])
        array.addObject(["http://www.lequipe.fr", 2, 20, 38, 45.496, -73.617])
        array.addObject(["https://www.imp.polymtl.ca", 2, 20, 1, 45.505, -73.613])
        array.addObject(["https://github.com", 2, 20, 8, 45.505, -73.613])
        
        
        
        // Day : Mercredi
        // TimeSolt : 0h - 5h
        array.addObject(["https://www.jamendo.com", 3, 1, 2442, 45.505, -73.613])
        array.addObject(["http://www.polymtl.ca", 3, 1, 2724, 45.505, -73.613])
        array.addObject(["http://www.liberation.fr", 3, 1, 554, 45.496, -73.617])
        array.addObject(["https://www.imp.polymtl.ca", 3, 1, 1359, 45.505, -73.613])
        array.addObject(["http://www.koreus.com", 3, 1, 2493, 45.496, -73.617])
        array.addObject(["http://www.groupes.polymtl.ca/log6308/index.php", 3, 1, 391, 45.496, -73.617])
        array.addObject(["https://mail.google.com", 3, 1, 236, 45.505, -73.613])
        array.addObject(["http://www.footmercato.net", 3, 1, 309, 45.496, -73.617])
        
        // TimeSolt : 5h - 9h
        array.addObject(["https://dossieretudiant.polymtl.ca", 3, 6, 1831, 45.505, -73.613])
        array.addObject(["https://fr.wikipedia.org", 3, 6, 697, 45.496, -73.617])
        
        // TimeSolt : 9h - 12h
        
        // TimeSolt : 12h - 14h
        array.addObject(["https://mail.google.com", 3, 13, 2830, 45.496, -73.617])
        array.addObject(["http://www.lemonde.fr", 3, 13, 1075, 45.496, -73.617])
        array.addObject(["http://facebook.com", 3, 13, 672, 45.496, -73.617])
        
        // TimeSolt : 14h - 19h
        
        // TimeSolt : 19h - 24h
        
        
        
        // Day : Jeudi
        // TimeSolt : 0h - 5h
        array.addObject(["https://moodle.polymtl.ca", 4, 1, 1241, 45.496, -73.617])
        array.addObject(["http://www.lequipe.fr", 4, 1, 1250, 45.496, -73.617])
        array.addObject(["https://www.microsoft.com", 4, 1, 3003, 45.505, -73.613])
        array.addObject(["http://www.footmercato.net", 4, 1, 811, 45.496, -73.617])
        
        // TimeSolt : 5h - 9h
        array.addObject(["http://facebook.com", 4, 6, 2088, 45.505, -73.613])
        array.addObject(["https://moodle.polymtl.ca", 4, 6, 1917, 45.496, -73.617])
        array.addObject(["https://github.com", 4, 6, 132, 45.496, -73.617])
        array.addObject(["http://9gag.com", 4, 6, 339, 45.496, -73.617])
        array.addObject(["https://www.imp.polymtl.ca", 4, 6, 858, 45.496, -73.617])
        array.addObject(["http://fr.euronews.com", 4, 6, 1207, 45.496, -73.617])
        array.addObject(["http://www.lemonde.fr", 4, 6, 260, 45.505, -73.613])
        array.addObject(["https://www.microsoft.com", 4, 6, 252, 45.505, -73.613])
        array.addObject(["http://www.polymtl.ca", 4, 6, 174, 45.496, -73.617])
        
        // TimeSolt : 9h - 12h
        array.addObject(["http://www.groupes.polymtl.ca/log6308/index.php", 4, 10, 2032, 45.505, -73.613])
        array.addObject(["http://9gag.com", 4, 10, 3595, 45.496, -73.617])
        array.addObject(["http://facebook.com", 4, 10, 762, 45.496, -73.617])
        array.addObject(["http://fr.euronews.com", 4, 10, 878, 45.505, -73.613])
        array.addObject(["http://www.koreus.com", 4, 10, 27, 45.505, -73.613])
        array.addObject(["https://www.jamendo.com", 4, 10, 12, 45.496, -73.617])
        array.addObject(["https://fr.wikipedia.org", 4, 10, 34, 45.496, -73.617])
        array.addObject(["https://dossieretudiant.polymtl.ca", 4, 10, 1, 45.496, -73.617])
        
        // TimeSolt : 12h - 14h
        
        // TimeSolt : 14h - 19h
        
        // TimeSolt : 19h - 24h
        
        
        
        // Day : Vendredi
        // TimeSolt : 0h - 5h
        array.addObject(["http://9gag.com", 5, 1, 598, 45.505, -73.613])
        array.addObject(["http://www.clubic.com", 5, 1, 1106, 45.505, -73.613])
        array.addObject(["http://www.groupes.polymtl.ca/log6308/index.php", 5, 1, 2570, 45.496, -73.617])
        array.addObject(["http://www.polymtl.ca", 5, 1, 565, 45.496, -73.617])
        array.addObject(["http://www.footmercato.net", 5, 1, 2073, 45.496, -73.617])
        array.addObject(["https://github.com", 5, 1, 2652, 45.505, -73.613])
        
        // TimeSolt : 5h - 9h
        array.addObject(["http://www.polymtl.ca", 5, 6, 477, 45.496, -73.617])
        array.addObject(["http://www.groupes.polymtl.ca/log6308/index.php", 5, 6, 1072, 45.496, -73.617])
        array.addObject(["https://twitter.com", 5, 6, 1270, 45.505, -73.613])
        array.addObject(["https://dossieretudiant.polymtl.ca", 5, 6, 192, 45.496, -73.617])
        array.addObject(["http://facebook.com", 5, 6, 1041, 45.496, -73.617])
        array.addObject(["https://mail.google.com", 5, 6, 1813, 45.496, -73.617])
        array.addObject(["https://moodle.polymtl.ca", 5, 6, 371, 45.496, -73.617])
        array.addObject(["http://www.koreus.com", 5, 6, 1738, 45.496, -73.617])
        array.addObject(["http://www.footmercato.net", 5, 6, 279, 45.505, -73.613])
        array.addObject(["https://www.jamendo.com", 5, 6, 43, 45.496, -73.617])
        array.addObject(["http://www.lemonde.fr", 5, 6, 47, 45.505, -73.613])
        array.addObject(["http://www.apple.com", 5, 6, 4, 45.496, -73.617])
        array.addObject(["https://fr.wikipedia.org", 5, 6, 5, 45.505, -73.613])
        
        // TimeSolt : 9h - 12h
        array.addObject(["http://www.apple.com", 5, 10, 2980, 45.505, -73.613])
        
        // TimeSolt : 12h - 14h
        
        // TimeSolt : 14h - 19h
        array.addObject(["http://www.clubic.com", 5, 15, 1989, 45.496, -73.617])
        array.addObject(["https://github.com", 5, 15, 1849, 45.505, -73.613])
        array.addObject(["http://www.apple.com", 5, 15, 243, 45.505, -73.613])
        
        // TimeSolt : 19h - 24h
        array.addObject(["http://www.groupes.polymtl.ca/log6308/index.php", 5, 20, 3464, 45.496, -73.617])
        array.addObject(["http://www.apple.com", 5, 20, 1572, 45.496, -73.617])
        array.addObject(["https://www.imp.polymtl.ca", 5, 20, 210, 45.496, -73.617])
        array.addObject(["https://www.jamendo.com", 5, 20, 3528, 45.496, -73.617])
        array.addObject(["http://www.koreus.com", 5, 20, 3362, 45.505, -73.613])
        array.addObject(["https://github.com", 5, 20, 252, 45.496, -73.617])
        
        
        
        // Day : Samedi
        // TimeSolt : 0h - 5h
        
        // TimeSolt : 5h - 9h
        array.addObject(["http://www.apple.com", 6, 6, 3535, 45.496, -73.617])
        
        // TimeSolt : 9h - 12h
        array.addObject(["https://mail.google.com", 6, 10, 3645, 45.505, -73.613])
        array.addObject(["http://www.polymtl.ca", 6, 10, 456, 45.505, -73.613])
        array.addObject(["https://www.jamendo.com", 6, 10, 1038, 45.505, -73.613])
        array.addObject(["http://facebook.com", 6, 10, 648, 45.496, -73.617])
        
        // TimeSolt : 12h - 14h
        array.addObject(["http://www.footmercato.net", 6, 13, 1662, 45.505, -73.613])
        array.addObject(["http://www.liberation.fr", 6, 13, 1153, 45.505, -73.613])
        array.addObject(["https://fr.wikipedia.org", 6, 13, 650, 45.505, -73.613])
        array.addObject(["https://github.com", 6, 13, 209, 45.505, -73.613])
        array.addObject(["https://www.microsoft.com", 6, 13, 63, 45.505, -73.613])
        array.addObject(["http://www.koreus.com", 6, 13, 133, 45.496, -73.617])
        array.addObject(["http://www.lemonde.fr", 6, 13, 2, 45.496, -73.617])
        array.addObject(["https://dossieretudiant.polymtl.ca", 6, 13, 13, 45.505, -73.613])
        array.addObject(["http://www.apple.com", 6, 13, 1, 45.505, -73.613])
        array.addObject(["http://www.groupes.polymtl.ca/log6308/index.php", 6, 13, 1, 45.496, -73.617])
        
        // TimeSolt : 14h - 19h
        array.addObject(["http://www.groupes.polymtl.ca/log6308/index.php", 6, 15, 1549, 45.496, -73.617])
        array.addObject(["http://9gag.com", 6, 15, 2533, 45.505, -73.613])
        array.addObject(["http://fr.euronews.com", 6, 15, 1456, 45.505, -73.613])
        array.addObject(["http://www.clubic.com", 6, 15, 2189, 45.505, -73.613])
        array.addObject(["https://www.jamendo.com", 6, 15, 884, 45.505, -73.613])
        array.addObject(["https://twitter.com", 6, 15, 506, 45.496, -73.617])
        array.addObject(["http://www.lemonde.fr", 6, 15, 671, 45.496, -73.617])
        array.addObject(["https://www.imp.polymtl.ca", 6, 15, 6, 45.496, -73.617])
        
        // TimeSolt : 19h - 24h
        array.addObject(["https://www.jamendo.com", 6, 20, 2358, 45.505, -73.613])
        array.addObject(["https://www.imp.polymtl.ca", 6, 20, 1096, 45.496, -73.617])
        
        
        
        // Day : Dimanche
        // TimeSolt : 0h - 5h
        
        // TimeSolt : 5h - 9h
        array.addObject(["http://facebook.com", 7, 6, 607, 45.505, -73.613])
        array.addObject(["http://www.apple.com", 7, 6, 1247, 45.496, -73.617])
        array.addObject(["http://www.groupes.polymtl.ca/log6308/index.php", 7, 6, 2502, 45.505, -73.613])
        array.addObject(["http://www.polymtl.ca", 7, 6, 1897, 45.505, -73.613])
        
        // TimeSolt : 9h - 12h
        array.addObject(["http://www.koreus.com", 7, 10, 799, 45.505, -73.613])
        array.addObject(["http://www.apple.com", 7, 10, 368, 45.505, -73.613])
        array.addObject(["https://moodle.polymtl.ca", 7, 10, 303, 45.505, -73.613])
        array.addObject(["https://twitter.com", 7, 10, 1405, 45.505, -73.613])
        array.addObject(["http://www.liberation.fr", 7, 10, 837, 45.496, -73.617])
        array.addObject(["https://www.imp.polymtl.ca", 7, 10, 2232, 45.505, -73.613])
        
        // TimeSolt : 12h - 14h
        
        // TimeSolt : 14h - 19h
        array.addObject(["https://www.jamendo.com", 7, 15, 2909, 45.496, -73.617])
        array.addObject(["https://github.com", 7, 15, 1667, 45.505, -73.613])
        
        // TimeSolt : 19h - 24h
        array.addObject(["https://twitter.com", 7, 20, 2299, 45.496, -73.617])
        array.addObject(["http://www.footmercato.net", 7, 20, 3387, 45.496, -73.617])
        array.addObject(["http://www.groupes.polymtl.ca/log6308/index.php", 7, 20, 1921, 45.505, -73.613])
        
        return array
    }
    
}
