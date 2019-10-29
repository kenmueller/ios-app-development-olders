import SwiftUI

struct TitleText: View {
	let text: String
	
	var body: some View {
		Text(text)
			.bold()
			.font(.title)
			.frame(maxWidth: .infinity, alignment: .leading)
	}
}

#if DEBUG
struct TitleText_Previews: PreviewProvider {
	static var previews: some View {
		TitleText(text: "Fraction Reducer")
	}
}
#endif
