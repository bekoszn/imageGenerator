//
//  ContentView.swift
//  imageGenerator
//
//  Created by Berke Özgüder on 22.07.2024.
//

import SwiftUI

struct PromptView: View {
    
    @State var selectedStyle = ImageStyle.allCases[0]
    @State var promptText: String = ""
    var body: some View {
        NavigationView {
            
            VStack (alignment: .leading) {
                Text("Generate")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                
                GeometryReader(content: { reader in
                    ScrollView (.horizontal , showsIndicators: false){
                        HStack {
                            ForEach(ImageStyle.allCases, id: \.self) {
                                imageStyle in
                                Button{
                                    
                                    selectedStyle = imageStyle
                                    
                                    
                                } label: {
                                    Image(imageStyle.rawValue)
                                        .resizable()
                                        .background(Color.blue)
                                        .scaledToFill()
                                        .frame(width: reader.size.width * 0.4 , height: reader.size.width * 0.4 * 1.4)
                                    
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 20).stroke(Color.yellow, lineWidth: imageStyle == selectedStyle ? 3 : 0)
                                        }
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                }
                                
                            }
                        }
                    }
                })
                Spacer()
                Text("Enter a prompt")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.white)
                TextEditor(text: $promptText)
                    .scrollContentBackground(.hidden)
                    .padding()
                    .background(Color.gray.opacity(0.15))
                    .cornerRadius(12)
                    .foregroundColor(.white)
                    .tint(Color.yellow)
                
                VStack (alignment: .center) {
                    NavigationLink {
                        GenerateView(viewModel: .init(prompt: promptText, selectedStyle: selectedStyle))
                    } label: {
                        Text("Generate")
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.yellow)
                            .clipShape(Capsule())
                    }
                }
                .frame(maxWidth: .infinity)
                
            }
            .padding()
            .background(Color.black.edgesIgnoringSafeArea(.all))
        }
    }
}

#Preview {
    PromptView()
}
