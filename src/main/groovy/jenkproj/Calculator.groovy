package jenkproj

class Calculator {
	public Calculator() {
		
	}
	
	public def addTwoTens() {
		println "Two Tens add up to Twenty. Really!"
	}
	
	public static void main(String[] args) {
		new Calculator().addTwoTens()
	}
}

