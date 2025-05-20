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
        SigmaDevice.initializeSDK("d0133035-9a63-4e12-bba4-6242560eb51b", options: nil) { sessionToken, error in
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
