//
//  Filter.swift
//  Castelturismo
//
//  Created by Martin on 22/05/22.
//

import Foundation

class Filter: Codable {
	var isChecked: Bool
	var id: Int
	
	public init(id: Int, isChecked: Bool) {
		self.id = id
		self.isChecked = isChecked
	}
	
	public static func updateFilter(id: Int, isChecked: Bool) {
		let filtersData = UserDefaults.standard.data(forKey: "filters")
		
		var filters = [Filter]()
		if filtersData != nil {
			filters = try! JSONDecoder().decode([Filter].self, from: filtersData!)
		} else {
			filters = getDefaultFilters()
		}
		
		filters[id].isChecked = isChecked
		
		let newFiltersData = try! JSONEncoder().encode(filters)
		UserDefaults.standard.set(newFiltersData, forKey: "filters")
	}
	
	public static func getFilters() -> [Filter] {
		let filtersData = UserDefaults.standard.data(forKey: "filters")
		
		// setup default filters if not in user defaults
		var filters = [Filter]()
		if(filtersData != nil) {
			filters = try! JSONDecoder().decode([Filter].self, from: filtersData!)
		} else {
			filters = getDefaultFilters()
		}
		
		return filters
	}
	
	public static func getDefaultFilters() -> [Filter] {
		var filters = [Filter]()
		for i in 0..<6 {
			filters.append(Filter(id: i, isChecked: false))
		}
		
		return filters
	}
}
