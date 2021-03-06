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
            
            array.add(["https://www.imp.polymtl.ca", day, 9, 2 * 60, 45.496, -73.617])
            array.add(["https://webmail.minesdedouai.fr", day, 10, 10 * 60, 45.496, -73.617])
            array.add(["https://mail.google.com", day, 11, 30 * 60, 45.496, -73.617])
            
            array.add(["https://www.imp.polymtl.ca", day, 14, 3 * 60, 45.496, -73.617])
            array.add(["https://webmail.minesdedouai.fr", day, 14, 5 * 60, 45.496, -73.617])
            array.add(["https://mail.google.com", day, 14, 30 * 60, 45.496, -73.617])
            
            array.add(["http://facebook.com", day, 12, 60 * 60, 45.496, -73.617])
            array.add(["https://twitter.com", day, 12, 10 * 60, 45.496, -73.617])
            array.add(["http://www.footmercato.net", day, 12, 20 * 60, 45.496, -73.617])
            array.add(["http://fr.euronews.com", day, 12, 30 * 60, 45.496, -73.617])
            
            day += 1
        }
        return array
    }
    
    internal static func getDataArrayForUser1() -> NSArray
    {
        let array = NSMutableArray()
        
        // Day : Lundi
        // TimeSolt : 0h - 5h
        
        // TimeSolt : 5h - 9h
        
        // TimeSolt : 9h - 12h
        array.add(["http://www.goldenmoustache.com", 1, 10, 2053, 45.505, -73.613])
        array.add(["https://fr.wikipedia.org", 1, 10, 214, 45.496, -73.617])
        array.add(["http://www.cic.gc.ca", 1, 10, 42, 45.505, -73.613])
        array.add(["http://www.legorafi.fr", 1, 10, 169, 45.496, -73.617])
        array.add(["http://www.6play.fr", 1, 10, 72, 45.496, -73.617])
        array.add(["http://www.lemonde.fr", 1, 10, 10, 45.496, -73.617])
        
        // TimeSolt : 12h - 14h
        
        // TimeSolt : 14h - 19h
        array.add(["http://www.goldenmoustache.com", 1, 15, 2807, 45.505, -73.613])
        array.add(["https://fr.wikipedia.org", 1, 15, 988, 45.496, -73.617])
        array.add(["http://www.cic.gc.ca", 1, 15, 886, 45.505, -73.613])
        array.add(["http://www.legorafi.fr", 1, 15, 62, 45.496, -73.617])
        array.add(["http://www.6play.fr", 1, 15, 2, 45.496, -73.617])
        array.add(["http://www.lemonde.fr", 1, 15, 110, 45.496, -73.617])
        
        // TimeSolt : 19h - 24h
        array.add(["https://moodle.polymtl.ca", 1, 20, 2544, 45.505, -73.613])
        array.add(["https://fr.wikipedia.org", 1, 20, 801, 45.496, -73.617])
        array.add(["https://www.dropbox.com", 1, 20, 968, 45.496, -73.617])
        array.add(["http://www.6play.fr", 1, 20, 59, 45.496, -73.617])
        array.add(["http://stackoverflow.com", 1, 20, 125, 45.496, -73.617])
        array.add(["http://www.cic.gc.ca", 1, 20, 2, 45.505, -73.613])
        
        
        
        // Day : Mardi
        // TimeSolt : 0h - 5h
        
        // TimeSolt : 5h - 9h
        
        // TimeSolt : 9h - 12h
        
        // TimeSolt : 12h - 14h
        
        // TimeSolt : 14h - 19h
        
        // TimeSolt : 19h - 24h
        
        
        
        // Day : Mercredi
        // TimeSolt : 0h - 5h
        array.add(["http://www.lefigaro.fr", 1, 1, 3072, 45.505, -73.613])
        array.add(["http://www.lemonde.fr", 1, 1, 696, 45.496, -73.617])
        array.add(["https://mail.google.com", 1, 1, 2, 45.496, -73.617])
        array.add(["https://twitter.com", 1, 1, 9, 45.496, -73.617])
        array.add(["http://www.cic.gc.ca", 1, 1, 1, 45.496, -73.617])
        
        // TimeSolt : 5h - 9h
        
        // TimeSolt : 9h - 12h
        
        // TimeSolt : 12h - 14h
        array.add(["https://twitter.com", 1, 13, 1085, 45.496, -73.617])
        array.add(["http://www.lefigaro.fr", 1, 13, 565, 45.496, -73.617])
        array.add(["http://stackoverflow.com", 1, 13, 59, 45.496, -73.617])
        
        // TimeSolt : 14h - 19h
        array.add(["http://www.goldenmoustache.com", 1, 15, 3043, 45.505, -73.613])
        array.add(["https://fr.wikipedia.org", 1, 15, 784, 45.496, -73.617])
        array.add(["http://www.cic.gc.ca", 1, 15, 197, 45.505, -73.613])
        array.add(["http://www.legorafi.fr", 1, 15, 44, 45.496, -73.617])
        array.add(["http://www.6play.fr", 1, 15, 48, 45.496, -73.617])
        array.add(["http://www.lemonde.fr", 1, 15, 17, 45.496, -73.617])
        
        // TimeSolt : 19h - 24h
        array.add(["https://moodle.polymtl.ca", 1, 20, 3005, 45.505, -73.613])
        array.add(["https://fr.wikipedia.org", 1, 20, 354, 45.496, -73.617])
        array.add(["https://www.dropbox.com", 1, 20, 297, 45.496, -73.617])
        array.add(["http://www.6play.fr", 1, 20, 314, 45.496, -73.617])
        array.add(["http://stackoverflow.com", 1, 20, 146, 45.496, -73.617])
        array.add(["http://www.cic.gc.ca", 1, 20, 4, 45.505, -73.613])
        
        
        
        // Day : Jeudi
        // TimeSolt : 0h - 5h
        
        // TimeSolt : 5h - 9h
        
        // TimeSolt : 9h - 12h
        array.add(["http://www.legorafi.fr", 4, 10, 2210, 45.496, -73.617])
        array.add(["https://fr.wikipedia.org", 4, 10, 573, 45.496, -73.617])
        
        // TimeSolt : 12h - 14h
        
        // TimeSolt : 14h - 19h
        
        // TimeSolt : 19h - 24h
        array.add(["https://fr.wikipedia.org", 4, 20, 2555, 45.496, -73.617])
        array.add(["https://moodle.polymtl.ca", 4, 20, 1432, 45.496, -73.617])
        array.add(["http://facebook.com", 4, 20, 48, 45.496, -73.617])
        array.add(["http://www.goldenmoustache.com", 4, 20, 264, 45.496, -73.617])
        array.add(["http://www.cic.gc.ca", 4, 20, 158, 45.496, -73.617])
        array.add(["http://www.lemonde.fr", 4, 20, 44, 45.505, -73.613])
        
        
        
        // Day : Vendredi
        // TimeSolt : 0h - 5h
        
        // TimeSolt : 5h - 9h
        
        // TimeSolt : 9h - 12h
        
        // TimeSolt : 12h - 14h
        
        // TimeSolt : 14h - 19h
        
        // TimeSolt : 19h - 24h
        
        
        
        // Day : Samedi
        // TimeSolt : 0h - 5h
        array.add(["https://www.dropbox.com", 6, 1, 921, 45.505, -73.613])
        
        // TimeSolt : 5h - 9h
        
        // TimeSolt : 9h - 12h
        
        // TimeSolt : 12h - 14h
        
        // TimeSolt : 14h - 19h
        
        // TimeSolt : 19h - 24h
        array.add(["https://fr.wikipedia.org", 6, 20, 179, 45.496, -73.617])
        
        
        
        // Day : Dimanche
        // TimeSolt : 0h - 5h
        array.add(["https://www.dropbox.com", 2, 1, 2720, 45.496, -73.617])
        
        // TimeSolt : 5h - 9h
        array.add(["http://stackoverflow.com", 2, 6, 296, 45.505, -73.613])
        array.add(["http://www.6play.fr", 2, 6, 1750, 45.505, -73.613])
        array.add(["http://www.lefigaro.fr", 2, 6, 165, 45.505, -73.613])
        array.add(["https://fr.wikipedia.org", 2, 6, 1275, 45.496, -73.617])
        array.add(["https://webmail.minesdedouai.fr", 2, 6, 38, 45.496, -73.617])
        array.add(["https://twitter.com", 2, 6, 6, 45.496, -73.617])
        array.add(["https://mail.google.com", 2, 6, 15, 45.496, -73.617])
        array.add(["https://www.dropbox.com", 2, 6, 32, 45.496, -73.617])
        array.add(["http://www.cic.gc.ca", 2, 6, 11, 45.505, -73.613])
        
        // TimeSolt : 9h - 12h
        array.add(["https://www.dropbox.com", 2, 10, 2647, 45.496, -73.617])
        
        // TimeSolt : 12h - 14h
        
        // TimeSolt : 14h - 19h
        array.add(["http://stackoverflow.com", 2, 15, 150, 45.505, -73.613])
        array.add(["http://www.lefigaro.fr", 2, 15, 739, 45.505, -73.613])
        
        // TimeSolt : 19h - 24h
        array.add(["https://twitter.com", 2, 20, 697, 45.496, -73.617])
        array.add(["https://webmail.minesdedouai.fr", 2, 20, 805, 45.496, -73.617])
        array.add(["http://www.6play.fr", 2, 20, 1675, 45.505, -73.613])
        
        return array
    }
    
    internal static func getDataArrayForUser2() -> NSArray
    {
        let array = NSMutableArray()
        
        // Day : Lundi
        // TimeSolt : 0h - 5h
        
        // TimeSolt : 5h - 9h
        array.add(["http://www.canalplus.fr", 1, 6, 198, 45.496, -73.617])
        array.add(["http://www.lequipe.fr", 1, 6, 208, 45.505, -73.613])
        array.add(["http://9gag.com", 1, 6, 812, 45.505, -73.613])
        array.add(["http://www.footmercato.net", 1, 6, 3379, 45.496, -73.617])
        array.add(["http://www.apple.com", 1, 6, 153, 45.505, -73.613])
        array.add(["https://fr.wikipedia.org", 1, 6, 2828, 45.505, -73.613])
        array.add(["https://www.deezer.com", 1, 6, 283, 45.496, -73.617])
        array.add(["http://fr.euronews.com", 1, 6, 849, 45.496, -73.617])
        array.add(["http://www.koreus.com", 1, 6, 1826, 45.505, -73.613])
        array.add(["http://stackoverflow.com", 1, 6, 30, 45.505, -73.613])
        array.add(["https://en-marche.fr", 1, 6, 25, 45.496, -73.617])
        array.add(["https://www.e-180.com", 1, 6, 59, 45.505, -73.613])
        array.add(["https://www.origin.com", 1, 6, 2, 45.505, -73.613])
        array.add(["http://facebook.com", 1, 6, 1, 45.505, -73.613])
        array.add(["https://www.microsoft.com", 1, 6, 2, 45.505, -73.613])
        array.add(["http://www.samsung.com", 1, 6, 0, 45.505, -73.613])
        array.add(["http://www.millenium.org", 1, 6, 0, 45.505, -73.613])
        array.add(["https://drive.google.com", 1, 6, 1, 45.505, -73.613])
        
        // TimeSolt : 9h - 12h
        array.add(["https://www.microsoft.com", 1, 10, 242, 45.496, -73.617])
        array.add(["https://www.deezer.com", 1, 10, 3514, 45.505, -73.613])
        array.add(["http://www.millenium.org", 1, 10, 977, 45.505, -73.613])
        array.add(["http://www.melty.fr", 1, 10, 99, 45.505, -73.613])
        array.add(["https://drive.google.com", 1, 10, 2098, 45.496, -73.617])
        array.add(["http://www.economist.com", 1, 10, 50, 45.505, -73.613])
        array.add(["http://www.cic.gc.ca", 1, 10, 15, 45.505, -73.613])
        array.add(["https://mail.google.com", 1, 10, 11, 45.505, -73.613])
        
        // TimeSolt : 12h - 14h
        array.add(["https://moodle.polymtl.ca", 1, 13, 2450, 45.505, -73.613])
        
        // TimeSolt : 14h - 19h
        array.add(["https://www.microsoft.com", 1, 15, 129, 45.496, -73.617])
        array.add(["https://www.deezer.com", 1, 15, 793, 45.505, -73.613])
        array.add(["http://www.millenium.org", 1, 15, 3385, 45.505, -73.613])
        array.add(["http://www.melty.fr", 1, 15, 1204, 45.505, -73.613])
        array.add(["https://drive.google.com", 1, 15, 2614, 45.496, -73.617])
        array.add(["http://www.economist.com", 1, 15, 2242, 45.505, -73.613])
        array.add(["http://www.cic.gc.ca", 1, 15, 2221, 45.505, -73.613])
        array.add(["https://mail.google.com", 1, 15, 52, 45.505, -73.613])
        
        // TimeSolt : 19h - 24h
        
        
        
        // Day : Mardi
        // TimeSolt : 0h - 5h
        array.add(["https://www.microsoft.com", 1, 1, 3183, 45.496, -73.617])
        array.add(["https://www.deezer.com", 1, 1, 1364, 45.505, -73.613])
        array.add(["http://www.millenium.org", 1, 1, 925, 45.505, -73.613])
        array.add(["http://www.melty.fr", 1, 1, 3529, 45.505, -73.613])
        array.add(["https://drive.google.com", 1, 1, 3393, 45.496, -73.617])
        array.add(["http://www.economist.com", 1, 1, 1420, 45.505, -73.613])
        array.add(["http://www.cic.gc.ca", 1, 1, 191, 45.505, -73.613])
        array.add(["https://mail.google.com", 1, 1, 565, 45.505, -73.613])
        
        // TimeSolt : 5h - 9h
        array.add(["http://www.canalplus.fr", 1, 6, 3232, 45.496, -73.617])
        array.add(["http://www.lequipe.fr", 1, 6, 2253, 45.505, -73.613])
        array.add(["http://9gag.com", 1, 6, 1201, 45.505, -73.613])
        array.add(["http://www.footmercato.net", 1, 6, 2480, 45.496, -73.617])
        array.add(["http://www.apple.com", 1, 6, 790, 45.505, -73.613])
        array.add(["https://fr.wikipedia.org", 1, 6, 314, 45.505, -73.613])
        array.add(["https://www.deezer.com", 1, 6, 188, 45.496, -73.617])
        array.add(["http://fr.euronews.com", 1, 6, 15, 45.496, -73.617])
        array.add(["http://www.koreus.com", 1, 6, 9, 45.505, -73.613])
        array.add(["http://stackoverflow.com", 1, 6, 26, 45.505, -73.613])
        array.add(["https://en-marche.fr", 1, 6, 2, 45.496, -73.617])
        array.add(["https://www.e-180.com", 1, 6, 2, 45.505, -73.613])
        
        // TimeSolt : 9h - 12h
        array.add(["http://www.cic.gc.ca", 1, 10, 3659, 45.496, -73.617])
        array.add(["http://fr.euronews.com", 1, 10, 3534, 45.505, -73.613])
        array.add(["https://fr.wikipedia.org", 1, 10, 1077, 45.505, -73.613])
        array.add(["http://9gag.com", 1, 10, 476, 45.505, -73.613])
        array.add(["http://store.steampowered.com", 1, 10, 216, 45.505, -73.613])
        array.add(["https://www.origin.com", 1, 10, 0, 45.496, -73.617])
        array.add(["http://www.liberation.fr", 1, 10, 2, 45.496, -73.617])
        
        // TimeSolt : 12h - 14h
        array.add(["https://moodle.polymtl.ca", 1, 13, 895, 45.505, -73.613])
        
        // TimeSolt : 14h - 19h
        array.add(["http://www.melty.fr", 1, 15, 151, 45.505, -73.613])
        array.add(["https://fr.wikipedia.org", 1, 15, 2014, 45.505, -73.613])
        array.add(["http://www.millenium.org", 1, 15, 3211, 45.505, -73.613])
        array.add(["https://www.spotify.com", 1, 15, 2063, 45.505, -73.613])
        array.add(["https://www.deezer.com", 1, 15, 1230, 45.496, -73.617])
        array.add(["https://dossieretudiant.polymtl.ca", 1, 15, 3439, 45.496, -73.617])
        array.add(["http://www.samsung.com", 1, 15, 1016, 45.505, -73.613])
        array.add(["https://www.e-180.com", 1, 15, 668, 45.496, -73.617])
        array.add(["https://moodle.polymtl.ca", 1, 15, 80, 45.505, -73.613])
        array.add(["http://www.cic.gc.ca", 1, 15, 81, 45.496, -73.617])
        array.add(["https://github.com", 1, 15, 27, 45.496, -73.617])
        array.add(["http://stackoverflow.com", 1, 15, 52, 45.505, -73.613])
        array.add(["http://www.liberation.fr", 1, 15, 8, 45.496, -73.617])
        
        // TimeSolt : 19h - 24h
        
        
        
        // Day : Mercredi
        // TimeSolt : 0h - 5h
        
        // TimeSolt : 5h - 9h
        
        // TimeSolt : 9h - 12h
        
        // TimeSolt : 12h - 14h
        array.add(["http://www.millenium.org", 3, 13, 2581, 45.496, -73.617])
        array.add(["http://stackoverflow.com", 3, 13, 2128, 45.496, -73.617])
        array.add(["http://www.economist.com", 3, 13, 448, 45.496, -73.617])
        array.add(["http://www.lefigaro.fr", 3, 13, 3, 45.505, -73.613])
        array.add(["https://www.jamendo.com", 3, 13, 226, 45.505, -73.613])
        array.add(["https://www.microsoft.com", 3, 13, 8, 45.505, -73.613])
        array.add(["http://9gag.com", 3, 13, 0, 45.505, -73.613])
        
        // TimeSolt : 14h - 19h
        
        // TimeSolt : 19h - 24h
        array.add(["https://moodle.polymtl.ca", 3, 20, 1008, 45.505, -73.613])
        
        
        
        // Day : Jeudi
        // TimeSolt : 0h - 5h
        array.add(["https://www.deezer.com", 4, 1, 232, 45.496, -73.617])
        array.add(["http://www.footmercato.net", 4, 1, 1332, 45.496, -73.617])
        
        // TimeSolt : 5h - 9h
        array.add(["https://en-marche.fr", 4, 6, 1956, 45.496, -73.617])
        array.add(["http://www.lefigaro.fr", 4, 6, 1989, 45.496, -73.617])
        array.add(["http://facebook.com", 4, 6, 3148, 45.496, -73.617])
        array.add(["https://www.origin.com", 4, 6, 3498, 45.496, -73.617])
        array.add(["http://fr.euronews.com", 4, 6, 612, 45.496, -73.617])
        array.add(["http://www.canalplus.fr", 4, 6, 17, 45.505, -73.613])
        array.add(["http://www.samsung.com", 4, 6, 9, 45.505, -73.613])
        array.add(["https://www.deezer.com", 4, 6, 2, 45.505, -73.613])
        array.add(["https://www.jamendo.com", 4, 6, 0, 45.496, -73.617])
        array.add(["http://www.liberation.fr", 4, 6, 1, 45.496, -73.617])
        
        // TimeSolt : 9h - 12h
        array.add(["https://www.deezer.com", 4, 10, 269, 45.496, -73.617])
        array.add(["http://www.footmercato.net", 4, 10, 20, 45.496, -73.617])
        
        // TimeSolt : 12h - 14h
        
        // TimeSolt : 14h - 19h
        
        // TimeSolt : 19h - 24h
        array.add(["http://www.cic.gc.ca", 4, 20, 2307, 45.505, -73.613])
        array.add(["https://moodle.polymtl.ca", 4, 20, 1249, 45.505, -73.613])
        array.add(["http://www.canalplus.fr", 4, 20, 2376, 45.496, -73.617])
        array.add(["http://www.economist.com", 4, 20, 2115, 45.496, -73.617])
        array.add(["http://www.footmercato.net", 4, 20, 2638, 45.496, -73.617])
        array.add(["https://www.deezer.com", 4, 20, 338, 45.496, -73.617])
        array.add(["https://dossieretudiant.polymtl.ca", 4, 20, 198, 45.505, -73.613])
        array.add(["https://www.origin.com", 4, 20, 48, 45.496, -73.617])
        array.add(["http://www.lequipe.fr", 4, 20, 121, 45.496, -73.617])
        array.add(["https://en-marche.fr", 4, 20, 13, 45.496, -73.617])
        
        
        
        // Day : Vendredi
        // TimeSolt : 0h - 5h
        array.add(["http://facebook.com", 5, 1, 1178, 45.496, -73.617])
        array.add(["http://www.footmercato.net", 5, 1, 1453, 45.505, -73.613])
        array.add(["http://www.liberation.fr", 5, 1, 3594, 45.505, -73.613])
        array.add(["http://www.lefigaro.fr", 5, 1, 2099, 45.505, -73.613])
        
        // TimeSolt : 5h - 9h
        array.add(["http://facebook.com", 5, 6, 2494, 45.505, -73.613])
        array.add(["http://www.france3.fr", 5, 6, 2965, 45.496, -73.617])
        array.add(["http://www.apple.com", 5, 6, 2427, 45.496, -73.617])
        array.add(["http://stackoverflow.com", 5, 6, 1575, 45.505, -73.613])
        array.add(["http://www.lefigaro.fr", 5, 6, 316, 45.505, -73.613])
        array.add(["http://www.lequipe.fr", 5, 6, 134, 45.505, -73.613])
        array.add(["http://www.melty.fr", 5, 6, 530, 45.496, -73.617])
        array.add(["http://store.steampowered.com", 5, 6, 21, 45.505, -73.613])
        array.add(["http://9gag.com", 5, 6, 0, 45.505, -73.613])
        
        // TimeSolt : 9h - 12h
        array.add(["https://www.microsoft.com", 5, 10, 382, 45.496, -73.617])
        
        // TimeSolt : 12h - 14h
        array.add(["https://www.deezer.com", 5, 13, 919, 45.496, -73.617])
        array.add(["http://www.canalplus.fr", 5, 13, 1123, 45.505, -73.613])
        array.add(["http://www.koreus.com", 5, 13, 2456, 45.505, -73.613])
        array.add(["https://www.e-180.com", 5, 13, 1129, 45.505, -73.613])
        array.add(["http://facebook.com", 5, 13, 48, 45.496, -73.617])
        array.add(["http://www.lequipe.fr", 5, 13, 105, 45.505, -73.613])
        array.add(["https://www.microsoft.com", 5, 13, 4, 45.505, -73.613])
        array.add(["http://www.millenium.org", 5, 13, 2, 45.505, -73.613])
        array.add(["https://en-marche.fr", 5, 13, 17, 45.505, -73.613])
        array.add(["https://www.jamendo.com", 5, 13, 23, 45.505, -73.613])
        array.add(["https://drive.google.com", 5, 13, 2, 45.496, -73.617])
        array.add(["https://fr.wikipedia.org", 5, 13, 0, 45.505, -73.613])
        array.add(["http://www.footmercato.net", 5, 13, 4, 45.496, -73.617])
        
        // TimeSolt : 14h - 19h
        
        // TimeSolt : 19h - 24h
        
        
        
        // Day : Samedi
        // TimeSolt : 0h - 5h
        array.add(["https://www.microsoft.com", 1, 1, 1531, 45.496, -73.617])
        array.add(["https://www.deezer.com", 1, 1, 408, 45.505, -73.613])
        array.add(["http://www.millenium.org", 1, 1, 849, 45.505, -73.613])
        array.add(["http://www.melty.fr", 1, 1, 2974, 45.505, -73.613])
        array.add(["https://drive.google.com", 1, 1, 902, 45.496, -73.617])
        array.add(["http://www.economist.com", 1, 1, 2929, 45.505, -73.613])
        array.add(["http://www.cic.gc.ca", 1, 1, 497, 45.505, -73.613])
        array.add(["https://mail.google.com", 1, 1, 795, 45.505, -73.613])
        
        // TimeSolt : 5h - 9h
        array.add(["http://www.canalplus.fr", 1, 6, 209, 45.496, -73.617])
        array.add(["http://www.lequipe.fr", 1, 6, 1669, 45.505, -73.613])
        array.add(["http://9gag.com", 1, 6, 949, 45.505, -73.613])
        array.add(["http://www.footmercato.net", 1, 6, 559, 45.496, -73.617])
        array.add(["http://www.apple.com", 1, 6, 1749, 45.505, -73.613])
        array.add(["https://fr.wikipedia.org", 1, 6, 2620, 45.505, -73.613])
        array.add(["https://www.deezer.com", 1, 6, 1034, 45.496, -73.617])
        array.add(["http://fr.euronews.com", 1, 6, 15, 45.496, -73.617])
        array.add(["http://www.koreus.com", 1, 6, 121, 45.505, -73.613])
        array.add(["http://stackoverflow.com", 1, 6, 3, 45.505, -73.613])
        array.add(["https://en-marche.fr", 1, 6, 159, 45.496, -73.617])
        array.add(["https://www.e-180.com", 1, 6, 92, 45.505, -73.613])
        array.add(["https://www.origin.com", 1, 6, 154, 45.505, -73.613])
        array.add(["http://facebook.com", 1, 6, 7, 45.505, -73.613])
        array.add(["https://www.microsoft.com", 1, 6, 20, 45.505, -73.613])
        
        // TimeSolt : 9h - 12h
        array.add(["http://www.cic.gc.ca", 1, 10, 215, 45.496, -73.617])
        array.add(["http://fr.euronews.com", 1, 10, 2776, 45.505, -73.613])
        array.add(["https://fr.wikipedia.org", 1, 10, 1723, 45.505, -73.613])
        array.add(["http://9gag.com", 1, 10, 2372, 45.505, -73.613])
        array.add(["http://store.steampowered.com", 1, 10, 232, 45.505, -73.613])
        array.add(["https://www.origin.com", 1, 10, 1, 45.496, -73.617])
        array.add(["http://www.liberation.fr", 1, 10, 22, 45.496, -73.617])
        array.add(["http://www.ledevoir.com", 1, 10, 0, 45.496, -73.617])
        array.add(["https://www.microsoft.com", 1, 10, 3, 45.505, -73.613])
        
        // TimeSolt : 12h - 14h
        array.add(["https://moodle.polymtl.ca", 1, 13, 779, 45.505, -73.613])
        
        // TimeSolt : 14h - 19h
        array.add(["http://www.melty.fr", 1, 15, 749, 45.505, -73.613])
        array.add(["https://fr.wikipedia.org", 1, 15, 825, 45.505, -73.613])
        array.add(["http://www.millenium.org", 1, 15, 3517, 45.505, -73.613])
        array.add(["https://www.spotify.com", 1, 15, 285, 45.505, -73.613])
        array.add(["https://www.deezer.com", 1, 15, 530, 45.496, -73.617])
        array.add(["https://dossieretudiant.polymtl.ca", 1, 15, 1687, 45.496, -73.617])
        array.add(["http://www.samsung.com", 1, 15, 2048, 45.505, -73.613])
        array.add(["https://www.e-180.com", 1, 15, 2464, 45.496, -73.617])
        array.add(["https://moodle.polymtl.ca", 1, 15, 656, 45.505, -73.613])
        array.add(["http://www.cic.gc.ca", 1, 15, 695, 45.496, -73.617])
        array.add(["https://github.com", 1, 15, 551, 45.496, -73.617])
        array.add(["http://stackoverflow.com", 1, 15, 28, 45.505, -73.613])
        array.add(["http://www.liberation.fr", 1, 15, 1, 45.496, -73.617])
        
        // TimeSolt : 19h - 24h
        
        
        
        // Day : Dimanche
        // TimeSolt : 0h - 5h
        array.add(["https://www.microsoft.com", 1, 1, 657, 45.496, -73.617])
        array.add(["https://www.deezer.com", 1, 1, 1820, 45.505, -73.613])
        array.add(["http://www.millenium.org", 1, 1, 2232, 45.505, -73.613])
        array.add(["http://www.melty.fr", 1, 1, 2463, 45.505, -73.613])
        array.add(["https://drive.google.com", 1, 1, 2662, 45.496, -73.617])
        array.add(["http://www.economist.com", 1, 1, 674, 45.505, -73.613])
        array.add(["http://www.cic.gc.ca", 1, 1, 1366, 45.505, -73.613])
        array.add(["https://mail.google.com", 1, 1, 3, 45.505, -73.613])
        
        // TimeSolt : 5h - 9h
        array.add(["http://www.canalplus.fr", 1, 6, 993, 45.496, -73.617])
        array.add(["http://www.lequipe.fr", 1, 6, 543, 45.505, -73.613])
        array.add(["http://9gag.com", 1, 6, 2633, 45.505, -73.613])
        array.add(["http://www.footmercato.net", 1, 6, 820, 45.496, -73.617])
        array.add(["http://www.apple.com", 1, 6, 1610, 45.505, -73.613])
        array.add(["https://fr.wikipedia.org", 1, 6, 1190, 45.505, -73.613])
        array.add(["https://www.deezer.com", 1, 6, 1655, 45.496, -73.617])
        array.add(["http://fr.euronews.com", 1, 6, 507, 45.496, -73.617])
        array.add(["http://www.koreus.com", 1, 6, 510, 45.505, -73.613])
        array.add(["http://stackoverflow.com", 1, 6, 1457, 45.505, -73.613])
        array.add(["https://en-marche.fr", 1, 6, 16, 45.496, -73.617])
        array.add(["https://www.e-180.com", 1, 6, 264, 45.505, -73.613])
        array.add(["https://www.origin.com", 1, 6, 17, 45.505, -73.613])
        array.add(["http://facebook.com", 1, 6, 1, 45.505, -73.613])
        array.add(["https://www.microsoft.com", 1, 6, 4, 45.505, -73.613])
        array.add(["http://www.samsung.com", 1, 6, 3, 45.505, -73.613])
        array.add(["http://www.millenium.org", 1, 6, 17, 45.505, -73.613])
        
        // TimeSolt : 9h - 12h
        
        // TimeSolt : 12h - 14h
        array.add(["https://moodle.polymtl.ca", 1, 13, 896, 45.505, -73.613])
        
        // TimeSolt : 14h - 19h
        array.add(["http://www.melty.fr", 1, 15, 1574, 45.505, -73.613])
        array.add(["https://fr.wikipedia.org", 1, 15, 611, 45.505, -73.613])
        array.add(["http://www.millenium.org", 1, 15, 2600, 45.505, -73.613])
        array.add(["https://www.spotify.com", 1, 15, 2678, 45.505, -73.613])
        array.add(["https://www.deezer.com", 1, 15, 2091, 45.496, -73.617])
        array.add(["https://dossieretudiant.polymtl.ca", 1, 15, 715, 45.496, -73.617])
        array.add(["http://www.samsung.com", 1, 15, 1154, 45.505, -73.613])
        array.add(["https://www.e-180.com", 1, 15, 95, 45.496, -73.617])
        array.add(["https://moodle.polymtl.ca", 1, 15, 375, 45.505, -73.613])
        array.add(["http://www.cic.gc.ca", 1, 15, 110, 45.496, -73.617])
        array.add(["https://github.com", 1, 15, 6, 45.496, -73.617])
        array.add(["http://stackoverflow.com", 1, 15, 94, 45.505, -73.613])
        array.add(["http://www.liberation.fr", 1, 15, 28, 45.496, -73.617])
        
        // TimeSolt : 19h - 24h
        
        return array
    }
    
    internal static func getDataArrayForUser3() -> NSArray
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
        array.add(["http://www.nytimes.com", 5, 6, 1835, 45.496, -73.617])
        array.add(["https://www.e-180.com", 5, 6, 1556, 45.496, -73.617])
        array.add(["https://slack.com", 5, 6, 208, 45.496, -73.617])
        array.add(["http://www.france2.fr", 5, 6, 287, 45.496, -73.617])
        array.add(["http://www.openclassrooms.com", 5, 6, 1, 45.505, -73.613])
        array.add(["http://www.lesechos.fr", 5, 6, 0, 45.505, -73.613])
        array.add(["http://www.polymtl.ca", 5, 6, 0, 45.496, -73.617])
        
        // TimeSolt : 9h - 12h
        array.add(["https://twitter.com", 5, 10, 803, 45.505, -73.613])
        array.add(["https://www.e-180.com", 5, 10, 1108, 45.496, -73.617])
        array.add(["http://www.millenium.org", 5, 10, 966, 45.505, -73.613])
        array.add(["http://www.consulfrance-montreal.org", 5, 10, 39, 45.496, -73.617])
        
        // TimeSolt : 12h - 14h
        array.add(["https://slack.com", 5, 13, 1558, 45.496, -73.617])
        
        // TimeSolt : 14h - 19h
        array.add(["https://twitter.com", 5, 15, 2978, 45.505, -73.613])
        
        // TimeSolt : 19h - 24h
        array.add(["http://www.millenium.org", 5, 20, 1275, 45.505, -73.613])
        array.add(["http://www.consulfrance-montreal.org", 5, 20, 2250, 45.496, -73.617])
        array.add(["http://www.samsung.com", 5, 20, 214, 45.496, -73.617])
        array.add(["http://fr.euronews.com", 5, 20, 73, 45.505, -73.613])
        array.add(["https://www.e-180.com", 5, 20, 74, 45.496, -73.617])
        array.add(["https://slack.com", 5, 20, 65, 45.505, -73.613])
        
        
        
        // Day : Mercredi
        // TimeSolt : 0h - 5h
        array.add(["http://www.millenium.org", 5, 1, 3263, 45.505, -73.613])
        array.add(["http://www.consulfrance-montreal.org", 5, 1, 1075, 45.496, -73.617])
        array.add(["http://www.samsung.com", 5, 1, 95, 45.496, -73.617])
        array.add(["http://fr.euronews.com", 5, 1, 28, 45.505, -73.613])
        array.add(["https://www.e-180.com", 5, 1, 26, 45.496, -73.617])
        
        // TimeSolt : 5h - 9h
        array.add(["http://www.millenium.org", 5, 6, 1226, 45.505, -73.613])
        array.add(["http://www.consulfrance-montreal.org", 5, 6, 1270, 45.496, -73.617])
        array.add(["http://www.samsung.com", 5, 6, 868, 45.496, -73.617])
        array.add(["http://fr.euronews.com", 5, 6, 407, 45.505, -73.613])
        array.add(["https://www.e-180.com", 5, 6, 83, 45.496, -73.617])
        
        // TimeSolt : 9h - 12h
        array.add(["https://twitter.com", 5, 10, 1487, 45.505, -73.613])
        array.add(["https://www.e-180.com", 5, 10, 34, 45.496, -73.617])
        array.add(["http://www.millenium.org", 5, 10, 297, 45.505, -73.613])
        array.add(["http://www.consulfrance-montreal.org", 5, 10, 231, 45.496, -73.617])
        array.add(["http://www.nytimes.com", 5, 10, 253, 45.505, -73.613])
        array.add(["http://www.openclassrooms.com", 5, 10, 53, 45.505, -73.613])
        array.add(["https://slack.com", 5, 10, 8, 45.505, -73.613])
        array.add(["http://www.france2.fr", 5, 10, 10, 45.505, -73.613])
        array.add(["http://www.polymtl.ca", 5, 10, 2, 45.496, -73.617])
        
        // TimeSolt : 12h - 14h
        array.add(["http://www.millenium.org", 5, 13, 251, 45.505, -73.613])
        array.add(["http://www.consulfrance-montreal.org", 5, 13, 1607, 45.496, -73.617])
        array.add(["http://www.samsung.com", 5, 13, 228, 45.496, -73.617])
        array.add(["http://fr.euronews.com", 5, 13, 2, 45.505, -73.613])
        
        // TimeSolt : 14h - 19h
        array.add(["http://www.millenium.org", 5, 15, 194, 45.505, -73.613])
        array.add(["http://www.consulfrance-montreal.org", 5, 15, 67, 45.496, -73.617])
        array.add(["http://www.samsung.com", 5, 15, 2322, 45.496, -73.617])
        array.add(["http://fr.euronews.com", 5, 15, 442, 45.505, -73.613])
        array.add(["https://www.e-180.com", 5, 15, 326, 45.496, -73.617])
        
        // TimeSolt : 19h - 24h
        array.add(["http://www.millenium.org", 5, 20, 3568, 45.505, -73.613])
        array.add(["http://www.consulfrance-montreal.org", 5, 20, 317, 45.496, -73.617])
        array.add(["http://www.samsung.com", 5, 20, 90, 45.496, -73.617])
        array.add(["http://fr.euronews.com", 5, 20, 349, 45.505, -73.613])
        array.add(["https://www.e-180.com", 5, 20, 35, 45.496, -73.617])
        
        
        
        // Day : Jeudi
        // TimeSolt : 0h - 5h
        array.add(["https://twitter.com", 5, 1, 1458, 45.505, -73.613])
        
        // TimeSolt : 5h - 9h
        array.add(["http://www.nytimes.com", 5, 6, 1373, 45.496, -73.617])
        array.add(["https://www.e-180.com", 5, 6, 555, 45.496, -73.617])
        array.add(["https://slack.com", 5, 6, 1405, 45.496, -73.617])
        array.add(["http://www.france2.fr", 5, 6, 110, 45.496, -73.617])
        array.add(["http://www.openclassrooms.com", 5, 6, 38, 45.505, -73.613])
        array.add(["http://www.lesechos.fr", 5, 6, 5, 45.505, -73.613])
        array.add(["http://www.polymtl.ca", 5, 6, 38, 45.496, -73.617])
        
        // TimeSolt : 9h - 12h
        array.add(["https://twitter.com", 5, 10, 2629, 45.505, -73.613])
        array.add(["https://www.e-180.com", 5, 10, 39, 45.496, -73.617])
        array.add(["http://www.millenium.org", 5, 10, 9, 45.505, -73.613])
        array.add(["http://www.consulfrance-montreal.org", 5, 10, 19, 45.496, -73.617])
        array.add(["http://www.nytimes.com", 5, 10, 45, 45.505, -73.613])
        array.add(["http://www.openclassrooms.com", 5, 10, 67, 45.505, -73.613])
        
        // TimeSolt : 12h - 14h
        array.add(["https://twitter.com", 5, 13, 275, 45.505, -73.613])
        
        // TimeSolt : 14h - 19h
        array.add(["https://twitter.com", 5, 15, 370, 45.505, -73.613])
        
        // TimeSolt : 19h - 24h
        array.add(["http://www.millenium.org", 5, 20, 334, 45.505, -73.613])
        array.add(["http://www.consulfrance-montreal.org", 5, 20, 1970, 45.496, -73.617])
        array.add(["http://www.samsung.com", 5, 20, 1462, 45.496, -73.617])
        array.add(["http://fr.euronews.com", 5, 20, 152, 45.505, -73.613])
        array.add(["https://www.e-180.com", 5, 20, 251, 45.496, -73.617])
        array.add(["https://slack.com", 5, 20, 106, 45.505, -73.613])
        
        
        
        // Day : Vendredi
        // TimeSolt : 0h - 5h
        
        // TimeSolt : 5h - 9h
        array.add(["http://www.nytimes.com", 5, 6, 2266, 45.496, -73.617])
        array.add(["https://www.e-180.com", 5, 6, 799, 45.496, -73.617])
        array.add(["https://slack.com", 5, 6, 27, 45.496, -73.617])
        array.add(["http://www.france2.fr", 5, 6, 5, 45.496, -73.617])
        array.add(["http://www.openclassrooms.com", 5, 6, 4, 45.505, -73.613])
        array.add(["http://www.lesechos.fr", 5, 6, 60, 45.505, -73.613])
        array.add(["http://www.polymtl.ca", 5, 6, 5, 45.496, -73.617])
        
        // TimeSolt : 9h - 12h
        array.add(["https://twitter.com", 5, 10, 1169, 45.505, -73.613])
        array.add(["https://www.e-180.com", 5, 10, 55, 45.496, -73.617])
        array.add(["http://www.millenium.org", 5, 10, 73, 45.505, -73.613])
        array.add(["http://www.consulfrance-montreal.org", 5, 10, 251, 45.496, -73.617])
        array.add(["http://www.nytimes.com", 5, 10, 307, 45.505, -73.613])
        array.add(["http://www.openclassrooms.com", 5, 10, 219, 45.505, -73.613])
        array.add(["https://slack.com", 5, 10, 371, 45.505, -73.613])
        array.add(["http://www.france2.fr", 5, 10, 17, 45.505, -73.613])
        array.add(["http://www.polymtl.ca", 5, 10, 17, 45.496, -73.617])
        
        // TimeSolt : 12h - 14h
        array.add(["https://slack.com", 5, 13, 463, 45.496, -73.617])
        
        // TimeSolt : 14h - 19h
        array.add(["https://twitter.com", 5, 15, 1394, 45.505, -73.613])
        
        // TimeSolt : 19h - 24h
        array.add(["http://www.millenium.org", 5, 20, 2325, 45.505, -73.613])
        array.add(["http://www.consulfrance-montreal.org", 5, 20, 1691, 45.496, -73.617])
        array.add(["http://www.samsung.com", 5, 20, 84, 45.496, -73.617])
        array.add(["http://fr.euronews.com", 5, 20, 22, 45.505, -73.613])
        array.add(["https://www.e-180.com", 5, 20, 2, 45.496, -73.617])
        array.add(["https://slack.com", 5, 20, 10, 45.505, -73.613])
        
        
        
        // Day : Samedi
        // TimeSolt : 0h - 5h
        
        // TimeSolt : 5h - 9h
        array.add(["http://www.nytimes.com", 5, 6, 669, 45.496, -73.617])
        array.add(["https://www.e-180.com", 5, 6, 1532, 45.496, -73.617])
        array.add(["https://slack.com", 5, 6, 238, 45.496, -73.617])
        array.add(["http://www.france2.fr", 5, 6, 616, 45.496, -73.617])
        array.add(["http://www.openclassrooms.com", 5, 6, 503, 45.505, -73.613])
        array.add(["http://www.lesechos.fr", 5, 6, 17, 45.505, -73.613])
        array.add(["http://www.polymtl.ca", 5, 6, 48, 45.496, -73.617])
        
        // TimeSolt : 9h - 12h
        array.add(["https://twitter.com", 5, 10, 1432, 45.505, -73.613])
        array.add(["https://www.e-180.com", 5, 10, 1572, 45.496, -73.617])
        array.add(["http://www.millenium.org", 5, 10, 18, 45.505, -73.613])
        array.add(["http://www.consulfrance-montreal.org", 5, 10, 0, 45.496, -73.617])
        array.add(["http://www.nytimes.com", 5, 10, 2, 45.505, -73.613])
        
        // TimeSolt : 12h - 14h
        array.add(["http://www.nytimes.com", 5, 13, 58, 45.496, -73.617])
        array.add(["https://www.e-180.com", 5, 13, 248, 45.496, -73.617])
        array.add(["https://slack.com", 5, 13, 506, 45.496, -73.617])
        array.add(["http://www.france2.fr", 5, 13, 604, 45.496, -73.617])
        array.add(["http://www.openclassrooms.com", 5, 13, 224, 45.505, -73.613])
        array.add(["http://www.lesechos.fr", 5, 13, 53, 45.505, -73.613])
        array.add(["http://www.polymtl.ca", 5, 13, 33, 45.496, -73.617])
        
        // TimeSolt : 14h - 19h
        array.add(["https://twitter.com", 5, 15, 1269, 45.505, -73.613])
        
        // TimeSolt : 19h - 24h
        array.add(["http://www.nytimes.com", 5, 20, 540, 45.496, -73.617])
        array.add(["https://www.e-180.com", 5, 20, 3297, 45.496, -73.617])
        array.add(["https://slack.com", 5, 20, 485, 45.496, -73.617])
        array.add(["http://www.france2.fr", 5, 20, 238, 45.496, -73.617])
        array.add(["http://www.openclassrooms.com", 5, 20, 209, 45.505, -73.613])
        array.add(["http://www.lesechos.fr", 5, 20, 44, 45.505, -73.613])
        array.add(["http://www.polymtl.ca", 5, 20, 15, 45.496, -73.617])
        
        
        
        // Day : Dimanche
        // TimeSolt : 0h - 5h
        
        // TimeSolt : 5h - 9h
        
        // TimeSolt : 9h - 12h
        array.add(["http://www.openclassrooms.com", 7, 10, 1769, 45.496, -73.617])
        array.add(["http://www.samsung.com", 7, 10, 194, 45.505, -73.613])
        array.add(["http://fr.euronews.com", 7, 10, 1005, 45.496, -73.617])
        
        // TimeSolt : 12h - 14h
        array.add(["http://www.openclassrooms.com", 7, 13, 449, 45.505, -73.613])
        array.add(["https://twitter.com", 7, 13, 729, 45.505, -73.613])
        array.add(["http://www.lesechos.fr", 7, 13, 129, 45.496, -73.617])
        array.add(["https://www.e-180.com", 7, 13, 247, 45.496, -73.617])
        array.add(["http://www.consulfrance-montreal.org", 7, 13, 18, 45.505, -73.613])
        array.add(["http://fr.euronews.com", 7, 13, 0, 45.496, -73.617])
        array.add(["http://www.samsung.com", 7, 13, 11, 45.496, -73.617])
        array.add(["http://www.polymtl.ca", 7, 13, 0, 45.496, -73.617])
        
        // TimeSolt : 14h - 19h
        array.add(["https://www.e-180.com", 7, 15, 816, 45.496, -73.617])
        
        // TimeSolt : 19h - 24h
        
        return array
    }
    
    internal static func getDataArrayForUser4() -> NSArray
    {
        let array = NSMutableArray()
        
        // Day : Lundi
        // TimeSolt : 0h - 5h
        array.add(["http://www.samsung.com", 1, 1, 3570, 45.505, -73.613])
        array.add(["http://www.france2.fr", 1, 1, 1669, 45.505, -73.613])
        
        // TimeSolt : 5h - 9h
        array.add(["http://www.samsung.com", 1, 6, 3443, 45.505, -73.613])
        array.add(["http://www.france2.fr", 1, 6, 626, 45.505, -73.613])
        
        // TimeSolt : 9h - 12h
        
        // TimeSolt : 12h - 14h
        array.add(["http://www.samsung.com", 1, 13, 2286, 45.505, -73.613])
        array.add(["http://www.france2.fr", 1, 13, 1493, 45.505, -73.613])
        
        // TimeSolt : 14h - 19h
        array.add(["http://www.samsung.com", 1, 15, 1612, 45.505, -73.613])
        array.add(["http://www.france2.fr", 1, 15, 1867, 45.505, -73.613])
        
        // TimeSolt : 19h - 24h
        array.add(["http://www.samsung.com", 1, 20, 3483, 45.505, -73.613])
        array.add(["http://www.france2.fr", 1, 20, 2174, 45.505, -73.613])
        
        
        
        // Day : Mardi
        // TimeSolt : 0h - 5h
        array.add(["http://www.nytimes.com", 2, 1, 2032, 45.505, -73.613])
        array.add(["http://www.clubic.com", 2, 1, 2879, 45.505, -73.613])
        array.add(["http://www.ledevoir.com", 2, 1, 2843, 45.505, -73.613])
        array.add(["https://en-marche.fr", 2, 1, 54, 45.505, -73.613])
        array.add(["https://twitter.com", 2, 1, 79, 45.505, -73.613])
        array.add(["http://www.economist.com", 2, 1, 153, 45.505, -73.613])
        array.add(["https://fr.wikipedia.org", 2, 1, 32, 45.505, -73.613])
        array.add(["http://www.samsung.com", 2, 1, 11, 45.496, -73.617])
        array.add(["http://store.steampowered.com", 2, 1, 17, 45.496, -73.617])
        
        // TimeSolt : 5h - 9h
        
        // TimeSolt : 9h - 12h
        array.add(["http://www.nytimes.com", 2, 10, 16, 45.505, -73.613])
        array.add(["http://stackoverflow.com", 2, 10, 1131, 45.505, -73.613])
        array.add(["http://facebook.com", 2, 10, 3117, 45.505, -73.613])
        array.add(["http://store.steampowered.com", 2, 10, 872, 45.496, -73.617])
        array.add(["https://slack.com", 2, 10, 354, 45.505, -73.613])
        array.add(["http://www.samsung.com", 2, 10, 207, 45.496, -73.617])
        array.add(["https://fr.wikipedia.org", 2, 10, 4, 45.496, -73.617])
        array.add(["http://www.economist.com", 2, 10, 14, 45.505, -73.613])
        
        // TimeSolt : 12h - 14h
        array.add(["http://www.lefigaro.fr", 2, 13, 3271, 45.496, -73.617])
        array.add(["https://en-marche.fr", 2, 13, 52, 45.496, -73.617])
        array.add(["http://www.6play.fr", 2, 13, 38, 45.496, -73.617])
        
        // TimeSolt : 14h - 19h
        array.add(["https://en-marche.fr", 2, 15, 801, 45.505, -73.613])
        array.add(["https://slack.com", 2, 15, 827, 45.505, -73.613])
        array.add(["http://facebook.com", 2, 15, 2356, 45.496, -73.617])
        array.add(["http://www.millenium.org", 2, 15, 3355, 45.505, -73.613])
        array.add(["https://fr.wikipedia.org", 2, 15, 192, 45.505, -73.613])
        array.add(["http://www.ledevoir.com", 2, 15, 1631, 45.505, -73.613])
        array.add(["http://www.economist.com", 2, 15, 17, 45.496, -73.617])
        array.add(["http://www.6play.fr", 2, 15, 1, 45.496, -73.617])
        
        // TimeSolt : 19h - 24h
        array.add(["http://www.samsung.com", 2, 20, 2502, 45.505, -73.613])
        array.add(["https://twitter.com", 2, 20, 2137, 45.496, -73.617])
        array.add(["http://facebook.com", 2, 20, 3536, 45.505, -73.613])
        array.add(["http://www.economist.com", 2, 20, 630, 45.505, -73.613])
        
        
        
        // Day : Mercredi
        // TimeSolt : 0h - 5h
        
        // TimeSolt : 5h - 9h
        array.add(["http://www.lefigaro.fr", 3, 6, 1407, 45.505, -73.613])
        array.add(["https://www.imp.polymtl.ca", 3, 6, 1042, 45.496, -73.617])
        array.add(["http://www.millenium.org", 3, 6, 2856, 45.496, -73.617])
        array.add(["http://www.economist.com", 3, 6, 537, 45.496, -73.617])
        array.add(["http://store.steampowered.com", 3, 6, 1809, 45.505, -73.613])
        array.add(["https://twitter.com", 3, 6, 308, 45.505, -73.613])
        array.add(["http://stackoverflow.com", 3, 6, 1, 45.505, -73.613])
        array.add(["http://www.liberation.fr", 3, 6, 74, 45.496, -73.617])
        array.add(["http://www.6play.fr", 3, 6, 14, 45.496, -73.617])
        array.add(["http://www.ledevoir.com", 3, 6, 10, 45.505, -73.613])
        
        // TimeSolt : 9h - 12h
        array.add(["http://store.steampowered.com", 3, 10, 1361, 45.496, -73.617])
        array.add(["http://stackoverflow.com", 3, 10, 1301, 45.505, -73.613])
        array.add(["http://www.6play.fr", 3, 10, 2447, 45.505, -73.613])
        array.add(["http://www.millenium.org", 3, 10, 518, 45.496, -73.617])
        array.add(["http://www.clubic.com", 3, 10, 115, 45.496, -73.617])
        array.add(["http://www.lefigaro.fr", 3, 10, 81, 45.505, -73.613])
        array.add(["https://en-marche.fr", 3, 10, 3, 45.505, -73.613])
        
        // TimeSolt : 12h - 14h
        array.add(["https://fr.wikipedia.org", 3, 13, 146, 45.496, -73.617])
        array.add(["http://www.economist.com", 3, 13, 1742, 45.505, -73.613])
        
        // TimeSolt : 14h - 19h
        
        // TimeSolt : 19h - 24h
        array.add(["http://www.nytimes.com", 3, 20, 3242, 45.496, -73.617])
        array.add(["http://stackoverflow.com", 3, 20, 295, 45.496, -73.617])
        array.add(["http://www.economist.com", 3, 20, 2498, 45.496, -73.617])
        array.add(["https://www.imp.polymtl.ca", 3, 20, 3328, 45.496, -73.617])
        array.add(["http://store.steampowered.com", 3, 20, 579, 45.496, -73.617])
        
        
        
        // Day : Jeudi
        // TimeSolt : 0h - 5h
        array.add(["http://www.economist.com", 4, 1, 2389, 45.505, -73.613])
        array.add(["http://www.nytimes.com", 4, 1, 1831, 45.505, -73.613])
        
        // TimeSolt : 5h - 9h
        
        // TimeSolt : 9h - 12h
        array.add(["http://store.steampowered.com", 4, 10, 443, 45.496, -73.617])
        array.add(["http://www.economist.com", 4, 10, 549, 45.496, -73.617])
        array.add(["http://www.samsung.com", 4, 10, 3275, 45.496, -73.617])
        array.add(["http://www.clubic.com", 4, 10, 818, 45.505, -73.613])
        array.add(["https://slack.com", 4, 10, 514, 45.496, -73.617])
        array.add(["http://www.millenium.org", 4, 10, 280, 45.505, -73.613])
        array.add(["http://www.liberation.fr", 4, 10, 133, 45.505, -73.613])
        
        // TimeSolt : 12h - 14h
        array.add(["http://www.ledevoir.com", 4, 13, 3099, 45.505, -73.613])
        array.add(["http://www.lefigaro.fr", 4, 13, 603, 45.505, -73.613])
        array.add(["https://www.imp.polymtl.ca", 4, 13, 0, 45.496, -73.617])
        array.add(["http://facebook.com", 4, 13, 273, 45.496, -73.617])
        array.add(["http://www.millenium.org", 4, 13, 37, 45.505, -73.613])
        array.add(["http://store.steampowered.com", 4, 13, 4, 45.496, -73.617])
        array.add(["http://www.samsung.com", 4, 13, 4, 45.496, -73.617])
        array.add(["http://www.liberation.fr", 4, 13, 0, 45.496, -73.617])
        array.add(["http://www.economist.com", 4, 13, 4, 45.505, -73.613])
        array.add(["https://slack.com", 4, 13, 0, 45.505, -73.613])
        array.add(["https://fr.wikipedia.org", 4, 13, 8, 45.505, -73.613])
        
        // TimeSolt : 14h - 19h
        
        // TimeSolt : 19h - 24h
        array.add(["http://store.steampowered.com", 4, 20, 2134, 45.496, -73.617])
        array.add(["http://www.economist.com", 4, 20, 1550, 45.496, -73.617])
        array.add(["http://www.samsung.com", 4, 20, 2260, 45.496, -73.617])
        array.add(["http://www.clubic.com", 4, 20, 3115, 45.505, -73.613])
        array.add(["https://slack.com", 4, 20, 1178, 45.496, -73.617])
        array.add(["http://www.millenium.org", 4, 20, 21, 45.505, -73.613])
        array.add(["http://www.liberation.fr", 4, 20, 2, 45.505, -73.613])
        
        
        
        // Day : Vendredi
        // TimeSolt : 0h - 5h
        
        // TimeSolt : 5h - 9h
        array.add(["http://www.samsung.com", 5, 6, 343, 45.505, -73.613])
        array.add(["http://www.millenium.org", 5, 6, 3266, 45.496, -73.617])
        
        // TimeSolt : 9h - 12h
        array.add(["https://slack.com", 5, 10, 1492, 45.496, -73.617])
        array.add(["https://www.imp.polymtl.ca", 5, 10, 1087, 45.496, -73.617])
        array.add(["https://fr.wikipedia.org", 5, 10, 687, 45.496, -73.617])
        array.add(["http://www.economist.com", 5, 10, 546, 45.496, -73.617])
        array.add(["http://www.clubic.com", 5, 10, 349, 45.496, -73.617])
        array.add(["https://en-marche.fr", 5, 10, 506, 45.496, -73.617])
        array.add(["http://www.nytimes.com", 5, 10, 66, 45.505, -73.613])
        array.add(["http://www.millenium.org", 5, 10, 0, 45.496, -73.617])
        
        // TimeSolt : 12h - 14h
        array.add(["http://www.lefigaro.fr", 5, 13, 3160, 45.505, -73.613])
        array.add(["https://slack.com", 5, 13, 94, 45.505, -73.613])
        array.add(["http://facebook.com", 5, 13, 532, 45.496, -73.617])
        array.add(["http://store.steampowered.com", 5, 13, 8, 45.505, -73.613])
        array.add(["http://www.clubic.com", 5, 13, 6, 45.496, -73.617])
        array.add(["https://www.imp.polymtl.ca", 5, 13, 45, 45.496, -73.617])
        array.add(["http://www.france2.fr", 5, 13, 33, 45.496, -73.617])
        array.add(["http://www.samsung.com", 5, 13, 7, 45.496, -73.617])
        array.add(["http://www.nytimes.com", 5, 13, 3, 45.505, -73.613])
        
        // TimeSolt : 14h - 19h
        array.add(["http://www.france2.fr", 5, 15, 3529, 45.505, -73.613])
        array.add(["https://twitter.com", 5, 15, 3314, 45.496, -73.617])
        array.add(["http://www.lefigaro.fr", 5, 15, 1636, 45.496, -73.617])
        
        // TimeSolt : 19h - 24h
        array.add(["http://store.steampowered.com", 5, 20, 2685, 45.505, -73.613])
        array.add(["http://www.france2.fr", 5, 20, 643, 45.496, -73.617])
        array.add(["http://www.millenium.org", 5, 20, 3457, 45.505, -73.613])
        array.add(["http://facebook.com", 5, 20, 368, 45.496, -73.617])
        
        
        
        // Day : Samedi
        // TimeSolt : 0h - 5h
        array.add(["http://www.nytimes.com", 2, 1, 3411, 45.505, -73.613])
        array.add(["http://www.clubic.com", 2, 1, 3607, 45.505, -73.613])
        array.add(["http://www.ledevoir.com", 2, 1, 2054, 45.505, -73.613])
        array.add(["https://en-marche.fr", 2, 1, 11, 45.505, -73.613])
        array.add(["https://twitter.com", 2, 1, 192, 45.505, -73.613])
        array.add(["http://www.economist.com", 2, 1, 85, 45.505, -73.613])
        
        // TimeSolt : 5h - 9h
        
        // TimeSolt : 9h - 12h
        
        // TimeSolt : 12h - 14h
        array.add(["http://www.samsung.com", 2, 13, 334, 45.505, -73.613])
        array.add(["https://twitter.com", 2, 13, 1938, 45.496, -73.617])
        array.add(["http://facebook.com", 2, 13, 418, 45.505, -73.613])
        array.add(["http://www.economist.com", 2, 13, 550, 45.505, -73.613])
        
        // TimeSolt : 14h - 19h
        array.add(["http://www.samsung.com", 2, 15, 1714, 45.505, -73.613])
        array.add(["https://twitter.com", 2, 15, 1688, 45.496, -73.617])
        array.add(["http://facebook.com", 2, 15, 2615, 45.505, -73.613])
        array.add(["http://www.economist.com", 2, 15, 2459, 45.505, -73.613])
        
        // TimeSolt : 19h - 24h
        array.add(["http://www.samsung.com", 2, 20, 955, 45.505, -73.613])
        array.add(["https://twitter.com", 2, 20, 1738, 45.496, -73.617])
        array.add(["http://facebook.com", 2, 20, 2864, 45.505, -73.613])
        array.add(["http://www.economist.com", 2, 20, 663, 45.505, -73.613])
        
        
        
        // Day : Dimanche
        // TimeSolt : 0h - 5h
        array.add(["http://facebook.com", 7, 1, 703, 45.496, -73.617])
        array.add(["http://www.liberation.fr", 7, 1, 1472, 45.505, -73.613])
        array.add(["http://www.nytimes.com", 7, 1, 522, 45.505, -73.613])
        array.add(["http://www.ledevoir.com", 7, 1, 295, 45.496, -73.617])
        
        // TimeSolt : 5h - 9h
        array.add(["https://www.imp.polymtl.ca", 7, 6, 2104, 45.496, -73.617])
        array.add(["https://slack.com", 7, 6, 1066, 45.505, -73.613])
        array.add(["http://stackoverflow.com", 7, 6, 3550, 45.496, -73.617])
        array.add(["http://www.economist.com", 7, 6, 578, 45.505, -73.613])
        array.add(["http://facebook.com", 7, 6, 452, 45.505, -73.613])
        array.add(["http://www.liberation.fr", 7, 6, 18, 45.496, -73.617])
        array.add(["http://store.steampowered.com", 7, 6, 7, 45.496, -73.617])
        
        // TimeSolt : 9h - 12h
        
        // TimeSolt : 12h - 14h
        array.add(["https://en-marche.fr", 7, 13, 2513, 45.496, -73.617])
        array.add(["http://www.samsung.com", 7, 13, 1031, 45.505, -73.613])
        array.add(["http://stackoverflow.com", 7, 13, 236, 45.505, -73.613])
        array.add(["http://www.liberation.fr", 7, 13, 34, 45.505, -73.613])
        array.add(["http://www.clubic.com", 7, 13, 0, 45.505, -73.613])
        array.add(["https://twitter.com", 7, 13, 0, 45.505, -73.613])
        array.add(["http://www.ledevoir.com", 7, 13, 1, 45.496, -73.617])
        
        // TimeSolt : 14h - 19h
        array.add(["http://store.steampowered.com", 7, 15, 2427, 45.505, -73.613])
        array.add(["https://slack.com", 7, 15, 1116, 45.496, -73.617])
        array.add(["http://www.lefigaro.fr", 7, 15, 3090, 45.505, -73.613])
        array.add(["http://www.ledevoir.com", 7, 15, 1216, 45.505, -73.613])
        array.add(["http://facebook.com", 7, 15, 852, 45.505, -73.613])
        
        // TimeSolt : 19h - 24h
        
        return array
    }
    
    internal static func getDataArrayForUser5() -> NSArray
    {
        let array = NSMutableArray()
        
        // Day : Lundi
        // TimeSolt : 0h - 5h
        array.add(["https://en-marche.fr", 5, 1, 485, 45.505, -73.613])
        array.add(["https://slack.com", 5, 1, 1259, 45.496, -73.617])
        array.add(["http://www.goldenmoustache.com", 5, 1, 1445, 45.496, -73.617])
        array.add(["http://www.samsung.com", 5, 1, 3031, 45.496, -73.617])
        
        // TimeSolt : 5h - 9h
        array.add(["http://www.france3.fr", 5, 6, 1046, 45.505, -73.613])
        array.add(["http://www.lemonde.fr", 5, 6, 2294, 45.496, -73.617])
        array.add(["http://www.6play.fr", 5, 6, 1529, 45.496, -73.617])
        array.add(["http://www.polymtl.ca", 5, 6, 2121, 45.496, -73.617])
        array.add(["https://fr.wikipedia.org", 5, 6, 871, 45.496, -73.617])
        array.add(["https://www.jamendo.com", 5, 6, 212, 45.505, -73.613])
        array.add(["http://ici.radio-canada.ca", 5, 6, 768, 45.496, -73.617])
        array.add(["https://en-marche.fr", 5, 6, 4, 45.496, -73.617])
        array.add(["http://www.footmercato.net", 5, 6, 320, 45.505, -73.613])
        array.add(["http://www.apple.com", 5, 6, 20, 45.496, -73.617])
        array.add(["http://store.steampowered.com", 5, 6, 19, 45.496, -73.617])
        array.add(["http://www.groupes.polymtl.ca/log6308/index.php", 5, 6, 3, 45.505, -73.613])
        array.add(["https://slack.com", 5, 6, 6, 45.496, -73.617])
        
        // TimeSolt : 9h - 12h
        array.add(["http://www.lemonde.fr", 5, 10, 2173, 45.505, -73.613])
        
        // TimeSolt : 12h - 14h
        array.add(["http://www.lesechos.fr", 5, 13, 1986, 45.505, -73.613])
        array.add(["https://www.linkedin.com", 5, 13, 251, 45.505, -73.613])
        array.add(["https://moodle.polymtl.ca", 5, 13, 1316, 45.496, -73.617])
        array.add(["http://www.6play.fr", 5, 13, 557, 45.496, -73.617])
        array.add(["http://www.polymtl.ca", 5, 13, 83, 45.505, -73.613])
        array.add(["https://www.e-180.com", 5, 13, 18, 45.505, -73.613])
        array.add(["http://www.france2.fr", 5, 13, 21, 45.505, -73.613])
        array.add(["https://www.microsoft.com", 5, 13, 3, 45.496, -73.617])
        
        // TimeSolt : 14h - 19h
        array.add(["https://en-marche.fr", 5, 15, 2817, 45.505, -73.613])
        array.add(["https://webmail.minesdedouai.fr", 5, 15, 3527, 45.505, -73.613])
        array.add(["http://www.apple.com", 5, 15, 1588, 45.505, -73.613])
        array.add(["https://moodle.polymtl.ca", 5, 15, 1034, 45.496, -73.617])
        array.add(["https://dossieretudiant.polymtl.ca", 5, 15, 842, 45.505, -73.613])
        array.add(["https://www.imp.polymtl.ca", 5, 15, 399, 45.505, -73.613])
        array.add(["http://www.lesechos.fr", 5, 15, 0, 45.496, -73.617])
        array.add(["https://fr.wikipedia.org", 5, 15, 34, 45.496, -73.617])
        array.add(["http://ici.radio-canada.ca", 5, 15, 13, 45.496, -73.617])
        array.add(["http://www.lequipe.fr", 5, 15, 4, 45.496, -73.617])
        array.add(["http://www.polymtl.ca", 5, 15, 0, 45.496, -73.617])
        array.add(["https://www.e-180.com", 5, 15, 1, 45.505, -73.613])
        array.add(["http://www.lemonde.fr", 5, 15, 0, 45.505, -73.613])
        array.add(["http://www.goldenmoustache.com", 5, 15, 0, 45.505, -73.613])
        array.add(["http://9gag.com", 5, 15, 1, 45.505, -73.613])
        
        // TimeSolt : 19h - 24h
        array.add(["https://moodle.polymtl.ca", 5, 20, 3379, 45.505, -73.613])
        array.add(["http://www.6play.fr", 5, 20, 1826, 45.496, -73.617])
        array.add(["http://www.lesechos.fr", 5, 20, 1507, 45.505, -73.613])
        array.add(["https://slack.com", 5, 20, 254, 45.496, -73.617])
        array.add(["https://www.e-180.com", 5, 20, 3640, 45.496, -73.617])
        array.add(["https://drive.google.com", 5, 20, 148, 45.505, -73.613])
        array.add(["http://www.canalplus.fr", 5, 20, 21, 45.496, -73.617])
        array.add(["https://www.linkedin.com", 5, 20, 0, 45.505, -73.613])
        array.add(["http://www.goldenmoustache.com", 5, 20, 6, 45.505, -73.613])
        array.add(["http://9gag.com", 5, 20, 15, 45.505, -73.613])
        array.add(["http://facebook.com", 5, 20, 4, 45.496, -73.617])
        
        
        
        // Day : Mardi
        // TimeSolt : 0h - 5h
        array.add(["https://en-marche.fr", 5, 1, 2180, 45.505, -73.613])
        array.add(["https://slack.com", 5, 1, 260, 45.496, -73.617])
        array.add(["http://www.goldenmoustache.com", 5, 1, 2784, 45.496, -73.617])
        array.add(["http://www.samsung.com", 5, 1, 11, 45.496, -73.617])
        
        // TimeSolt : 5h - 9h
        array.add(["http://www.france3.fr", 5, 6, 3415, 45.505, -73.613])
        array.add(["http://www.lemonde.fr", 5, 6, 217, 45.496, -73.617])
        array.add(["http://www.6play.fr", 5, 6, 621, 45.496, -73.617])
        array.add(["http://www.polymtl.ca", 5, 6, 2032, 45.496, -73.617])
        array.add(["https://fr.wikipedia.org", 5, 6, 1072, 45.496, -73.617])
        array.add(["https://www.jamendo.com", 5, 6, 255, 45.505, -73.613])
        array.add(["http://ici.radio-canada.ca", 5, 6, 86, 45.496, -73.617])
        array.add(["https://en-marche.fr", 5, 6, 3, 45.496, -73.617])
        array.add(["http://www.footmercato.net", 5, 6, 44, 45.505, -73.613])
        array.add(["http://www.apple.com", 5, 6, 3, 45.496, -73.617])
        array.add(["http://store.steampowered.com", 5, 6, 27, 45.496, -73.617])
        array.add(["http://www.groupes.polymtl.ca/log6308/index.php", 5, 6, 1, 45.505, -73.613])
        
        // TimeSolt : 9h - 12h
        array.add(["http://www.lemonde.fr", 5, 10, 2129, 45.505, -73.613])
        
        // TimeSolt : 12h - 14h
        array.add(["http://www.lesechos.fr", 5, 13, 2213, 45.505, -73.613])
        array.add(["https://www.linkedin.com", 5, 13, 993, 45.505, -73.613])
        array.add(["https://moodle.polymtl.ca", 5, 13, 771, 45.496, -73.617])
        array.add(["http://www.6play.fr", 5, 13, 63, 45.496, -73.617])
        array.add(["http://www.polymtl.ca", 5, 13, 141, 45.505, -73.613])
        array.add(["https://www.e-180.com", 5, 13, 21, 45.505, -73.613])
        array.add(["http://www.france2.fr", 5, 13, 12, 45.505, -73.613])
        array.add(["https://www.microsoft.com", 5, 13, 2, 45.496, -73.617])
        
        // TimeSolt : 14h - 19h
        array.add(["https://en-marche.fr", 5, 15, 562, 45.505, -73.613])
        array.add(["https://webmail.minesdedouai.fr", 5, 15, 2183, 45.505, -73.613])
        array.add(["http://www.apple.com", 5, 15, 211, 45.505, -73.613])
        array.add(["https://moodle.polymtl.ca", 5, 15, 2173, 45.496, -73.617])
        array.add(["https://dossieretudiant.polymtl.ca", 5, 15, 2367, 45.505, -73.613])
        array.add(["https://www.imp.polymtl.ca", 5, 15, 1665, 45.505, -73.613])
        array.add(["http://www.lesechos.fr", 5, 15, 0, 45.496, -73.617])
        array.add(["https://fr.wikipedia.org", 5, 15, 3, 45.496, -73.617])
        array.add(["http://ici.radio-canada.ca", 5, 15, 11, 45.496, -73.617])
        array.add(["http://www.lequipe.fr", 5, 15, 0, 45.496, -73.617])
        array.add(["http://www.polymtl.ca", 5, 15, 3, 45.496, -73.617])
        array.add(["https://www.e-180.com", 5, 15, 2, 45.505, -73.613])
        
        // TimeSolt : 19h - 24h
        array.add(["https://moodle.polymtl.ca", 5, 20, 1944, 45.505, -73.613])
        array.add(["http://www.6play.fr", 5, 20, 1257, 45.496, -73.617])
        array.add(["http://www.lesechos.fr", 5, 20, 3199, 45.505, -73.613])
        array.add(["https://slack.com", 5, 20, 2242, 45.496, -73.617])
        array.add(["https://www.e-180.com", 5, 20, 107, 45.496, -73.617])
        array.add(["https://drive.google.com", 5, 20, 221, 45.505, -73.613])
        array.add(["http://www.canalplus.fr", 5, 20, 188, 45.496, -73.617])
        array.add(["https://www.linkedin.com", 5, 20, 9, 45.505, -73.613])
        array.add(["http://www.goldenmoustache.com", 5, 20, 1, 45.505, -73.613])
        array.add(["http://9gag.com", 5, 20, 2, 45.505, -73.613])
        array.add(["http://facebook.com", 5, 20, 5, 45.496, -73.617])
        
        
        
        // Day : Mercredi
        // TimeSolt : 0h - 5h
        array.add(["https://en-marche.fr", 5, 1, 3349, 45.505, -73.613])
        array.add(["https://slack.com", 5, 1, 1544, 45.496, -73.617])
        array.add(["http://www.goldenmoustache.com", 5, 1, 1933, 45.496, -73.617])
        array.add(["http://www.samsung.com", 5, 1, 3143, 45.496, -73.617])
        
        // TimeSolt : 5h - 9h
        array.add(["http://www.france3.fr", 5, 6, 993, 45.505, -73.613])
        array.add(["http://www.lemonde.fr", 5, 6, 379, 45.496, -73.617])
        array.add(["http://www.6play.fr", 5, 6, 1392, 45.496, -73.617])
        array.add(["http://www.polymtl.ca", 5, 6, 210, 45.496, -73.617])
        array.add(["https://fr.wikipedia.org", 5, 6, 1719, 45.496, -73.617])
        array.add(["https://www.jamendo.com", 5, 6, 3010, 45.505, -73.613])
        array.add(["http://ici.radio-canada.ca", 5, 6, 180, 45.496, -73.617])
        array.add(["https://en-marche.fr", 5, 6, 159, 45.496, -73.617])
        array.add(["http://www.footmercato.net", 5, 6, 104, 45.505, -73.613])
        array.add(["http://www.apple.com", 5, 6, 26, 45.496, -73.617])
        array.add(["http://store.steampowered.com", 5, 6, 6, 45.496, -73.617])
        array.add(["http://www.groupes.polymtl.ca/log6308/index.php", 5, 6, 6, 45.505, -73.613])
        array.add(["https://slack.com", 5, 6, 7, 45.496, -73.617])
        
        // TimeSolt : 9h - 12h
        array.add(["http://www.lemonde.fr", 5, 10, 3221, 45.505, -73.613])
        
        // TimeSolt : 12h - 14h
        array.add(["http://www.lesechos.fr", 5, 13, 1969, 45.505, -73.613])
        array.add(["https://www.linkedin.com", 5, 13, 1981, 45.505, -73.613])
        array.add(["https://moodle.polymtl.ca", 5, 13, 369, 45.496, -73.617])
        array.add(["http://www.6play.fr", 5, 13, 234, 45.496, -73.617])
        array.add(["http://www.polymtl.ca", 5, 13, 159, 45.505, -73.613])
        array.add(["https://www.e-180.com", 5, 13, 34, 45.505, -73.613])
        array.add(["http://www.france2.fr", 5, 13, 2, 45.505, -73.613])
        array.add(["https://www.microsoft.com", 5, 13, 2, 45.496, -73.617])
        
        // TimeSolt : 14h - 19h
        array.add(["https://en-marche.fr", 5, 15, 530, 45.505, -73.613])
        array.add(["https://webmail.minesdedouai.fr", 5, 15, 832, 45.505, -73.613])
        array.add(["http://www.apple.com", 5, 15, 804, 45.505, -73.613])
        array.add(["https://moodle.polymtl.ca", 5, 15, 331, 45.496, -73.617])
        array.add(["https://dossieretudiant.polymtl.ca", 5, 15, 389, 45.505, -73.613])
        array.add(["https://www.imp.polymtl.ca", 5, 15, 1217, 45.505, -73.613])
        array.add(["http://www.lesechos.fr", 5, 15, 120, 45.496, -73.617])
        array.add(["https://fr.wikipedia.org", 5, 15, 3276, 45.496, -73.617])
        array.add(["http://ici.radio-canada.ca", 5, 15, 1333, 45.496, -73.617])
        array.add(["http://www.lequipe.fr", 5, 15, 2475, 45.496, -73.617])
        array.add(["http://www.polymtl.ca", 5, 15, 325, 45.496, -73.617])
        array.add(["https://www.e-180.com", 5, 15, 35, 45.505, -73.613])
        array.add(["http://www.lemonde.fr", 5, 15, 15, 45.505, -73.613])
        array.add(["http://www.goldenmoustache.com", 5, 15, 1, 45.505, -73.613])
        array.add(["http://9gag.com", 5, 15, 7, 45.505, -73.613])
        array.add(["http://www.studiobagel.com", 5, 15, 5, 45.496, -73.617])
        array.add(["http://store.steampowered.com", 5, 15, 3, 45.505, -73.613])
        array.add(["http://www.france3.fr", 5, 15, 2, 45.496, -73.617])
        
        // TimeSolt : 19h - 24h
        array.add(["https://moodle.polymtl.ca", 5, 20, 726, 45.505, -73.613])
        array.add(["http://www.6play.fr", 5, 20, 2251, 45.496, -73.617])
        array.add(["http://www.lesechos.fr", 5, 20, 3063, 45.505, -73.613])
        array.add(["https://slack.com", 5, 20, 491, 45.496, -73.617])
        array.add(["https://www.e-180.com", 5, 20, 94, 45.496, -73.617])
        array.add(["https://drive.google.com", 5, 20, 2652, 45.505, -73.613])
        array.add(["http://www.canalplus.fr", 5, 20, 420, 45.496, -73.617])
        array.add(["https://www.linkedin.com", 5, 20, 1702, 45.505, -73.613])
        array.add(["http://www.goldenmoustache.com", 5, 20, 323, 45.505, -73.613])
        array.add(["http://9gag.com", 5, 20, 13, 45.505, -73.613])
        array.add(["http://facebook.com", 5, 20, 8, 45.496, -73.617])
        
        
        
        // Day : Jeudi
        // TimeSolt : 0h - 5h
        
        // TimeSolt : 5h - 9h
        array.add(["http://www.lemonde.fr", 5, 6, 2566, 45.505, -73.613])
        
        // TimeSolt : 9h - 12h
        
        // TimeSolt : 12h - 14h
        
        // TimeSolt : 14h - 19h
        array.add(["https://en-marche.fr", 5, 15, 3081, 45.505, -73.613])
        array.add(["https://webmail.minesdedouai.fr", 5, 15, 2306, 45.505, -73.613])
        array.add(["http://www.apple.com", 5, 15, 397, 45.505, -73.613])
        array.add(["https://moodle.polymtl.ca", 5, 15, 1255, 45.496, -73.617])
        array.add(["https://dossieretudiant.polymtl.ca", 5, 15, 813, 45.505, -73.613])
        array.add(["https://www.imp.polymtl.ca", 5, 15, 984, 45.505, -73.613])
        array.add(["http://www.lesechos.fr", 5, 15, 177, 45.496, -73.617])
        array.add(["https://fr.wikipedia.org", 5, 15, 6, 45.496, -73.617])
        array.add(["http://ici.radio-canada.ca", 5, 15, 286, 45.496, -73.617])
        array.add(["http://www.lequipe.fr", 5, 15, 49, 45.496, -73.617])
        array.add(["http://www.polymtl.ca", 5, 15, 2, 45.496, -73.617])
        array.add(["https://www.e-180.com", 5, 15, 2, 45.505, -73.613])
        array.add(["http://www.lemonde.fr", 5, 15, 1, 45.505, -73.613])
        array.add(["http://www.goldenmoustache.com", 5, 15, 1, 45.505, -73.613])
        
        // TimeSolt : 19h - 24h
        array.add(["https://en-marche.fr", 5, 20, 2929, 45.505, -73.613])
        array.add(["https://slack.com", 5, 20, 259, 45.496, -73.617])
        array.add(["http://www.goldenmoustache.com", 5, 20, 780, 45.496, -73.617])
        array.add(["http://www.samsung.com", 5, 20, 684, 45.496, -73.617])
        
        
        
        // Day : Vendredi
        // TimeSolt : 0h - 5h
        array.add(["https://en-marche.fr", 5, 1, 2197, 45.505, -73.613])
        array.add(["https://slack.com", 5, 1, 538, 45.496, -73.617])
        array.add(["http://www.goldenmoustache.com", 5, 1, 2488, 45.496, -73.617])
        array.add(["http://www.samsung.com", 5, 1, 2459, 45.496, -73.617])
        
        // TimeSolt : 5h - 9h
        
        // TimeSolt : 9h - 12h
        
        // TimeSolt : 12h - 14h
        
        // TimeSolt : 14h - 19h
        array.add(["https://en-marche.fr", 5, 15, 2112, 45.505, -73.613])
        array.add(["https://webmail.minesdedouai.fr", 5, 15, 1307, 45.505, -73.613])
        array.add(["http://www.apple.com", 5, 15, 2500, 45.505, -73.613])
        array.add(["https://moodle.polymtl.ca", 5, 15, 362, 45.496, -73.617])
        array.add(["https://dossieretudiant.polymtl.ca", 5, 15, 1894, 45.505, -73.613])
        array.add(["https://www.imp.polymtl.ca", 5, 15, 3261, 45.505, -73.613])
        array.add(["http://www.lesechos.fr", 5, 15, 71, 45.496, -73.617])
        array.add(["https://fr.wikipedia.org", 5, 15, 11, 45.496, -73.617])
        array.add(["http://ici.radio-canada.ca", 5, 15, 0, 45.496, -73.617])
        array.add(["http://www.lequipe.fr", 5, 15, 1, 45.496, -73.617])
        array.add(["http://www.polymtl.ca", 5, 15, 0, 45.496, -73.617])
        array.add(["https://www.e-180.com", 5, 15, 1, 45.505, -73.613])
        
        // TimeSolt : 19h - 24h
        array.add(["https://moodle.polymtl.ca", 5, 20, 2618, 45.505, -73.613])
        array.add(["http://www.6play.fr", 5, 20, 2377, 45.496, -73.617])
        array.add(["http://www.lesechos.fr", 5, 20, 625, 45.505, -73.613])
        array.add(["https://slack.com", 5, 20, 2941, 45.496, -73.617])
        array.add(["https://www.e-180.com", 5, 20, 820, 45.496, -73.617])
        array.add(["https://drive.google.com", 5, 20, 406, 45.505, -73.613])
        array.add(["http://www.canalplus.fr", 5, 20, 605, 45.496, -73.617])
        array.add(["https://www.linkedin.com", 5, 20, 90, 45.505, -73.613])
        array.add(["http://www.goldenmoustache.com", 5, 20, 219, 45.505, -73.613])
        array.add(["http://9gag.com", 5, 20, 51, 45.505, -73.613])
        array.add(["http://facebook.com", 5, 20, 39, 45.496, -73.617])
        
        
        
        // Day : Samedi
        // TimeSolt : 0h - 5h
        array.add(["https://en-marche.fr", 5, 1, 3021, 45.505, -73.613])
        array.add(["https://slack.com", 5, 1, 1135, 45.496, -73.617])
        array.add(["http://www.goldenmoustache.com", 5, 1, 1742, 45.496, -73.617])
        array.add(["http://www.samsung.com", 5, 1, 3264, 45.496, -73.617])
        
        // TimeSolt : 5h - 9h
        array.add(["http://www.france3.fr", 5, 6, 3157, 45.505, -73.613])
        array.add(["http://www.lemonde.fr", 5, 6, 1850, 45.496, -73.617])
        array.add(["http://www.6play.fr", 5, 6, 1704, 45.496, -73.617])
        array.add(["http://www.polymtl.ca", 5, 6, 899, 45.496, -73.617])
        array.add(["https://fr.wikipedia.org", 5, 6, 626, 45.496, -73.617])
        array.add(["https://www.jamendo.com", 5, 6, 14, 45.505, -73.613])
        array.add(["http://ici.radio-canada.ca", 5, 6, 28, 45.496, -73.617])
        array.add(["https://en-marche.fr", 5, 6, 45, 45.496, -73.617])
        array.add(["http://www.footmercato.net", 5, 6, 12, 45.505, -73.613])
        array.add(["http://www.apple.com", 5, 6, 5, 45.496, -73.617])
        array.add(["http://store.steampowered.com", 5, 6, 5, 45.496, -73.617])
        array.add(["http://www.groupes.polymtl.ca/log6308/index.php", 5, 6, 2, 45.505, -73.613])
        array.add(["https://slack.com", 5, 6, 3, 45.496, -73.617])
        
        // TimeSolt : 9h - 12h
        array.add(["http://www.lemonde.fr", 5, 10, 2558, 45.505, -73.613])
        
        // TimeSolt : 12h - 14h
        array.add(["http://www.lesechos.fr", 5, 13, 2977, 45.505, -73.613])
        array.add(["https://www.linkedin.com", 5, 13, 452, 45.505, -73.613])
        array.add(["https://moodle.polymtl.ca", 5, 13, 348, 45.496, -73.617])
        array.add(["http://www.6play.fr", 5, 13, 33, 45.496, -73.617])
        array.add(["http://www.polymtl.ca", 5, 13, 82, 45.505, -73.613])
        array.add(["https://www.e-180.com", 5, 13, 42, 45.505, -73.613])
        array.add(["http://www.france2.fr", 5, 13, 0, 45.505, -73.613])
        array.add(["https://www.microsoft.com", 5, 13, 92, 45.496, -73.617])
        
        // TimeSolt : 14h - 19h
        array.add(["https://en-marche.fr", 5, 15, 2650, 45.505, -73.613])
        array.add(["https://webmail.minesdedouai.fr", 5, 15, 45, 45.505, -73.613])
        array.add(["http://www.apple.com", 5, 15, 1617, 45.505, -73.613])
        array.add(["https://moodle.polymtl.ca", 5, 15, 3367, 45.496, -73.617])
        array.add(["https://dossieretudiant.polymtl.ca", 5, 15, 1341, 45.505, -73.613])
        array.add(["https://www.imp.polymtl.ca", 5, 15, 464, 45.505, -73.613])
        array.add(["http://www.lesechos.fr", 5, 15, 909, 45.496, -73.617])
        array.add(["https://fr.wikipedia.org", 5, 15, 398, 45.496, -73.617])
        array.add(["http://ici.radio-canada.ca", 5, 15, 75, 45.496, -73.617])
        array.add(["http://www.lequipe.fr", 5, 15, 63, 45.496, -73.617])
        array.add(["http://www.polymtl.ca", 5, 15, 11, 45.496, -73.617])
        array.add(["https://www.e-180.com", 5, 15, 5, 45.505, -73.613])
        array.add(["http://www.lemonde.fr", 5, 15, 6, 45.505, -73.613])
        array.add(["http://www.goldenmoustache.com", 5, 15, 1, 45.505, -73.613])
        array.add(["http://9gag.com", 5, 15, 8, 45.505, -73.613])
        array.add(["http://www.studiobagel.com", 5, 15, 7, 45.496, -73.617])
        array.add(["http://store.steampowered.com", 5, 15, 11, 45.505, -73.613])
        array.add(["http://www.france3.fr", 5, 15, 0, 45.496, -73.617])
        
        // TimeSolt : 19h - 24h
        array.add(["https://moodle.polymtl.ca", 5, 20, 3342, 45.505, -73.613])
        array.add(["http://www.6play.fr", 5, 20, 3622, 45.496, -73.617])
        array.add(["http://www.lesechos.fr", 5, 20, 2928, 45.505, -73.613])
        array.add(["https://slack.com", 5, 20, 1546, 45.496, -73.617])
        array.add(["https://www.e-180.com", 5, 20, 396, 45.496, -73.617])
        array.add(["https://drive.google.com", 5, 20, 34, 45.505, -73.613])
        array.add(["http://www.canalplus.fr", 5, 20, 7, 45.496, -73.617])
        array.add(["https://www.linkedin.com", 5, 20, 0, 45.505, -73.613])
        array.add(["http://www.goldenmoustache.com", 5, 20, 4, 45.505, -73.613])
        array.add(["http://9gag.com", 5, 20, 1, 45.505, -73.613])
        
        
        
        // Day : Dimanche
        // TimeSolt : 0h - 5h
        
        // TimeSolt : 5h - 9h
        
        // TimeSolt : 9h - 12h
        
        // TimeSolt : 12h - 14h
        
        // TimeSolt : 14h - 19h
        array.add(["http://facebook.com", 7, 15, 2914, 45.505, -73.613])
        array.add(["http://9gag.com", 7, 15, 438, 45.496, -73.617])
        array.add(["http://store.steampowered.com", 7, 15, 1878, 45.496, -73.617])
        array.add(["http://www.france3.fr", 7, 15, 3506, 45.505, -73.613])
        array.add(["https://moodle.polymtl.ca", 7, 15, 25, 45.505, -73.613])
        array.add(["https://drive.google.com", 7, 15, 184, 45.496, -73.617])
        array.add(["https://webmail.minesdedouai.fr", 7, 15, 41, 45.496, -73.617])
        array.add(["https://github.com", 7, 15, 6, 45.505, -73.613])
        array.add(["http://www.lequipe.fr", 7, 15, 5, 45.496, -73.617])
        
        // TimeSolt : 19h - 24h
        array.add(["https://en-marche.fr", 7, 20, 2917, 45.496, -73.617])
        array.add(["http://www.goldenmoustache.com", 7, 20, 664, 45.505, -73.613])
        array.add(["http://www.groupes.polymtl.ca/log6308/index.php", 7, 20, 1608, 45.496, -73.617])
        array.add(["http://store.steampowered.com", 7, 20, 2383, 45.505, -73.613])
        array.add(["http://www.lesechos.fr", 7, 20, 1788, 45.505, -73.613])
        array.add(["http://www.polymtl.ca", 7, 20, 1448, 45.496, -73.617])
        array.add(["https://www.e-180.com", 7, 20, 309, 45.505, -73.613])
        array.add(["https://fr.wikipedia.org", 7, 20, 162, 45.496, -73.617])
        array.add(["https://www.linkedin.com", 7, 20, 36, 45.496, -73.617])
        array.add(["http://www.france3.fr", 7, 20, 17, 45.496, -73.617])
        array.add(["http://www.studiobagel.com", 7, 20, 8, 45.496, -73.617])
        
        return array
    }
    
    internal static func getDataArrayForUser6() -> NSArray
    {
        let array = NSMutableArray()
        
        // Day : Lundi
        // TimeSolt : 0h - 5h
        array.add(["http://www.economist.com", 4, 1, 1447, 45.496, -73.617])
        array.add(["http://ici.radio-canada.ca", 4, 1, 695, 45.496, -73.617])
        array.add(["https://dossieretudiant.polymtl.ca", 4, 1, 2614, 45.496, -73.617])
        array.add(["http://www.france2.fr", 4, 1, 2682, 45.496, -73.617])
        array.add(["https://twitter.com", 4, 1, 2929, 45.505, -73.613])
        array.add(["http://www.liberation.fr", 4, 1, 23, 45.505, -73.613])
        
        // TimeSolt : 5h - 9h
        array.add(["http://www.economist.com", 4, 6, 1898, 45.496, -73.617])
        array.add(["http://ici.radio-canada.ca", 4, 6, 2233, 45.496, -73.617])
        array.add(["https://dossieretudiant.polymtl.ca", 4, 6, 3101, 45.496, -73.617])
        array.add(["http://www.france2.fr", 4, 6, 20, 45.496, -73.617])
        array.add(["https://twitter.com", 4, 6, 84, 45.505, -73.613])
        array.add(["http://www.liberation.fr", 4, 6, 2, 45.505, -73.613])
        
        // TimeSolt : 9h - 12h
        
        // TimeSolt : 12h - 14h
        array.add(["http://www.tf1.fr", 4, 13, 2560, 45.496, -73.617])
        array.add(["http://www.liberation.fr", 4, 13, 664, 45.505, -73.613])
        array.add(["https://dossieretudiant.polymtl.ca", 4, 13, 671, 45.505, -73.613])
        array.add(["https://mail.google.com", 4, 13, 199, 45.496, -73.617])
        array.add(["http://www.legorafi.fr", 4, 13, 8, 45.505, -73.613])
        
        // TimeSolt : 14h - 19h
        array.add(["http://www.economist.com", 4, 15, 2932, 45.496, -73.617])
        array.add(["http://ici.radio-canada.ca", 4, 15, 96, 45.496, -73.617])
        array.add(["https://dossieretudiant.polymtl.ca", 4, 15, 2994, 45.496, -73.617])
        array.add(["http://www.france2.fr", 4, 15, 1095, 45.496, -73.617])
        array.add(["https://twitter.com", 4, 15, 366, 45.505, -73.613])
        array.add(["http://www.liberation.fr", 4, 15, 1396, 45.505, -73.613])
        
        // TimeSolt : 19h - 24h
        array.add(["https://twitter.com", 4, 20, 2626, 45.496, -73.617])
        
        
        
        // Day : Mardi
        // TimeSolt : 0h - 5h
        array.add(["http://www.tf1.fr", 2, 1, 143, 45.505, -73.613])
        array.add(["http://www.liberation.fr", 2, 1, 1709, 45.505, -73.613])
        array.add(["http://www.marmiton.org", 2, 1, 1644, 45.505, -73.613])
        array.add(["http://9gag.com", 2, 1, 99, 45.505, -73.613])
        array.add(["https://mail.google.com", 2, 1, 905, 45.496, -73.617])
        
        // TimeSolt : 5h - 9h
        array.add(["http://www.liberation.fr", 2, 6, 1474, 45.496, -73.617])
        array.add(["http://www.marmiton.org", 2, 6, 2653, 45.505, -73.613])
        
        // TimeSolt : 9h - 12h
        array.add(["http://www.liberation.fr", 2, 10, 1886, 45.496, -73.617])
        array.add(["http://www.marmiton.org", 2, 10, 1501, 45.505, -73.613])
        
        // TimeSolt : 12h - 14h
        array.add(["http://www.liberation.fr", 2, 13, 3575, 45.496, -73.617])
        array.add(["http://www.marmiton.org", 2, 13, 56, 45.505, -73.613])
        
        // TimeSolt : 14h - 19h
        array.add(["http://fr.euronews.com", 2, 15, 178, 45.505, -73.613])
        array.add(["http://www.france2.fr", 2, 15, 1039, 45.505, -73.613])
        array.add(["http://www.lesechos.fr", 2, 15, 1313, 45.496, -73.617])
        array.add(["http://www.melty.fr", 2, 15, 1691, 45.496, -73.617])
        array.add(["http://www.marmiton.org", 2, 15, 2269, 45.505, -73.613])
        array.add(["http://ici.radio-canada.ca", 2, 15, 796, 45.496, -73.617])
        
        // TimeSolt : 19h - 24h
        array.add(["http://www.liberation.fr", 2, 20, 849, 45.496, -73.617])
        array.add(["http://www.marmiton.org", 2, 20, 2173, 45.505, -73.613])
        
        
        
        // Day : Mercredi
        // TimeSolt : 0h - 5h
        array.add(["http://ici.radio-canada.ca", 4, 1, 1449, 45.496, -73.617])
        
        // TimeSolt : 5h - 9h
        array.add(["http://www.melty.fr", 4, 6, 2398, 45.496, -73.617])
        array.add(["http://ici.radio-canada.ca", 4, 6, 2270, 45.505, -73.613])
        
        // TimeSolt : 9h - 12h
        
        // TimeSolt : 12h - 14h
        array.add(["http://www.tf1.fr", 4, 13, 1174, 45.496, -73.617])
        array.add(["http://www.liberation.fr", 4, 13, 943, 45.505, -73.613])
        array.add(["https://dossieretudiant.polymtl.ca", 4, 13, 379, 45.505, -73.613])
        array.add(["https://mail.google.com", 4, 13, 121, 45.496, -73.617])
        array.add(["http://www.legorafi.fr", 4, 13, 562, 45.505, -73.613])
        
        // TimeSolt : 14h - 19h
        
        // TimeSolt : 19h - 24h
        
        
        
        // Day : Jeudi
        // TimeSolt : 0h - 5h
        array.add(["http://ici.radio-canada.ca", 4, 1, 3547, 45.496, -73.617])
        
        // TimeSolt : 5h - 9h
        array.add(["http://www.melty.fr", 4, 6, 3422, 45.496, -73.617])
        array.add(["http://ici.radio-canada.ca", 4, 6, 380, 45.505, -73.613])
        
        // TimeSolt : 9h - 12h
        
        // TimeSolt : 12h - 14h
        array.add(["http://www.tf1.fr", 4, 13, 1109, 45.496, -73.617])
        array.add(["http://www.liberation.fr", 4, 13, 2741, 45.505, -73.613])
        array.add(["https://dossieretudiant.polymtl.ca", 4, 13, 16, 45.505, -73.613])
        array.add(["https://mail.google.com", 4, 13, 2, 45.496, -73.617])
        array.add(["http://www.legorafi.fr", 4, 13, 16, 45.505, -73.613])
        
        // TimeSolt : 14h - 19h
        array.add(["http://www.economist.com", 4, 15, 2696, 45.496, -73.617])
        array.add(["http://ici.radio-canada.ca", 4, 15, 2655, 45.496, -73.617])
        array.add(["https://dossieretudiant.polymtl.ca", 4, 15, 895, 45.496, -73.617])
        array.add(["http://www.france2.fr", 4, 15, 20, 45.496, -73.617])
        array.add(["https://twitter.com", 4, 15, 2442, 45.505, -73.613])
        array.add(["http://www.liberation.fr", 4, 15, 363, 45.505, -73.613])
        
        // TimeSolt : 19h - 24h
        array.add(["https://twitter.com", 4, 20, 3494, 45.496, -73.617])
        
        
        
        // Day : Vendredi
        // TimeSolt : 0h - 5h
        array.add(["http://ici.radio-canada.ca", 4, 1, 2653, 45.496, -73.617])
        
        // TimeSolt : 5h - 9h
        array.add(["http://www.melty.fr", 4, 6, 553, 45.496, -73.617])
        array.add(["http://ici.radio-canada.ca", 4, 6, 653, 45.505, -73.613])
        
        // TimeSolt : 9h - 12h
        
        // TimeSolt : 12h - 14h
        array.add(["http://www.tf1.fr", 4, 13, 3164, 45.496, -73.617])
        array.add(["http://www.liberation.fr", 4, 13, 132, 45.505, -73.613])
        array.add(["https://dossieretudiant.polymtl.ca", 4, 13, 715, 45.505, -73.613])
        array.add(["https://mail.google.com", 4, 13, 137, 45.496, -73.617])
        array.add(["http://www.legorafi.fr", 4, 13, 60, 45.505, -73.613])
        
        // TimeSolt : 14h - 19h
        array.add(["http://www.economist.com", 4, 15, 698, 45.496, -73.617])
        array.add(["http://ici.radio-canada.ca", 4, 15, 519, 45.496, -73.617])
        array.add(["https://dossieretudiant.polymtl.ca", 4, 15, 233, 45.496, -73.617])
        array.add(["http://www.france2.fr", 4, 15, 1288, 45.496, -73.617])
        array.add(["https://twitter.com", 4, 15, 1163, 45.505, -73.613])
        array.add(["http://www.liberation.fr", 4, 15, 865, 45.505, -73.613])
        
        // TimeSolt : 19h - 24h
        array.add(["https://twitter.com", 4, 20, 3117, 45.496, -73.617])
        
        
        
        // Day : Samedi
        // TimeSolt : 0h - 5h
        
        // TimeSolt : 5h - 9h
        
        // TimeSolt : 9h - 12h
        
        // TimeSolt : 12h - 14h
        
        // TimeSolt : 14h - 19h
        array.add(["http://www.economist.com", 4, 15, 2976, 45.496, -73.617])
        array.add(["http://ici.radio-canada.ca", 4, 15, 1519, 45.496, -73.617])
        array.add(["https://dossieretudiant.polymtl.ca", 4, 15, 2895, 45.496, -73.617])
        array.add(["http://www.france2.fr", 4, 15, 478, 45.496, -73.617])
        array.add(["https://twitter.com", 4, 15, 1905, 45.505, -73.613])
        array.add(["http://www.liberation.fr", 4, 15, 234, 45.505, -73.613])
        
        // TimeSolt : 19h - 24h
        
        
        
        // Day : Dimanche
        // TimeSolt : 0h - 5h
        array.add(["http://ici.radio-canada.ca", 4, 1, 1074, 45.496, -73.617])
        
        // TimeSolt : 5h - 9h
        array.add(["http://www.melty.fr", 4, 6, 2679, 45.496, -73.617])
        array.add(["http://ici.radio-canada.ca", 4, 6, 2662, 45.505, -73.613])
        
        // TimeSolt : 9h - 12h
        
        // TimeSolt : 12h - 14h
        array.add(["http://www.tf1.fr", 4, 13, 1439, 45.496, -73.617])
        array.add(["http://www.liberation.fr", 4, 13, 1483, 45.505, -73.613])
        array.add(["https://dossieretudiant.polymtl.ca", 4, 13, 366, 45.505, -73.613])
        array.add(["https://mail.google.com", 4, 13, 478, 45.496, -73.617])
        array.add(["http://www.legorafi.fr", 4, 13, 33, 45.505, -73.613])
        
        // TimeSolt : 14h - 19h
        array.add(["http://www.economist.com", 4, 15, 2357, 45.496, -73.617])
        array.add(["http://ici.radio-canada.ca", 4, 15, 866, 45.496, -73.617])
        array.add(["https://dossieretudiant.polymtl.ca", 4, 15, 1615, 45.496, -73.617])
        array.add(["http://www.france2.fr", 4, 15, 637, 45.496, -73.617])
        array.add(["https://twitter.com", 4, 15, 2257, 45.505, -73.613])
        array.add(["http://www.liberation.fr", 4, 15, 165, 45.505, -73.613])
        
        // TimeSolt : 19h - 24h
        array.add(["https://twitter.com", 4, 20, 1776, 45.496, -73.617])
        
        return array
    }
    
}
