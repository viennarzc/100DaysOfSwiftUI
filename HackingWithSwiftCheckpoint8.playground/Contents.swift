import UIKit

var greeting = "Hello, playground"

protocol Building {
	var rooms: Int { get set }
	var cost: Int { get set }
	var agentName: String { get set }
	
	func showSalesSummary()
	
}

extension Building {
	func showSalesSummary() {
		print("The price is \(cost * rooms) for a total of \(rooms) rooms")
	}
}


struct House: Building {
	var rooms: Int
	
	var cost: Int
	
	var agentName: String
	
}

struct Office: Building {
	var rooms: Int
	
	var cost: Int
	
	var agentName: String
	
	
}


let bahay = House(rooms: 3, cost: 20000, agentName: "Cher")

let opis = Office(rooms: 10, cost: 52000, agentName: "Jun")

print(bahay.showSalesSummary())
print(opis.showSalesSummary())
