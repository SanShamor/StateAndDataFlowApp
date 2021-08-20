//
//  RegisterView.swift
//  StateAndDataFlowApp
//
//  Created by Александр on 16.08.2021.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var userManager: UserManager
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                UserNameTF(
                    name: $userManager.user.name,
                    nameIsValid: userManager.nameIsValid
                )
                Spacer()
            }
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
            }
        }
    }
    
    private func registerUser() {
        if !userManager.user.name.isEmpty {
            userManager.user.isRegistered.toggle()
            DataManager.shared.saveUser(user: userManager.user)
        }
    }
}

struct RegisteredView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

struct UserNameTF: View {
    
    @Binding var name: String
    var nameIsValid = false
    
    var body: some View {
        ZStack {
            TextField("Your name", text: $name)
            HStack {
                Spacer()
                Text("\(name.count)")
                    .foregroundColor(nameIsValid ? .green : .red)
            }
        }
    }
}
