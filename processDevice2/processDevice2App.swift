//
//  processDevice2App.swift
//  processDevice2
//
//  Created by Samuel Huang on 5/20/25.
//

import SwiftUI
import DeviceRisk

@main
struct SocureSwiftUIAppApp: App {

    init() {
        SigmaDevice.initializeSDK("sdk_key", options: nil) { sessionToken, error in
            if let error = error {
                print("SDK init failed: \(error)")
            } else {
                print("SDK initialized. Token: \(sessionToken ?? "nil")")
            }
        }
    }

    var body: some Scene {
        WindowGroup {
            NavigationView {
                LandingView()
            }
        }
    }
}
