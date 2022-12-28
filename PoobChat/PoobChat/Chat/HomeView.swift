//
//  HomeView.swift
//  PoobChat
//
//  Created by Joshua North on 12/26/22.
//

import SwiftUI

struct HomeView: View {
   
    var body: some View {
        NavigationView {
            VStack(spacing: 0){
                navBar
                ScrollView {
                    messageList
                }
            }
        }.toolbar(.hidden)
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
            ForEach(0..<10, id: \.self){ num in
                VStack(spacing: 0) {
                    rowView(num)
                }
                .padding(.vertical, 11)
                Divider()
            }
            .padding(.horizontal)
        }
    }
    
    func rowView(_ num: Int) -> some View {
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
                    Text("Username")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.black)
                    Text("Message sent to user")
                        .font(.system(size: 14))
                        .foregroundColor(Color(.lightGray))
                }
                Spacer()
                Text("22d")
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
