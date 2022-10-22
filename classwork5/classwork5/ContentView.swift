//
//  ContentView.swift
//  classwork5
//
//  Created by Mac on 22/10/2022.
//

import SwiftUI

struct ContentView: View {
    @State var cafeteria =
    ["sandwich","chips","pepsi","kinder","candy"]
    @State var item = ""
    var body: some View {
        VStack {
            List{
                ForEach(cafeteria,id:\.self){name in
                HStack{
                    Image(name)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                    
                    Text(name)
                }
            }
                .onDelete(perform: delete)
        }
            
            
            HStack{
                Button{
                    cafeteria.append("juice")
                    
                } label:{
                    Image(systemName: "plus")
                        .font(.largeTitle)
                        .foregroundColor(.green)
                    
                    
                    TextField(".............", text: $item)
                    
                    Button{
                        cafeteria.remove(at: 0)
                    } label:{
                        Image(systemName: "minus")
                            .font(.largeTitle)
                            .foregroundColor(.red)
                    }
                    Button{
                        cafeteria.append(cafeteria.randomElement() ?? "egg")
                    } label:{
                        Image(systemName: "questionmark")
                            .font(.largeTitle)
                            .foregroundColor(.orange)
                        
                    }
                }
            }
        }
    }
    func delete(at offsets: IndexSet) {
        cafeteria.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
