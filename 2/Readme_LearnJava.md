# LearnJava

1. The program defines a class named LearnJava.
2. The main method is the entry point of the program.
3. Therefore, LearnJava class is created
4. A Scanner object (var2) is created to read input from the user.
5. The program prompts the user to enter a password.
6. The entered password is read using var2.next() and stored in the variable var3.
7. The program extracts a substring from the entered password.
8. The extracted substring (var4) is passed to the checkPassword method for validation.
9. The checkPassword method takes the input string, converts it to bytes, and compares it to a predefined byte array.
10. If the lengths of the two byte arrays are different, the password is considered incorrect.
11. If the lengths are the same, the program iterates through each byte and checks if they match. If any byte doesn't match, the password is considered incorrect.
12. If all bytes match, the password is considered correct, and "Access granted" is printed. Otherwise, "Access denied!" is printed.
13. Therefore, we get the flag if Access is granted.
