import Foundation
// MARK: - Oiv, Product, Organisation, etc...
public struct StaffInfo: Codable, Sendable, Equatable,Hashable, Identifiable {
    public let id, name: String
	
	public init(id: String, name: String) {
		self.id = id
		self.name = name
	}
}
