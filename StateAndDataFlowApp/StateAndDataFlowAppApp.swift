//
//  StateAndDataFlowAppApp.swift
//  StateAndDataFlowApp
//
//  Created by Александр on 16.08.2021.
//

import SwiftUI

@main
struct StateAndDataFlowAppApp: App {
    @StateObject private var user = UserManager()
    
    var body: some Scene {
        WindowGroup {
            StarterView()
                .environmentObject(user)
        }
    }
}
