//
//  CatsApp.swift
//  Cats
//
//  Created by Bhuiyan Wasif on 10/25/23.
//

import SwiftUI

@main
struct CatsApp: App {
    
    @Environment(\.scenePhase) private var scenePhase
    var body: some Scene {
        
        WindowGroup {
            CatListView()
        }
        .onChange(of: scenePhase) { phase in
                            switch phase {
                            case .active:
                                
                                print("active")
                            case .inactive:
                                print("inactive")
                            case .background:
                                print("background")
                                DatabaseManager.shared.saveContext()
                            @unknown default:
                                fatalError()
                            }
                        }
    }
}
