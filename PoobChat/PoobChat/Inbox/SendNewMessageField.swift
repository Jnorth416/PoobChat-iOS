//
//  SendNewMessageField.swift
//  PoobChat
//
//  Created by Joshua North on 12/30/22.
//

import SwiftUI

struct SendNewMessageField: View {
    
    @State private var message = ""
    var body: some View {
        HStack{
            TextField("Message", text: $message,  axis: .vertical)
                .lineLimit(1...5)
                .padding(11)
                .background(Color.black.opacity(0.05))
                .cornerRadius(40)
        
            Button{
            
            }label: {
                Text("Send")
                    .foregroundColor(.white)
            }
            .padding(.horizontal)
            .padding(.vertical, 5)
            .background(Color.blue
            .frame(width: 80, height: 40)
            .cornerRadius(40)
            )
        }
        .padding()
    }
}

struct SendNewMessageField_Previews: PreviewProvider {
    static var previews: some View {
        SendNewMessageField()
    }
}
