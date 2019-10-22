import SwiftUI

struct HomeView: View {
	@State var input = ""
	
	var output: (numerator: Int, denominator: Int, isValid: Bool)? {
		if input.isEmpty { return nil }
		
		let parts = input.split(separator: Character("/")).compactMap {
			Int(String($0).trimmingCharacters(in: .whitespacesAndNewlines))
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
	
	var outputView: AnyView {
		guard let output = output else { return AnyView(EmptyView()) }
		return output.isValid
			? AnyView(OutputView(
				numerator: output.numerator,
				denominator: output.denominator,
				errorMessage: nil
			))
			: AnyView(OutputView(
				numerator: 0,
				denominator: 0,
				errorMessage: "There was an error parsing your input"
			))
	}
	
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
	
	var body: some View {
		NavigationView {
			VStack {
				Text("YOUR FRACTION")
					.bold()
					.font(.caption)
					.foregroundColor(.gray)
					.frame(maxWidth: .infinity, alignment: .leading)
				TextField("", text: $input)
					.textFieldStyle(RoundedBorderTextFieldStyle())
				outputView
				Spacer()
			}
			.padding(.top, 10)
			.padding(.horizontal, 20)
			.navigationBarTitle("Fraction Reducer")
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
