//
//  SceneDelegate.swift
//  FavouriteThings
//
//  Created by Mitchell Gorham on 16/4/20.
//  Copyright © 2020 Mitchell Gorham. All rights reserved.
//

import UIKit
import SwiftUI
import CoreData

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
                // Get the managed object context from the shared persistent container// Get the managed object context from the shared persistent container
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
        // Initial Data Check and Loading
        var faveCatalogArray = [FaveViewModel]()
        let request = NSFetchRequest<FaveViewModel>(entityName: "FaveViewModel")
        do {
            faveCatalogArray = try context.fetch(request)   // Assigns existing data to faveCatalogArray
            if faveCatalogArray.count == 0 {                // If there is no existing FaveViewModels, create one and fetch it again
                NSEntityDescription.insertNewObject(forEntityName: "FaveViewModel", into: context)
                faveCatalogArray = try context.fetch(request)
                
                //MARK: Initial Data
                //Populates app with some initial data
                var newClass = FaveClass(context: context)
                newClass.viewModel = faveCatalogArray.first
                newClass.url = "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c4/T-10_tank.jpg/640px-T-10_tank.jpg"
                newClass.name = "T-10"
                newClass.sub =  "Object-730"
                newClass.notes = "The T-10 was never exported outside of the Soviet Union."
                populateClass(newClass: newClass, context: context, name1:"Type:", name2:"Place of Origin:", name3:"In Service:", desc1:"Heavy Tank",desc2:"Soviet Union",desc3:"1953–1996")
                
                newClass = FaveClass(context: context)
                newClass.viewModel = faveCatalogArray.first
                newClass.url = "https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Leopard1_cfb_borden_2.JPG/640px-Leopard1_cfb_borden_2.JPG"
                newClass.name = "Leopard 1"
                newClass.sub = "Leopard 1A4"
                newClass.notes = "In the German Army, the Leopard 1 was completely phased out in 2003 by the Leopard 2, while Leopard 1-based vehicles are still widely used in utility roles."
                populateClass(newClass: newClass, context: context, name1:"Type:", name2:"Place of Origin:", name3:"In Service:", desc1:"Main Battle Tank",desc2:"West Germany",desc3:"1965-Present")
                
                newClass = FaveClass(context: context)
                newClass.viewModel = faveCatalogArray.first
                newClass.url = "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/M4_Sherman_tank_-_Flickr_-_Joost_J._Bakker_IJmuiden.jpg/640px-M4_Sherman_tank_-_Flickr_-_Joost_J._Bakker_IJmuiden.jpg"
                newClass.name = "M4 Sherman"
                newClass.sub = "Medium Tank, M4"
                newClass.notes = "Tens of thousands were distributed through the Lend-Lease program to the British Commonwealth and Soviet Union."
                populateClass(newClass: newClass, context: context, name1:"Type:", name2:"Place of Origin:", name3:"In Service:", desc1:"Medium Tank",desc2:"United States",desc3:"1942-1957")
                try? context.save()
            }
        } catch {
            print("ERROR - COULD NOT FIND DATA")
        }
        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView().environment(\.managedObjectContext,context)
                
        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
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
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else {
            return(print("Error: delegate was unable to be assigned"))
        }
        delegate.saveContext()
        
    }

}

