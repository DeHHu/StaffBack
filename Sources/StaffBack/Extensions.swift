//
//  Extensions.swift
//  StaffBack
//
//  Created by Денис Садаков on 11.12.2025.
//
import Foundation

extension String {
	func date(with style: String = "yyyy-MM-dd'T'HH:mm:ss") -> Date? {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = style
		dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)!
		let date = dateFormatter.date(from: self)
		return date
	}

}
