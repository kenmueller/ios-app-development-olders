import SwiftUI

struct HomeView: View {
	@State var message = ""
	@State var encrypt = true
	@State var cipherIsShowing = false
	
	var output: String {
		encrypt ? encryptMessage(message) : decryptMessage(message)
	}
	
	var body: some View {
		VStack(spacing: 30) {
			Text("Encrypter")
				.font(.title)
				.bold()
				.frame(maxWidth: .infinity, alignment: .leading)
			TextField("Message", text: $message)
				.textFieldStyle(RoundedBorderTextFieldStyle())
			EncryptToggleView(value: $encrypt)
			Group {
				Text("OUTPUT")
					.bold()
					.font(.caption)
					.foregroundColor(.gray)
					.padding(.bottom, -12)
				Text(output.isEmpty ? "Your \(encrypt ? "en" : "de")crypted message" : output)
					.fontWeight(output.isEmpty ? .regular : .bold)
					.foregroundColor(output.isEmpty ? .gray : .black)
					.frame(height: 0)
			}
			.frame(maxWidth: .infinity, alignment: .leading)
			Button(action: {
				self.cipherIsShowing = true
			}) {
				Text("Show Cipher")
					.bold()
					.foregroundColor(.white)
					.padding(.vertical, 8)
					.padding(.horizontal)
					.background(Color.blue)
					.cornerRadius(20)
			}
			.padding(.top, 30)
			.sheet(isPresented: $cipherIsShowing, content: CipherView.init)
			Spacer()
		}
		.padding(30)
	}
}

#if DEBUG
struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView()
	}
}
#endif
