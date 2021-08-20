//
//  StateAndDataFlowAppApp.swift
//  StateAndDataFlowApp
//
//  Created by Александр on 16.08.2021.
//

import SwiftUI

@main
struct StateAndDataFlowAppApp: App {
    private let user = DataManager.shared.loadUser()
    
    var body: some Scene {
        WindowGroup {
            StarterView()
                .environmentObject(UserManager(user: user))
        }
    }
}
