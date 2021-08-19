//
//  ContentView.swift
//  StateAndDataFlowApp
//
//  Created by Александр on 16.08.2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var user: UserManager
    @StateObject private var timer = TimeCounter()
    //@StateObject - для слежения за изменением состояния экземпляра класса в реальном времени
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello, \(user.name)!")
                    .font(.largeTitle)
                Text("\(timer.counter)")
                    .font(.largeTitle)
                VStack {
                    Spacer()
                    ButtonView(timer: timer)
                    Spacer()
                    NavigationLink(destination: RegisterView()) {
                        Text("Log Out")
                            .frame(width: 200, height: 60)
                            .foregroundColor(.white)
                            .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(20)
                            .font(.title)
                    }
                    .frame(width: 200, height: 60)
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black, lineWidth:4)
                    )
                    Spacer()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager())
    }
}

struct ButtonView: View {
    @ObservedObject var timer: TimeCounter
    
    var body: some View {
        Button(action: timer.startTimer) {
            Text(timer.buttonTitle)
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(Color.red)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth:4)
        )
    }
}

struct logOutButton: View {
    var body: some View {
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/){
            Text("Log Out")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(Color.blue)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth:4)
        )
    }
}
