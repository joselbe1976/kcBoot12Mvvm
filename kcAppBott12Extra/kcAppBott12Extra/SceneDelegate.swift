//
//  SceneDelegate.swift
//  kcAppBott12Extra
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 19/12/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    var rootVM = RootViewModel() //le paso el view model . ES UNA CLASE


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        //CARGAMOS EL LOGIN por defecto
        self.window!.rootViewController =  UINavigationController(rootViewController:  LoginViewController(vm: self.rootVM))
        self.window!.makeKeyAndVisible()
       
        //Asigno a la funcion declarada en el viewModel, el codigo a ejecutar....
        rootVM.onViewChange = {
           
            switch self.rootVM.viewActive{
                    case .Login:
                        self.window!.rootViewController =  UINavigationController(rootViewController:  LoginViewController(vm: self.rootVM))
                    case .Home:
                        self.window!.rootViewController =  UINavigationController(rootViewController:  HomeViewController(vm: self.rootVM))
                    case .Register:
                        self.window!.rootViewController =  UINavigationController(rootViewController:  RegisterViewController(vm: self.rootVM))
            }
                self.window!.makeKeyAndVisible()
        }
        
        guard let _ = (scene as? UIWindowScene) else { return}
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

