//
//  BacisResponse.swift
//  MTCore
//
//  Created by Артём Балашов on 27.07.2024.
//  Copyright © 2024 DIT Moscow. All rights reserved.
//

import Foundation
import Vapor

public struct BasicResponse<T: Codable>: Codable, AsyncResponseEncodable {
	public func encodeResponse(for request: Vapor.Request) async throws -> Vapor.Response {
		var headers = HTTPHeaders()
				headers.add(name: .contentType, value: "Application/JSON")
				return Response(
					status: .ok,
					headers: headers,
					body: .init(data: try JSONEncoder().encode(self))
				)
	}
	

	public let data: T?
	public let isError: Bool?
	public let errorDescription: String?
	public let timestamp: String?
	public lazy var responseServerDate: Date? = {
		timestamp?.date()
	}()
	
	public init(
		data: T? = nil,
		isError: Bool? = nil,
		errorDescription: String? = nil,
		timestamp: String? = nil,
		responseServerDate: Date? = nil
	) {
		self.data = data
		self.isError = isError
		self.errorDescription = errorDescription
		self.timestamp = timestamp
		self.responseServerDate = responseServerDate
	}
}
