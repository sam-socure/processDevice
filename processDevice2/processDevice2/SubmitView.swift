//
//  SubmitView.swift
//  processDevice2
//
//  Created by Samuel Huang on 5/20/25.
//

import SwiftUI
import DeviceRisk

struct SubmitView: View {
    @State private var sessionToken: String = "Session token will appear here"

    var body: some View {
        VStack(spacing: 30) {
            Text("Submit page")
                .font(.title)
                .padding(.top, 50)

            Spacer()

            Text(sessionToken)
                .padding()
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)

            Spacer()

            Button(action: sendCheckoutData) {
                Text("Submit")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
        }
        .background(Color.white)
    }

    func sendCheckoutData() {
        Task {
            do {
                print("Calling getSessionToken()")
                let sessionTokenFromGet = try await SigmaDevice.getSessionToken()
                print("getSessionToken returned: \(sessionTokenFromGet)")

                print("Calling processDevice(context: .checkout)")
                let sessionTokenFromProcess = try await SigmaDevice.processDevice(context: .checkout)
                print("processDevice returned: \(sessionTokenFromProcess)")

                UserDefaults.standard.setValue(sessionTokenFromProcess, forKey: "SocureDeviceRiskUUID")
                DispatchQueue.main.async {
                    self.sessionToken = "Session Token:\n\(sessionTokenFromProcess)"
                }
            } catch {
                print("Error in sendCheckoutData: \(error)")
                DispatchQueue.main.async {
                    self.sessionToken = "Error: \(error.localizedDescription)"
                }
            }
        }
    }
}
