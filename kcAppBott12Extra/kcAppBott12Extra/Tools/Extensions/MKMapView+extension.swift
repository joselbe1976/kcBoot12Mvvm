//
//  MKMapView+extension.swift
//  kcAppBott12Extra
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 19/12/21.
//

import Foundation
import MapKit

extension MKMapView {

    //Centra el mapa a una localizacion que le indiquemos a 500 metros altura de visualizacion por defecto
  func centerToLocation( _ location: CLLocation, regionRadius: CLLocationDistance = 500 ) {
      let coordinateRegion = MKCoordinateRegion(
          center: location.coordinate,
          latitudinalMeters: regionRadius,
          longitudinalMeters: regionRadius)
      
      setRegion(coordinateRegion, animated: true)
  }
}
