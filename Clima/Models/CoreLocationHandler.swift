//
//  CoreLocationHandler.swift
//  Clima
//
//  Created by mabas on 22/08/24.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
	private var locationManager = CLLocationManager()
	
	@Published var location: CLLocation? = nil
	@Published var authorizationStatus: CLAuthorizationStatus?
	
	override init() {
		super.init()
		self.locationManager.delegate = self
		self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
		
		// Solicitar permisos de ubicación programáticamente
		//self.locationManager.requestWhenInUseAuthorization()
	
	}
	
	func request() {
		self.locationManager.requestAlwaysAuthorization()
	}
	
	func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
		self.authorizationStatus = status
		if status == .authorizedWhenInUse || status == .authorizedAlways {
			self.locationManager.startUpdatingLocation()
		} else {
			self.locationManager.requestAlwaysAuthorization()

			// Manejar la situación en la que el usuario no ha dado permiso
		}
	}
	
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		if let location = locations.last {
			self.location = location
			print("Ubicación actual: \(location.coordinate.latitude), \(location.coordinate.longitude)")
		}
	}
	
	func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
		print("Error al obtener la ubicación: \(error.localizedDescription)")
	}
}
