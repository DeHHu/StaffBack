import Foundation

// MARK: - OivList
struct OivList: Codable {
    let oivs: [Oiv]
}


public struct Oiv: Codable, Sendable, Equatable, Identifiable, Hashable {
	//Идентификатор ОИВ.
	public let id: Int
	//Наименование ОИВ.
	public let name: String
	//Количество сотрудников, относящихся к данному ОИВу (учитывает текущие фильтры).
	public var count: Int
	//Объект с данными министра/руководителя, относящегося к ОИВу.
	public let minister: Minister
	
	public init(id: Int, name: String, count: Int, minister: Minister) {
		self.id = id
		self.name = name
		self.count = count
		self.minister = minister
	}
}

// MARK: - Minister
public struct Minister: Codable, Sendable, Equatable, Hashable {
	//Идентификатор министра/руководителя ОИВ.
	public let id: Int
	//ФИО
	public let firstName, middleName, lastName, fullName: String
	//Ссылка на фото
	public let imageURL: String?
	//Должность
	public let description: String
	
	public init(
		id: Int,
		firstName: String,
		middleName: String,
		lastName: String,
		fullName: String,
		imageURL: String?,
		description: String
	) {
		self.id = id
		self.firstName = firstName
		self.middleName = middleName
		self.lastName = lastName
		self.fullName = fullName
		self.imageURL = imageURL
		self.description = description
	}

	public enum CodingKeys: String, CodingKey {
		case id, firstName, middleName, lastName, fullName
		case imageURL = "imageUrl"
		case description
	}
}
