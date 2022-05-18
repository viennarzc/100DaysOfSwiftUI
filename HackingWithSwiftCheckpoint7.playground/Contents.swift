import UIKit

class Animal {
	let legs: Int
	init(legs: Int) {
		self.legs = legs
	}
}


class Dog: Animal {
	override init(legs: Int) {
		super.init(legs: legs)
	}
	
	func speak() {
		print("bark")
	}
}


class Corgi: Dog {
	
}

class Poodle: Dog {
	
}

class Cat: Animal {
	var isTame: Bool
	
	init(isTame: Bool, legs: Int) {
		self.isTame = isTame
		super.init(legs: legs)
	}
	
	
	func speak() {
		print("meow")
	}
}

class Persian: Cat {
	
}

class Lion: Cat {
	
}
