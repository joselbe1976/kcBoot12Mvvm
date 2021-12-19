//
//  kcAppBott12ExtraTests.swift
//  kcAppBott12ExtraTests
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 19/12/21.
//

import XCTest
import MapKit
@testable import kcAppBott12Extra

class kcAppBott12ExtraTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testModels() throws {
        let model = Heros(id: UUID(), name: "Hulk", description: "", photo: "10", favorite: false)
        XCTAssertNotNil(model)
        XCTAssertEqual(model.name, "Hulk")
    }

    func testModels2() throws {
        let model = HerosFilter(name: "test")
        XCTAssertNotNil(model)
        XCTAssertEqual(model.name, "test")
    }
    func testModels3() throws {
        //necesita: import Mapkit
         
        let model = HeroMap(title: "test", coordinate: CLLocationCoordinate2D(latitude: -40.0, longitude: -3.0), locationName: "", discipline: "")
        XCTAssertNotNil(model)
        XCTAssertEqual(model.title, "test")
    }
    
    func testRootViewModelLoginFake() throws {
        //test del modelo Testing
        
        let vm = RootViewModel(interactor: RootInteractorTesting())
        XCTAssertNotNil(vm)
        
        //binding del mensaje
        vm.errorMessage.bind({ data in
            if (data != ""){
                XCTAssertEqual(data, "Conectado")
            }
        })
        
        //lanzamos el login
        vm.login(user: "user", pass: "pass")

    }
    
    
    func testRootViewModelLoginReal() throws {
        //test del modelo Testing
        let expectation = self.expectation(description: "Login real")
        
        let vm = RootViewModel(interactor: RootInteractor())
        XCTAssertNotNil(vm)
        
        //binding del mensaje
        vm.errorMessage.bind({ data in
            if (data != ""){
                XCTAssertEqual(data, "Conectado")
                expectation.fulfill()
            }
        })
        
        //lanzamos el login
        vm.login(user: "bejl@keepcoding.es", pass: "123456")

        
        self.waitForExpectations(timeout: 20) //se esperan 10 segundos añl login
        
    }
    
    

}
