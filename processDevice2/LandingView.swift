//
//  LandingView.swift
//  processDevice2
//
//  Created by Samuel Huang on 5/20/25.
//

import SwiftUI

struct LandingView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("App 1")
                .font(.largeTitle)
                .fontWeight(.bold)

            NavigationLink(destination: SubmitView()) {
                Text("Go to Submit")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
        }
        .frame(maxHeight: .infinity)
        .background(Color.white)
    }
}
