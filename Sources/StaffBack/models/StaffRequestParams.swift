//
//  StaffRequestParams.swift
//  Staff
//
//  Created by Денис Садаков on 19.11.2025.
//

import Foundation

public struct StaffRequestParams: Codable, Sendable {
	public let filters: StaffListFilter?
	public let options: StaffListOptions.Options?
	public let limit: Int?
	public let query: String?
	public let afterId: String?
	
	
	public init(
		filters: StaffListFilter? = nil,
		options: StaffListOptions.Options? = nil,
		limit: Int? = nil,
		query: String? = nil,
		afterId: String? = nil
	) {
		self.filters = filters
		self.options = options
		self.limit = limit
		self.query = query
		self.afterId = afterId
	}
}
