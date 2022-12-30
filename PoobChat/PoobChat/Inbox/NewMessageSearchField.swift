//
//  NewMessageSearchField.swift
//  PoobChat
//
//  Created by Joshua North on 12/30/22.
//

import SwiftUI

struct NewMessageSearchField: View {
    
    @FetchRequest(sortDescriptors: []) var friends: FetchedResults<Friend>
    
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(searchResults, id: \.self) { friend in
                    Text(friend.username!)
                }
            }
        }
        .searchable(text: $searchText)
    }
    
    var searchResults: [Friend] {
        if searchText.isEmpty {
            return friends.map { $0 }
        } else {
            return friends.filter{ friend in
                // true or false
                // check friend to see if included
                return (friend.username?.contains(searchText))!
            }
        }
    }
}

struct NewMessageSearchField_Previews: PreviewProvider {
    static var previews: some View {
        NewMessageSearchField()
    }
}
