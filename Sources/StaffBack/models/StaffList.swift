import Foundation

// MARK: - StaffList
public struct StaffList: Codable, Sendable {
    //ID последнего сотрудника из текущей выборки (используется для скролла страниц с сотрудниками, совместно с передаваемым параметром afterId) 
    public let lastID: String?
	public let list: [StaffMember]
	
	public init(list: [StaffMember] = [], lastId: String? = nil) {
		self.list = list
		self.lastID = lastId
	}
	

    enum CodingKeys: String, CodingKey {
        case lastID = "lastId"
        case list
    }
}

public struct StaffMember: Codable,Identifiable, Sendable, CustomStringConvertible {
	public var description: String { "id: \(id) \(fullName)" }
	///Идентификатор сотрудника
	public let id: String
	///ФИО сотрудника
	public let fullName, firstName, lastName: String
	///Отчество
	public let middleName: String?
	///Пол сотрудника. Возможные значения: "male", "female". В случае, если у сотрудника не заполнен пол и в ответе не пришёл параметр gender, то производить поиск по обоим полам.
	public let gender: String?
	///Ссылка на фото
	public let photoURL: String
	///Должность
	public let position: StaffInfo
	///Данные об ОИВ
	public let oiv: StaffInfo?
	///Продукт
	public let product: StaffInfo?
	///Организация
	public let organisation: StaffInfo?
	///Подразделение
	public let subdivision: StaffInfo?
	///Массив значений статусов.
	public let statuses: [Status]?
	///Совместительство. Если не пришло — совместительства нет
	public let employmentType: EmploymentType?

	public enum CodingKeys: String, CodingKey {
		case id, fullName, firstName, lastName, middleName, gender
		case photoURL = "photoUrl"
		case position, oiv, product, organisation, subdivision, statuses
		case employmentType
	}

	// MARK: - Status
	public struct Status: Codable, Sendable {
		let id: String
		let to: String?
		
		init(id: String, to: String? = nil) {
			self.id = id
			self.to = to
		}
	}
	
	public init(
		id: String,
		fullName: String,
		firstName: String,
		lastName: String,
		middleName: String? = nil,
		gender: String? = nil,
		photoURL: String,
		position: StaffInfo,
		oiv: StaffInfo? = nil,
		product: StaffInfo? = nil,
		organisation: StaffInfo? = nil,
		subdivision: StaffInfo? = nil,
		statuses: [Status]? = nil,
		employmentType: EmploymentType?
	) {
		self.id = id
		self.fullName = fullName
		self.firstName = firstName
		self.lastName = lastName
		self.middleName = middleName
		self.gender = gender
		self.photoURL = photoURL
		self.position = position
		self.oiv = oiv
		self.product = product
		self.organisation = organisation
		self.subdivision = subdivision
		self.statuses = statuses
		self.employmentType = employmentType
	}
}

public enum EmploymentType: String, Codable, Sendable {
	///main — основное место работы
	case main
	///secondary — совместительство,
	case secondary
}
