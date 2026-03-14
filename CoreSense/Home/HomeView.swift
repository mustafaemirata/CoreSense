//
//  HomeView.swift
//  CoreSense
//
//  Created by Mustafa Emir Ata on 14.03.2026.
//

import SwiftUI

struct HomeView: View {
    @State private var userInput: String = ""
    @State private var result: String = "Mesajınızı yazıp analiz edin."
    
    var body: some View {
        VStack(spacing: 25) {
            Text("AI Metin Analizörü")
                .font(.system(size: 28, weight: .bold, design: .rounded))
                .padding(.top)

            TextEditor(text: $userInput)
                .frame(height: 150)
                .padding(10)
                .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.secondary.opacity(0.5), lineWidth: 1))
                .padding(.horizontal)

            Button(action: {
                result = MLManager.duyguAnaliziYap(metin: userInput)
            }) {
                Text("Analiz Et")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding(.horizontal)

            VStack {
                Text("Analiz Sonucu:")
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text(result)
                    .font(.title3)
                    .bold()
                    .multilineTextAlignment(.center)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(12)
            .padding(.horizontal)

            Spacer()
        }
    }
}
#Preview {
    HomeView()
}
