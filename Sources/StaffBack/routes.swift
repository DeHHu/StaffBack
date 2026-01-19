import Vapor

func routes(_ app: Application) throws {
	
	guard let store: Store = app.storage.get(StoreKey.self) else {
		throw Abort(.internalServerError, reason: "No store found in application storage")
	}

	app.post("v1","colleagues","oivs") { req async throws -> BasicResponse<OivList> in
		try await Task.sleep(for: .seconds(1))
		let params = try? req.content.decode(StaffRequestParams.self)
		
		let oivs = await store.oivs
		guard let params else  {
			return .init(data: .init(oivs: oivs),isError: false,timestamp: Date.timeIntervalSinceReferenceDate.description)
		}
		let list = await store.filtersMembers(params: params)
		
		let dict = Dictionary(grouping: list) { member in
			member.oiv?.id
		}
		var newOivs: [Oiv] = []
		for oiv in oivs {
			let members = dict["\(oiv.id)"]
			newOivs.append(.init(id: oiv.id, name: oiv.name, count: members?.count ?? -1, minister: oiv.minister))
		}
		
		return .init(data: .init(oivs: newOivs),isError: false,timestamp: Date.timeIntervalSinceReferenceDate.description)
	}
	
	app.post("v1","colleagues") { req async throws -> BasicResponse<StaffList> in
		try await Task.sleep(for: .seconds(1))
		let params = try req.content.decode(StaffRequestParams.self)
		let list = await store.getMembers(params: params)
		let staffList = StaffList(list: list, lastId: nil)
		return .init(data: staffList,isError: false,timestamp: Date.timeIntervalSinceReferenceDate.description)
	}
	
	
	app.post("v1","colleagues", "filters") { req async throws -> BasicResponse<StaffFilter> in
		try await Task.sleep(for: .seconds(1))
		let params = try req.content.decode(StaffRequestParams.self)
		let filters = params.filters
		let res = await store.getFilters(staffFilter: filters)
		return .init(data: .init(filters: res.filters),isError: false,timestamp: Date.timeIntervalSinceReferenceDate.description)
	}
}
