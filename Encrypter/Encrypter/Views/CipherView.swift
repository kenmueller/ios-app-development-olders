import SwiftUI

struct CipherView: View {
	@State var encrypt = true
	
	var cipherKeys: [Character] {
		Array(cipher.keys)
	}
	
	var body: some View {
		VStack {
			EncryptToggleView(value: $encrypt)
			ForEach(cipherKeys, id: \.self) { key in
				HStack {
	//				if encrypt {
	//					Text(String(key))
	//						.bold()
	//				} else {
	//					Text("")
	//				}
					Text(String(key))
						.bold()
					Text(":")
	//				if encrypt {
	//					let value = cipher[key]
	//					Text(value == nil ? "" : String(value))
	//				} else {
	//					Text(String(key))
	//				}
				}
				.frame(maxWidth: .infinity)
			}
		}
		.padding(.vertical)
	}
}

#if DEBUG
struct CipherView_Previews: PreviewProvider {
	static var previews: some View {
		CipherView()
	}
}
#endif
