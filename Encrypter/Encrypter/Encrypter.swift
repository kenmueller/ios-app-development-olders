let cipher: [Character: Character] = [
	"a": "b",
	"b": "c",
	"c": "d",
	"d": "e",
	"e": "f",
	"f": "g",
	"g": "h",
	"h": "i",
	"i": "j",
	"j": "k",
	"k": "l",
	"l": "m",
	"m": "n",
	"n": "o",
	"o": "p",
	"p": "q",
	"q": "r",
	"r": "s",
	"s": "t",
	"t": "u",
	"u": "v",
	"v": "w",
	"w": "x",
	"x": "y",
	"y": "z",
	"z": "a",
	"0": "1",
	"1": "2",
	"2": "3",
	"3": "4",
	"4": "5",
	"5": "6",
	"6": "7",
	"7": "8",
	"8": "9",
	"9": "0",
	"!": "?",
	"?": "!",
	".": " ",
	" ": "."
]

func encryptCharacter(_ character: Character) -> Character {
	guard let encryptedCharacter = cipher[Character(character.lowercased())] else { return character }
	return character.isUppercase
		? Character(encryptedCharacter.uppercased())
		: encryptedCharacter
}

func decryptCharacter(_ character: Character) -> Character {
	let lowercasedCharacter = Character(character.lowercased())
	guard let unEncryptedCharacter = (cipher.first { $1 == lowercasedCharacter })?.key else { return character }
	return character.isUppercase
		? Character(unEncryptedCharacter.uppercased())
		: unEncryptedCharacter
}

func encryptMessage(_ message: String) -> String {
	return String(message.map(encryptCharacter))
}

func decryptMessage(_ message: String) -> String {
	return String(message.map(decryptCharacter))
}
