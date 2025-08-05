//
//  ScappApp.swift
//  Scapp
//
//  Created by Hamza Wahab on 05/08/2025.
//

import SwiftUI

@main
struct ScappApp: App {
    @StateObject var vm: LocationsViewModel = LocationsViewModel()
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
