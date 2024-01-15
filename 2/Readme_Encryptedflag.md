# Encryptedflag

1. The program defines a constant string bays_char containing alphanumeric characters and bays_len storing the length of the character set.
2. The yes function takes a string (var0) and XORs each character with the corresponding character from the constant string "3".
3. The result is appended to a StringBuilder and returned as a string.
4. The no function concatenates two input strings (var0 and var1).
5. Calculates the hash code of the concatenated string and converts it to a positive long value (var3).
6. Converts the long value into a string representation using the character set defined in bays_char.
7. The program prompts the user to enter two strings as arguments.
Reads the input strings using a Scanner.
Calls the yes function with the first input and stores the result in var6.
Calls the no function with the constant string "flag" and the second input, storing the result in var7
Checks if the input strings are specific values: var2.equals("G[Z@Z@G[VU_RT") and var3.equals("flag").
If the condition is true, it concatenates the constant string "flag{" with var6, var7, and "}" to form the flag.
Prints the generated flag to the console.
If the input strings do not meet the specified conditions, it prints "invalid" to the console.
