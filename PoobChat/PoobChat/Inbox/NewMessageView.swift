//
//  NewMessageView.swift
//  PoobChat
//
//  Created by Joshua North on 12/30/22.
//

import SwiftUI

struct NewMessageView: View {
    var body: some View {
        VStack{
            NewMessageSearchField()
                Spacer()
            SendNewMessageField()
        }
    }
}

struct NewMessageView_Previews: PreviewProvider {
    static var previews: some View {
        NewMessageView()
    }
}
