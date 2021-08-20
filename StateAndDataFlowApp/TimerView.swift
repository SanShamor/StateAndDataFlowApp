//
//  ContentView.swift
//  StateAndDataFlowApp
//
//  Created by Александр on 16.08.2021.
//

import SwiftUI

struct TimerView: View {

    @StateObject private var timer = TimeCounter()
    //@StateObject - для слежения за изменением состояния экземпляра класса в реальном времени
    @EnvironmentObject var userManager: UserManager
    
    var body: some View {
        VStack {
            Text("Hi, \(userManager.user.name)")
                .font(.largeTitle)
            Text("\(timer.counter)")
                .font(.largeTitle)
            
            VStack {
                Spacer()
                
                ButtonView(title: timer.buttonTitle, color: .red) {
                    timer.startTimer()
                }
                
                Spacer()

                ButtonView(title: "LogOut", color: .blue) {
                    DataManager.shared.clear(userManager: userManager)
                }
                Spacer()

            }
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
            .environmentObject(UserManager())
    }
}
