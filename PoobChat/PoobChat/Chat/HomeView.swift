//
//  HomeView.swift
//  PoobChat
//
//  Created by Joshua North on 12/26/22.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var conversationService = ConversationService()
    @FetchRequest(sortDescriptors: []) var convos: FetchedResults<Conversation>
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0){
                navBar
                ScrollView {
                    messageList
                }
            }
        }.toolbar(.hidden)
            .task {
                conversationService.userConversations(){ response, error in
                    print(error ?? "No error")
                }
            }
    }
    
    var navBar: some View{
        VStack(spacing: 0) {
            HStack(){
                Button {
                    
                } label: {
                    Image(systemName: "person.fill")
                        .foregroundColor(.black)
                        .font(.system(size: 34))
                }
                
                VStack(){
                    Text("Username")
                        .font(.system(size: 24, weight: .bold))
                }
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "bubble.left")
                        .foregroundColor(.black)
                }
            }
            .padding()
            Divider()
        }
    }
    
    var messageList: some View{
        LazyVStack(spacing: 0){
            ForEach(convos, id: \.self){ convo in
                VStack(spacing: 0) {
                    rowView(convo)
                }
                .padding(.vertical, 11)
                Divider()
            }
            .padding(.horizontal)
        }
    }
    
    func rowView(_ convo: Conversation) -> some View {
        NavigationLink {
            Text("Destination")
        } label: {
            HStack(spacing: 15){
                Image(systemName: "person.fill")
                    .font(.system(size: 30))
                    .padding(5)
                    .overlay(RoundedRectangle(cornerRadius: 44).stroke(Color.black, lineWidth: 2))
                    .foregroundColor(.black)
                VStack(alignment: .leading){
                    Text(convo.username ?? "")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.black)
                    Text(convo.preview ?? "")
                        .font(.system(size: 14))
                        .foregroundColor(Color(.lightGray))
                }
                Spacer()
                Text(convo.updatedAt ?? Date(), format: Date.FormatStyle().month().day().year() )
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.black)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
