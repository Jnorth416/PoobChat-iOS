//
//  ContactDetailView.swift
//  PoobChat
//
//  Created by Matt  North on 12/29/22.
//

import SwiftUI

struct ContactDetailView: View {
    var friend: Friend
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var friendService = FriendService()
    private var username: String {
        friend.username ?? "Unknown"
    }

    var body: some View {
        VStack {
            Text(String(username.first!).uppercased())
                .font(.system(size: 85))
                .padding(32)
                .background(.tertiary)
                .clipShape(Circle())
            Text(username)
                .font(.largeTitle)
            Divider()
            Spacer()
            HStack(spacing: 8) {
                sendMsg
                delete
            }.padding()
        }
        .padding(.vertical)
    }

    var delete: some View {
        Button {
            friendService.deleteFriend(id: friend.userId!) { _, error in                
                print(error ?? "")
                presentationMode.wrappedValue.dismiss()
            }
        } label: {
            Text("Unfriend")
                .foregroundColor(.red)
                .font(.headline)
                .padding(.horizontal ,24)
                .padding(.vertical, 12)
                .cornerRadius(12)
                .contentShape(Rectangle())
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .buttonStyle(PlainButtonStyle())
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.red, lineWidth: 2)
        )
    }

    var sendMsg: some View {
        Button {

        } label: {
            Text("Send Message")
                .foregroundColor(.white)
                .font(.headline)
                .padding(.vertical, 12)
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .buttonStyle(PlainButtonStyle())
        .background(Color.blue)
        .cornerRadius(12)
        .contentShape(Rectangle())
    }
}

struct ContactDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetailView(friend: MockData.friends.first!)
    }
}
