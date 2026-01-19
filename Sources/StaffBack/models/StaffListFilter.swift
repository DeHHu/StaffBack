import Foundation

// MARK: - StaffListFilter - это отправляем
public struct StaffListFilter: Codable, Sendable {
	public let filters: Filters
	
	public init(filters: Filters) {
		self.filters = filters
	}
        // MARK: - Filters
	public struct Filters: Codable, Sendable {
		
		public init(
			oiv: [Int]? = [],
			organisations: [String]? = nil,
			products: [String]? = nil,
			subdivisions: [String]? = nil,
			positions: [String]? = nil,
			addresses: [String]? = nil,
			locations: [String]? = nil,
			gender: String? = nil,
			statuses: [String]? = nil,
			employedDateRange: EmployedDateRange? = nil
		) {
			self.oiv = oiv
			self.organisations = organisations
			self.products = products
			self.subdivisions = subdivisions
			self.positions = positions
			self.addresses = addresses
			self.locations = locations
			self.gender = gender
			self.statuses = statuses ?? []
			self.employedDateRange = employedDateRange
		}
        //Список идентификаторов ОИВов. Если не указан — поиск по всем.
		public var oiv: [Int]?
        //Список идентификаторов организаций (юридических лиц), относящихся к выбранным ОИВам.
		public var organisations: [String]?
        //Список идентификаторов продуктов, связанных с выбранными ОИВами.
		public var products: [String]?
        //Список подразделений, связанных с выбранными организациями.
		public var subdivisions: [String]?
        //Список должностей, связанных с выбранными организациями.
		public var positions: [String]?
        //Список адресов (офисов).
		public var addresses: [String]?
        //Список идентификаторов этажей по выбранным адресам.
		public var locations: [String]?
        //Пол сотрудника. Если не указан — поиск по обоим.
		public var gender: String?
        /**
            Массив значений статусов.
            Возможные значения:
            Если статуса нет - то не присылать
            vacation – отпуск
            maternityLeave – декрет
            sickLeave – больничный
            birthday - день рождения сегодня
        */
		public var statuses: [String]?
        //Диапазон дат приёма на работу.
		public var employedDateRange: EmployedDateRange?
		
    }

    // MARK: - EmployedDateRange
	public struct EmployedDateRange: Codable, Sendable {
		public  let from, to: String?
    }
}


