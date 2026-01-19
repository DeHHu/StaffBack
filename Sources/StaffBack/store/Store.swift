//
//  Store.swift
//  StaffBack
//
//  Created by Денис Садаков on 11.12.2025.
//

import Foundation

actor Store {
	
	var members: [StaffMember] = []
	var baseUrl: String = ""
	var oivs: [Oiv] = []
	var organisations: [StaffInfo] = [
		.init(id: UUID().uuidString, name: "Адептус Астартес"),
		.init(id: UUID().uuidString, name: "Адепта Сороритас"),
		.init(id: UUID().uuidString, name: "Адептус Механикус"),
		.init(id: UUID().uuidString, name: "Империум Человечества"),
		.init(id: UUID().uuidString, name: "Имперская Гвардия"),
		.init(id: UUID().uuidString, name: "Инквизиция")
	]
	
	var products: [StaffInfo] = [
		.init(id: UUID().uuidString, name: "Варп-двигатель"),
		.init(id: UUID().uuidString, name: "Золотой трон"),
		.init(id: UUID().uuidString, name: "Боескафандры"),
		.init(id: UUID().uuidString, name: "ВОКС оборудование"),
		.init(id: UUID().uuidString, name: "Сервочереп"),
		.init(id: UUID().uuidString, name: "Засекречено")
	]
	
	
	var divisions: [StaffInfo] = [
		.init(id: UUID().uuidString, name: "Культ Сервиторов"),
		.init(id: UUID().uuidString, name: "Культ Навигаторов"),
		.init(id: UUID().uuidString, name: "Культ Виртус"),
		.init(id: UUID().uuidString, name: "Культ Кибернетики"),
		.init(id: UUID().uuidString, name: "Культ Архивов"),
		.init(id: UUID().uuidString, name: "Культ Скрижалей")
	]
	
	var locations: [StaffInfo] = [
		.init(id: UUID().uuidString, name: "Крипта Девяти Миллиардов Имён"),
		.init(id: UUID().uuidString, name: "Литий-Бета, Поющий Форг-мир"),
		.init(id: UUID().uuidString, name: "Ядерный Престол Ризы-Секунда"),
		.init(id: UUID().uuidString, name: "Станция “Семь Часов До Полуночи”"),
		.init(id: UUID().uuidString, name: "Чернильные Колодцы Сигиллита (тайный архив)"),
		.init(id: UUID().uuidString, name: "Форт-Карантин “Сорок Первый Печатник”")
	]
	var addresses: [StaffInfo] = [
		.init(id: UUID().uuidString, name: "Armageddon Prime, Hive Tartarus, Level 87, Block K-19-Theta"),
		.init(id: UUID().uuidString, name: "Mars, Forge Manufactorum IX, Sub-Level 204-B, Cogitator Vault 7"),
		.init(id: UUID().uuidString, name: "Yakov-Apostol Prime, Plasma-Forges Delta, Turbine Chamber 56, Servitor Bay 312"),
		.init(id: UUID().uuidString, name: "Terra, Holy Terra, Senatorum Spire, Level 999, Apartment Sanctus-42"),
		.init(id: UUID().uuidString, name: "Cad ia, Fortress Cadian Gate, Barracks Sector 14, Platoon Quarters Gamma"),
		.init(id: UUID().uuidString, name: "Commorragh, Dark Eldar Spire, Torture-Pit XIV, Slave-Quarters Omega"),
		.init(id: UUID().uuidString, name: "Cadia, Kasr Vortan, Siege Bastion Delta-9, Shrine of the Emperor’s Wrath"),
		.init(id: UUID().uuidString, name: "Holy Terra, Administratum Spire 777, Lex Chamber Primus, Data Sanctum IV"),
		.init(id: UUID().uuidString, name: "Armageddon, Hive Helsreach, Manufactorum 12-Gamma, Smog Vent District"),
		.init(id: UUID().uuidString, name: "Fenris, Ice Plateau Vargard, Space Wolves Fang, Hall of Echoes"),
		.init(id: UUID().uuidString, name: "Macragge, Fortress of Hera, Ultramar Bastion, Honor Hall Omega"),
		.init(id: UUID().uuidString, name: "Nocturne, City of Hesiod, Forge Temple XI, Promethium Catacombs"),
		.init(id: UUID().uuidString, name: "Necromunda, Underhive Sec-42, Corpse Grinders’ Den, Reclamation Pit Theta"),
		.init(id: UUID().uuidString, name: "Commorragh, High Spire Zarakthul, Arena of Shattered Souls, Execution Balcony IX"),
		.init(id: UUID().uuidString, name: "Ba’al, Blood Angels Monastery, Reliquary of Sanguinius, Crypt Level XIII"),
		.init(id: UUID().uuidString, name: "Medusa, Forge-Spire Tertius, Iron Hands Foundry, Sector Ferrum-9"),
		.init(id: UUID().uuidString, name: "Catachan, Deathworld Basin Alpha, Jungle Outpost, Venom Grove Station"),
		.init(id: UUID().uuidString, name: "Mars, Noctis Labyrinthus, Forge Temple Omicron, Data Forge 23-Red"),
		.init(id: UUID().uuidString, name: "Prospero, City of Tizca, Obsidian Spire, Library of the Pyrae"),
		.init(id: UUID().uuidString, name: "Krieg, Siege Zone 445, Bunker Complex Sigma-Prime, Trenches of Faith"),
		.init(id: UUID().uuidString, name: "Cadia Ruins, Kasr Myrak, Warped Bastion, Chaos Shrine of Abaddon"),
		.init(id: UUID().uuidString, name: "Tanith, Ghost Regiment Camp, Forest Sector 9, Shade Encampment"),
		.init(id: UUID().uuidString, name: "Commorragh, Lower Webway Depths, Haemonculi Laboratory XZ-14, Flesh Vat District"),
		.init(id: UUID().uuidString, name: "Terra, Ecclesiarchal Palace, Basilica Mortis, Catacomb Wing Alpha"),
		.init(id: UUID().uuidString, name: "Vostroya, Firstborn Quarter, Manufactorum District, Plasma Refinery Beta"),
		.init(id: UUID().uuidString, name: "Cadia Fracture, Warp Rift Zone 13, Blackstone Fragment, Vigil Point Omega")

	]
	
	
	
	init(baseUrl: String) async {
		self.baseUrl = baseUrl
		await generate()
	}
	
	
	func generate() async {
		members = (0..<120).map { _ in
			let name = Store.name
			let surname = Store.surname
			let gender = Store.gender
			let rand = Int.random(in: 1...3)
			let oivName: String = if rand == 1 {
				"Дети Императора"
			} else if rand == 2 {
				"Космические Волки"
			} else {
				"Ультрамарины"
			}
			let rand2 = Int.random(in: 1...7)
			var empType: EmploymentType? = nil
			if rand2 == 1 {
				empType = Bool.random() ? .main : .secondary
			}
			
			let rand3 = Int.random(in: 1...8)
			var statuses: [StaffMember.Status] = []
			if rand3 == 1 {
				let rand4 = Int.random(in: 1...4)
				if rand4 == 1 {
					statuses.append(.init(id: "birthday"))
				} else if rand4 == 2 {
					statuses.append(.init(id: "maternityLeave"))
				} else if rand4 == 3 {
					statuses.append(.init(id: "vacation"))
				} else if rand4 == 4 {
					statuses.append(.init(id: "sickLeave"))
				}
			}
			return StaffMember(
				id: UUID().uuidString,
				fullName:  surname + " " + name,
				firstName: name,
				lastName: surname,
				middleName: nil,
				gender: gender,
				photoURL: Bool.random() ?  baseUrl + "/w40k/\(Int.random(in: 1...20)).jpg" : "",
				position: .init(id: UUID().uuidString, name: Store.occupation),
				oiv: StaffInfo(id: String(rand), name: oivName),
				product: products.randomElement(),
				organisation: organisations.randomElement(),
				subdivision: divisions.randomElement(),
				statuses: statuses,
				employmentType: empType
			)
		}.sorted {
			$0.oiv!.id < $1.oiv!.id
		}
		
		
		let empChilds = Oiv(
			id: 1,
			name: "Дети Императора",
			count: members.filter({
				$0.oiv?.id == "1"
			}).count,
			minister: Minister(
				id: 101,
				firstName: "Фулгрим",
				middleName: "",
				lastName: "",
				fullName: "Фулгрим",
				imageURL: baseUrl + "/w40k/fg.jpg",
				description: "Примарх ДИТ"
			)
		)
		
		let spaceWolves = Oiv(
			id: 2,
			name: "Космические Волки",
			count: members.filter({
				$0.oiv?.id == "2"
			}).count,
			minister: Minister(
				id: 102,
				firstName: "Леман",
				middleName: "",
				lastName: "Русс",
				fullName: "Леман Русс",
				imageURL: baseUrl + "/w40k/lr.jpg",
				description: "Примарх ГИН"
			)
		)
		
		let ultramarines = Oiv(
			id: 3,
			name: "Ультрамарины",
			count: members.filter({
				$0.oiv?.id == "3"
			}).count,
			minister: Minister(
				id: 103,
				firstName: "Робаут",
				middleName: "",
				lastName: "Жиллиман",
				fullName: "Робаут Жиллиман",
				imageURL: baseUrl + "/w40k/rg.jpg",
				description: "Примарх МосГорТРАНСов"
			)
		)
		
		oivs = [
			empChilds,
			spaceWolves,
			ultramarines
		]
	}
	
	
	func getMembers(params: StaffRequestParams) -> [StaffMember] {
		var members: [StaffMember] = self.members
		if let oivs = params.filters?.filters.oiv, !oivs.isEmpty {
			members = members.filter({
				oivs.contains(Int($0.oiv?.id ?? "-1") ?? -1 )
			})
		}
		
		if let query = params.query, !query.isEmpty {
			members = members.filter({
				$0.fullName.lowercased().contains(query.lowercased())
			})
		}
		if let gender = params.filters?.filters.gender {
			members = members.filter( { $0.gender == gender } )
		}
		guard let lastId = params.afterId else { return Array(members.prefix(20)) }
		guard !lastId.isEmpty else { return Array(members.prefix(20)) }
		guard let index = members.firstIndex(where:  { lastId == $0.id } )
		else {
			return []
		}
		if index+1 < members.count {
			var last = index + 20
			if index+20 >= members.count {
				last = members.count - 1
			}
			return Array(members[index+1...last])
		} else {
			return []
		}
	}
	
	func filtersMembers(params: StaffRequestParams) -> [StaffMember] {
		var members: [StaffMember] = self.members
		if let oivs = params.filters?.filters.oiv, !oivs.isEmpty {
			members = members.filter({
				oivs.contains(Int($0.oiv?.id ?? "-1") ?? -1 )
			})
		}
		
		if let query = params.query, !query.isEmpty {
			members = members.filter({
				$0.fullName.lowercased().contains(query.lowercased())
			})
		}
		if let gender = params.filters?.filters.gender {
			members = members.filter( { $0.gender == gender } )
		}
		return members
	}
	
	func getFilters(staffFilter: StaffListFilter?) -> StaffFilter {
		var res = StaffFilter.Filters(oiv: oivs.map { StaffInfo(id: String($0.id), name: $0.name)}, organisations: nil , products: nil, subdivisions: nil, positions: nil, addresses: addresses, locations: nil)
		guard let staffFilter else {
			return StaffFilter(filters: res)
		}
		if staffFilter.filters.addresses?.isEmpty == false || staffFilter.filters.oiv?.isEmpty == false {
			res.organisations = organisations
		}
		if staffFilter.filters.oiv?.isEmpty == false {
			res.products = products
		}
		if staffFilter.filters.organisations?.isEmpty == false &&
			staffFilter.filters.addresses?.isEmpty == false
		{
			res.subdivisions = divisions
		}
		if staffFilter.filters.organisations?.isEmpty == false &&
			staffFilter.filters.addresses?.isEmpty == false &&
			staffFilter.filters.oiv?.isEmpty == false &&
			staffFilter.filters.subdivisions?.isEmpty == false
		{
			res.locations = locations
		}
		return StaffFilter(filters: res)
	}
	
	static var gender: String {
		Bool.random() ? "male" : "female"
	}
	
	static var surname: String {
		let surnames = [
			"Гримнар", "Разоритель", "Коракс", "Красный", "Тигурий", "Вентан", "Арвида",
			"Котэс", "Страйфсон", "Шрайк", "Аргел", "Вентрис", "Мортарион", "Рем", "Зелл",
			"Гримальдус", "Таранис", "Шакал", "Талос", "Малхарион", "Бетанкор", "Рун",
			"Кёрз", "Тигурий", "Вардус", "Литтл", "Флойд", "Нокс", "Драк", "Кроун",
			"Локен", "Севатар", "Руна", "Вулф", "Терор", "Голдинг", "Дракол", "Норен",
			"Веланид", "Карзиан", "Трос", "Фаррелл", "Виндоу", "Прайм", "Мерваллион",
			"Алонсо", "Сторм", "Грей", "Дюран", "Кортез", "Гордан", "Варден", "Нортон",
			"Роллинс", "Грейвс", "Вест", "Тарион", "Каннингем", "Черч", "Барретт", "Грант",
			"Рейн", "Дарк", "Фрост", "Кэрролл", "Макгрегор", "Кросс", "Фергюсон", "Холл",
			"Элвин", "Фарроу", "Блэк", "Олден", "Серил", "Драммонд", "Брукс", "Сиверс",
			"Каллис", "Грейв", "Хант", "Флеминг", "Брент", "Уоллес", "Картер", "Дрейк",
			"Ламбер", "Ренар", "Кинкейд", "Макконнелл", "Гилберт", "Сандерс", "Перри",
			"Киллер", "Рандольф", "Фаулер", "Харрисон", "Прайс", "Томлинсон", "Эймс",
			"Клейтон", "Лафлин", "Харпер", "Кармайкл", "Уитман", "Джарретт", "Нэш",
			"Бишоп", "Макаллистер", "Винсент"
		]
		return surnames.randomElement() ?? ""
	}
	
	static var name: String  {
		let names = [
			"Фулгрим", "Логан", "Абаддон", "Корвус", "Ариман", "Данте", "Велиал", "Индрик",
			"Саммаил", "Кайваан", "Ревюэль", "Торквемада", "Леман", "Мортарион", "Магнус",
			"Хорус", "Сангвиний", "Ангрон", "Гарро", "Локен", "Аргел", "Саймон", "Талин",
			"Дак", "Скорн", "Заал", "Корон", "Кавик", "Гальва", "Эриан", "Тиран",
			"Древар", "Крис", "Ворн", "Жак", "Лазар", "Медвен", "Сталон", "Варис",
			"Крон", "Релан", "Габриэль", "Натан", "Исаак", "Меле", "Пэтрик", "Сиран",
			"Фенрис", "Талас", "Ксар", "Захар", "Браан", "Эго", "Торка", "Фарен",
			"Вейл", "Каллен", "Роан", "Дракен", "Свен", "Элерон", "Нейтан", "Орик",
			"Поллак", "Кидан", "Терон", "Вирак", "Серис", "Лайрик", "Корвин", "Тевар",
			"Зейн", "Ирис", "Ренар", "Калиус", "Майрен", "Галас", "Вилан", "Диксон",
			"Нерон", "Эндекс", "Тарос", "Карен", "Лиан", "Юрик", "Вентрис", "Делиан",
			"Сайрус", "Керн", "Омар", "Филан", "Эрик", "Сурен", "Ринас", "Дорен",
			"Марек", "Жан", "Винрель", "Сарен", "Элвин", "Тандор", "Грин", "Вилар"
		]
		return names.randomElement() ?? ""
	}
	
	static var occupation: String {
		[
			"Инквизитор",
			"Вольный торговец",
			"Комиссар",
			"Космодесантник",
			"Апотекарий",
			"Техномаг",
			"Навигатор",
			"Астропат",
			"Канонисса",
			"Сестра битвы",
			"Генерал Астра Милитарум",
			"Командир танка",
			"Пилот «Валькирии»",
			"Адепт Администратума",
			"Магос-биолог",
			"Магос-исследователь",
			"Культмеханик-скитарий"
		].randomElement() ?? ""
	}
}
