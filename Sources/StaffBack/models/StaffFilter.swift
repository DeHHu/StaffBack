//
//  StaffFilterForm.swift
//  StaffBack
//
//  Created by Денис Садаков on 11.12.2025.
//


struct StaffFilter: Codable {
    let filters: Filters
    // MARK: - Filters
    struct Filters: Codable {
		var oiv: [StaffInfo]?
		var organisations: [StaffInfo]?
		var products: [StaffInfo]?
        var subdivisions: [StaffInfo]?
		var positions: [StaffInfo]?
		var addresses: [StaffInfo]?
        var locations: [StaffInfo]?
    }
}
