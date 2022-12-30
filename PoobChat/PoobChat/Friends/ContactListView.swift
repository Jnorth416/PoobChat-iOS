//
//  ContactListView.swift
//  PoobChat
//
//  Created by Matt  North on 12/29/22.
//

import SwiftUI

struct ContactListView: View {
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(key: "username", ascending: true)]
    ) var friends: FetchedResults<Friend>

    var body: some View {
        List(friends) { friend in
            NavigationLink {
                ContactDetailView(friend: friend)
            } label: {
                Text(friend.username ?? "")
                    .padding(.vertical, 6)
            }
        }
        .listStyle(PlainListStyle())
    }
}

struct ContactListView_Previews: PreviewProvider {
    static var previews: some View {
        ContactListView()
    }
}
