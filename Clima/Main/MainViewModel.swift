//
//  MainViewModel.swift
//  Clima
//
//  Created by mabas on 22/08/24.
//

import Foundation

class MainViewModel: ObservableObject {
	// MARK: - Client Selection vars
	@Published var clientSelectedCity: Ciudad = .cdmx
	
	
	// MARK: - Mock Settings vars
	@Published var tempText: String = ""
	@Published var isRaining: Bool = false
	@Published var mockSelectedCity: Ciudad = .cdmx

	@Published var climaCity: [Ciudad: Clima] = [:]
	
	@Published var locationManager = LocationManager()
	
	func setNewCityWeather() {
		let selectedClima = Clima(estado : isRaining , temperatura : Double(tempText) ?? 0)
		climaCity[mockSelectedCity] = selectedClima
	}
}
