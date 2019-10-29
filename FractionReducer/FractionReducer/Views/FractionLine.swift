import SwiftUI

struct FractionLine: View {
	let width: CGFloat
	
	var body: some View {
		Rectangle()
			.frame(width: width, height: 1.5)
			.padding(.horizontal, 50)
			.padding(.top, -7)
	}
}

#if DEBUG
struct FractionLine_Previews: PreviewProvider {
	static var previews: some View {
		FractionLine(width: UIScreen.main.bounds.width - 40)
	}
}
#endif
