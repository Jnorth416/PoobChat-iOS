//
//  ContactView.swift
//  PoobChat
//
//  Created by Joshua North on 12/27/22.
//

import SwiftUI

struct ContactView: View {
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(key: "username", ascending: true)]
    ) var friends: FetchedResults<Friend>
    @StateObject var friendService = FriendService()
    @State var showAddSheet: Bool = false

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                nav
                ContactListView()
            }
        }
        .sheet(isPresented: $showAddSheet) {
            AddFriendView()
        }
        .task {
            friendService.getFriends { _, error in
                if let error = error {
                    print(error.localizedDescription)
                }
            }
        }
    }

    var nav: some View {
        VStack(spacing: 0) {
            HStack(){
                VStack(){
                    Text("Friends")
                        .font(.system(size: 24, weight: .bold))
                }
                Spacer()
                Button {
                    showAddSheet = true
                } label: {
                    Image(systemName: "person.badge.plus")
                }
            }
            .padding()
            Divider()
        }
    }
}
