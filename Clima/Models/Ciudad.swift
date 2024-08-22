//
//  Ciudad.swift
//  Clima
//
//  Created by mabas on 22/08/24.
//

import Foundation

enum Ciudad : String, CaseIterable, Identifiable {
	
	case cdmx = "CDMX"
	case michoacan = "Michoacán"
	case queretaro = "Querétaro"
	case sanLuis = "San Luis"
	
	var id: String {
		self.rawValue
	}
}
