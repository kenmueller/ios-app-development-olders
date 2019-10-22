import SwiftUI

struct OutputView: View {
	let numerator: Int
	let denominator: Int
	let errorMessage: String?
	
	var separatorWidth: Int {
		max(String(numerator).count, String(denominator).count) * 11 + 30
	}
	
	var body: some View {
		VStack {
			Divider()
				.padding(.vertical, 20)
			if errorMessage == nil {
				Text(String(numerator))
					.bold()
				if denominator != 1 {
					VStack {
						Rectangle()
							.frame(width: .init(separatorWidth), height: 1.5)
							.padding(.horizontal, 50)
							.padding(.top, -7)
						Text(String(denominator))
							.bold()
							.padding(.top, -8)
					}
				}
			} else {
				Text(errorMessage ?? "An error occurred")
					.fontWeight(errorMessage == nil ? .bold : .regular)
					.foregroundColor(errorMessage == nil ? .black : Color.red.opacity(0.8))
			}
		}
	}
}

#if DEBUG
struct OutputView_Previews: PreviewProvider {
	static var previews: some View {
		OutputView(numerator: 1, denominator: 5, errorMessage: nil)
	}
}
#endif
