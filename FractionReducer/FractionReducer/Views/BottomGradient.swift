import SwiftUI

struct BottomGradient: View {
	var body: some View {
		let width = UIScreen.main.bounds.width
		let height: CGFloat = 300
		let midHeight: CGFloat = 180
		return Path { path in
			path.addLines([
				.init(x: 0, y: height),
				.init(x: 0, y: height - midHeight),
				.init(x: width, y: 0),
				.init(x: width, y: height)
			])
		}
		.fill(LinearGradient(
			gradient: .init(colors: [
				.init("LightBlue"),
				.init("Purple")
			]),
			startPoint: .top,
			endPoint: .bottom
		))
		.frame(height: height)
	}
}

#if DEBUG
struct BottomGradient_Previews: PreviewProvider {
	static var previews: some View {
		BottomGradient()
	}
}
#endif
