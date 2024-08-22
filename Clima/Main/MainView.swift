//
//  MainView.swift
//  Clima
//
//  Created by mabas on 22/08/24.
//

import SwiftUI

struct MainView: View {
	@ObservedObject var viewModel: MainViewModel

	var body: some View {
		VStack(spacing: 0){
			VStack { //Informacion
				Text(
					"\(viewModel.locationManager.location?.coordinate.latitude) \( viewModel.locationManager.location?.coordinate.longitude)")
				if let clientSelectedCity = viewModel.climaCity[viewModel.clientSelectedCity] {
					Text("La temperatura es: \(clientSelectedCity.temperatura)")
				} else {
					Text("No tengo informacion de esta ciudad")
				}
				Text("Selecciona la ciudad")
				Picker(selection: $viewModel.clientSelectedCity, label: Text("Ciudad")) {
					ForEach(Ciudad.allCases) { city in
						Text(city.rawValue).tag(city)
					}
				}
				Spacer()
			}
			.padding()
			.background{
				if let lluvia = viewModel.climaCity[viewModel.clientSelectedCity]?.estado {
					Image(lluvia ? "lluvia" : "sol")
						.resizable()
						.aspectRatio(contentMode: .fill)
				} else {
					Image(systemName: "questionmark")
						.resizable()
						.aspectRatio(contentMode: .fill)
						.padding(100)
				}
			}

			Divider().layoutPriority(2).padding(.bottom)
			VStack {
				HStack{
					Text("Temperatura")
					TextField("Temperatura °C", text: $viewModel.tempText)
				}
				HStack{
					Toggle(isOn: $viewModel.isRaining) {
						Label(
							title: { Text("Llueve") },
							icon: {Image(systemName: "cloud.rain.fill") }
						)
					}
				}
				HStack{
					Text("Ciudad")
					Picker(selection: $viewModel.mockSelectedCity, label: Text("Ciudad")) {
						ForEach(Ciudad.allCases) { city in
							Text(city.rawValue).tag(city)
						}
					}
				}
				Button("Guardar") {
					viewModel.setNewCityWeather()
				}
			}.padding()
		}
		.onAppear {
			DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
				print("Starting location request permissions")
				self.viewModel.locationManager.request()
				print("Location permissions requested")
			}

			//viewModel.locationManager.request()
		}
	}
}

#Preview {
	MainView(viewModel: MainViewModel())
}

