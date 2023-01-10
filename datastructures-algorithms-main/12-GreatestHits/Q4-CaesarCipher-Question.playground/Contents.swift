import UIKit

/*
 ___                          ___ _      _
/ __|__ _ ___ ___ __ _ _ _   / __(_)_ __| |_  ___ _ _
|(__/ _` / -_|_-</ _` | '_| | (__| | '_ \ ' \/ -_) '_|
\___\__,_\___/__/\__,_|_|    \___|_| .__/_||_\___|_|
                                   |_|

 // Challenge: Implement a Caesar Cipher.
         //
         // A Caesar Cipher is a basic encryption algorithm that takes all the letters message
         // and encrypts them by shifting them over some fixed amount.
         //
         // For example a Caesar Cipher of x3 would map the alphabet like this:
         //
         // Plain:    ABCDEFGHIJKLMNOPQRSTUVWXYZ
         // Cipher:   XYZABCDEFGHIJKLMNOPQRSTUVW
         //
         // And the following text like this:
         //
         // Plaintext:  THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG
         // Ciphertext: QEB NRFZH YOLTK CLU GRJMP LSBO QEB IXWV ALD
         //
         // Write an encrypt and decrypt method of a Caesar Cipher using an offset of 3
         //
 */

class CaesarCipher {
    

    
    func encrypt(_ plainText: String) -> String {
        
        let plainChars = Array(plainText)
        var plainAsciis = plainChars.map { $0.asciiValue! }
        
        var encryptAsciis = plainAsciis.map {
            if $0 == 32 {
                return $0
            }
            return ($0 + 3) % 90
        }
        var encryptedChars = encryptAsciis.map { Character(UnicodeScalar($0)) }
        
        return String(encryptedChars)
    }
    
}

let cipher = CaesarCipher()

cipher.encrypt("ABC")                       // XYZ
cipher.encrypt("ATTACK AT FIRST LIGHT")     // XQQXZH XQ CFOPQ IFDEQ
cipher.encrypt("MEET AT THE RUBICON")       // JBBQ XQ QEB ORYFZLK


// 65 ~ 90



let test: [String] = ["a", "b", "c"]
var result = ""

for c in test {
    result.append(c)
}

print(result)

5 % 3
-1 % 3
-2 % 3
-3 % 3

