//
//  Mapas.swift
//  kcAppBott12Extra
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 19/12/21.
//

import MapKit

class HeroMap: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D
    let locationName: String?
    let discipline: String?
    
    init(title:String, coordinate: CLLocationCoordinate2D, locationName:String, discipline:String){
        self.title = title
        self.coordinate = coordinate
        self.locationName = locationName
        self.discipline = discipline
        
        super.init()
    }
    
}

