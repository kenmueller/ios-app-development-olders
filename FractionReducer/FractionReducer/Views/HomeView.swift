import SwiftUI

struct HomeView: View {
	@State var input = ""
	
	func reduceFraction(_ numerator: Int, _ denominator: Int) -> (numerator: Int, denominator: Int) {
		var x = numerator
		var y = denominator
		while (y != 0) {
			let temp = y
			y = x % y
			x = temp
		}
		return (numerator / x, denominator / x)
	}
	
	var output: (numerator: Int, denominator: Int, isValid: Bool)? {
		if input.isEmpty { return nil }
		
		let parts = input.split(separator: Character("/")).compactMap {
			Int(String($0).trimmingCharacters(in: .whitespaces))
		}
		
		guard
			parts.count == 2,
			let numerator = parts.first,
			let denominator = parts.last,
			denominator != 0
		else { return (0, 0, false) }
		
		let reducedFraction = reduceFraction(numerator, denominator)
		return (reducedFraction.numerator, reducedFraction.denominator, true)
	}
	
	var body: some View {
		ZStack {
			LinearGradient(
				gradient: .init(colors: [
					.init("LightBackground"),
					.init("Purple")
				]),
				startPoint: .top,
				endPoint: .bottom
			)
			.edgesIgnoringSafeArea(.all)
			VStack {
				VStack {
					TitleText(text: "Fraction Reducer")
						.padding(.bottom, 30)
					Text("YOUR FRACTION")
						.bold()
						.font(.caption)
						.foregroundColor(.gray)
						.frame(maxWidth: .infinity, alignment: .leading)
					TextField("", text: $input)
						.textFieldStyle(RoundedBorderTextFieldStyle())
					if output != nil {
						if output!.isValid {
							OutputView(
								numerator: output!.numerator,
								denominator: output!.denominator,
								errorMessage: nil
							)
						} else {
							OutputView(
								numerator: 0,
								denominator: 0,
								errorMessage: "There was an error parsing your input"
							)
						}
					}
				}
				.padding(.horizontal, 20)
				Spacer()
				ZStack(alignment: .bottom) {
					BottomGradient()
					Text("By Ken Mueller")
						.bold()
						.foregroundColor(.white)
						.padding(.bottom, 40)
				}
			}
			.edgesIgnoringSafeArea(.bottom)
			.padding(.top)
		}
	}
}

#if DEBUG
struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView()
	}
}
#endif
