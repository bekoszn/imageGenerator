//
//  GenerateView.swift
//  imageGenerator
//
//  Created by Berke Özgüder on 22.07.2024.
//

import SwiftUI

struct GenerateView: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Generated Image")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)
            VStack {
                Text("Loading... \("")")
                AsyncImage(url: viewModel.image) { image in
                    image.resizable().aspectRatio(1, contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
                .background(Color.gray.opacity(0.2))
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .cornerRadius(20)
                .clipped()
            }
            Spacer()
        }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.black.edgesIgnoringSafeArea(.all))
            .onAppear {
                viewModel.generateImage()
            }

        }
    }

#Preview {
    GenerateView(viewModel: .init(prompt: "red car", selectedStyle: .threeDRender))
}
