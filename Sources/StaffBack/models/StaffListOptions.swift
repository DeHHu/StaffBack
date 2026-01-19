import Foundation

// MARK: - StaffListOptions - это отправляем
public struct StaffListOptions: Codable, Sendable {
	public let options: Options
        // MARK: - Options
	public struct Options: Codable, Sendable {
        //Признак отображения уволенных сотрудников: true — показывать, false — скрывать. Если значение true , то следует показывать уволенных сотрудников в дополнение к работающим.
		public let isFired: Bool
        //Диапазон дат увольнения
		public  let firedDateRange: FiredDateRange?
    }

    // MARK: - FiredDateRange
	public struct FiredDateRange: Codable, Sendable {
		public let from, to: String?
    }
}


