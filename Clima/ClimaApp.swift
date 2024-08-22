//
//  ClimaApp.swift
//  Clima
//
//  Created by mabas on 22/08/24.
//

import SwiftUI

@main
struct ClimaApp: App {
	var locationManager = LocationManager()

    var body: some Scene {
        WindowGroup {
					MainView(viewModel: MainViewModel())
        }
    }
}
