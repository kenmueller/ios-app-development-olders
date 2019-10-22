import SwiftUI

struct EncryptToggleView: View {
	@Binding var value: Bool
	
	var body: some View {
		Toggle(isOn: $value) {
			Text("\(value ? "En" : "De")crypt")
				.bold()
		}
	}
}

#if DEBUG
struct EncryptToggleView_Previews: PreviewProvider {
	static var previews: some View {
		EncryptToggleView(value: .constant(true))
	}
}
#endif
