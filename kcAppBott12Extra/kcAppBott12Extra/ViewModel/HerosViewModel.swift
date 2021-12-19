//
//  HerosViewModel.swift
//  kcAppBott12Extra
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 19/12/21.
//

import Foundation
import Combine

final class HerosViewModel :ObservableObject {
    //@Published var locations : [HeroLocationsResponse]? //asi en SwiftUI
    var locations = PassthroughSubject<[HeroLocationsResponse], Never>()  //Asi en UIKIT
    
    var suscriptors = Set<AnyCancellable>()
    
    //carga localizaciones de un hero concreto.. sino argumento aqui con el id hero.
    func loadLocations(){
        URLSession.shared
            .dataTaskPublisher(for: BaseNetwork().getSessionHeros(idHero: "98CF0A0D-85AF-44E3-8146-45AA222DF9C3"))
            .tryMap{
                guard let response = $0.response as? HTTPURLResponse,
                       response.statusCode == 200 else {

                    throw URLError(.badServerResponse)
                }
                //todo OK. devolvemos los datos el JSON
                return $0.data
            }
            .decode(type: [HeroLocationsResponse].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print("error: \(error)")
                case .finished:
                    print("finalizado")
                }
               
            } receiveValue: { data in
                self.locations.send(data) //enviamos por el publicador
            }
            .store(in: &suscriptors)
    }
    
    
}
