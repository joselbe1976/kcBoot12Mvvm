//
//  HomeViewController.swift
//  test1
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 18/12/21.
//

import UIKit
import MapKit
import Combine //new
import CoreLocation //poara localizacion del usuario conectado


class HomeViewController: UIViewController {
    var rootVM:RootViewModel?
    var herosVM:HerosViewModel? //new
    var suscriptors = Set<AnyCancellable>() //new
    
    @IBOutlet weak var mapa: MKMapView!
    
    
    let locationManager = CLLocationManager() //New Localizacion User connected
    
    init(vm:RootViewModel, herosVM : HerosViewModel = HerosViewModel()){ //new
        super.init(nibName: nil, bundle: nil)
        self.rootVM = vm
        self.herosVM = herosVM //new
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Localizacion Inicial en el Bernabeu
      
        let initialLocation = CLLocation(latitude: 40.45064838408302, longitude: -3.6878562736371205)
        mapa.centerToLocation(initialLocation, regionRadius: 1000)
        
   
        //localizacion del usuario conectado
        UserLocation()
        
        
        //NEW: -----
        //Creamos el suscriptor del publicador
        self.herosVM?.locations
            .sink(receiveValue: { data in
                DispatchQueue.main.async {
                    //aqui tenemos las localizaciones
                    print("localizaciones tenemos \(data.count)")
                    
                    //recorremos cada localizacion del response del server
                    data.forEach(){ locat in
                        //convertimos el modelo de MapKit necesario
                        let modelMapKit = self.herosVM?.convertModelToMaps(model: locat)
                        
                        //Añadimos el punto, desempaquetando antes
                        if let model = modelMapKit {
                            self.mapa.addAnnotation(model)
                        }
                    }
                }
                
                
                
            })
            .store(in: &suscriptors)
        
        
        //lanzamos la carga
        self.herosVM?.loadLocations()
    }
    


    @IBAction func logOut(_ sender: Any) {
        self.rootVM?.viewActive = .Login //pantalla de login
    }
    
   
    
}



extension HomeViewController: CLLocationManagerDelegate,MKMapViewDelegate {
    
    
    func UserLocation(){
        //self.locationManager.requestAlwaysAuthorization()
        
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
               locationManager.delegate = self
               locationManager.desiredAccuracy = kCLLocationAccuracyBest
               locationManager.startUpdatingLocation()
        }

        mapa.delegate = self
        mapa.mapType = .standard
        mapa.isZoomEnabled = true
        mapa.isScrollEnabled = true
        

        if let coor = mapa.userLocation.location?.coordinate{
                mapa.setCenter(coor, animated: true)
        }
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations
        locations: [CLLocation]) {
        
        //pilla la coordenada de la localizacion
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate

      
        // Posiciona en el mapa
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: locValue, span: span)
       // mapa.setRegion(region, animated: true) //nos mieve a la posicion indicada
         

        //añadimos nuestra posicion al mapa
        let annotation = MKPointAnnotation()
        annotation.coordinate = locValue
        annotation.title = "Estas AQUI Jose"
        mapa.addAnnotation(annotation)
    }
    
}
