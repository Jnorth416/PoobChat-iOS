//
//  AddFriendView.swift
//  PoobChat
//
//  Created by Matt  North on 12/30/22.
//

import SwiftUI

struct AddFriendView: View {
    @StateObject var friendService = FriendService()
    @Environment(\.presentationMode) var presentationMode
    @State var username: String = ""

    var body: some View {
        VStack(spacing: 16) {
            nav
            TextField("Enter Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .textContentType(.username)
            sendMsg
                .padding()
            Spacer()
        }
    }

    var nav: some View {
        VStack(spacing: 0) {
            HStack(){
                VStack(){
                    Text("Add Friend")
                        .font(.system(size: 24, weight: .bold))
                }
                Spacer()
                Button("Cancel") {
                    presentationMode.wrappedValue.dismiss()
                }
            }
            .padding()
            Divider()
        }
    }

    var sendMsg: some View {
        Button {
            friendService.addFriend(username: username) { _, err in
                print(err)
                presentationMode.wrappedValue.dismiss()
            }
        } label: {
            Text("Add Friend")
                .foregroundColor(.white)
                .font(.headline)
                .padding(.vertical, 12)
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .buttonStyle(PlainButtonStyle())
        .background(Color.blue)
        .cornerRadius(12)
        .contentShape(Rectangle())
        .disabled(username.isEmpty)
        .opacity(username.isEmpty ? 0.6 : 1)
    }
}

struct AddFriendView_Previews: PreviewProvider {
    static var previews: some View {
        AddFriendView()
    }
}
