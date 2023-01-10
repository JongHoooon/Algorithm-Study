import UIKit

/*
 ___ _       ___
| __(_)_____| _ )_  _ ______
| _|| |_ /_ / _ \ || |_ /_ /
|_| |_/__/__|___/\_,_/__/__|

 // Challenge: Write a program that prints 1 to 100.
 // But for multiples of three print 'Fizz' instead of the number.
 // And for multiples of five  print 'Buzz'.
 // For numbers which are multiples of both three and five print 'FizzBuzz'.
 //
 // Example
 1
 2
 Fizz
 4
 Buzz
 ...
 14
 FizzBuzz
 */

func fizzBuzz() {
    for n in 1...100 {
        if n % 3 == 0 && n % 5 == 0 {
            print("FizzBuzz")
        } else if n % 3 == 0 {
            print("Fizz")
        } else if n % 5 == 0 {
            print("Buzz")
        } else {
            print(n)
        }
    }
}

fizzBuzz()
