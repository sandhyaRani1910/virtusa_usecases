[Redeme.md](https://github.com/user-attachments/files/27007531/Redeme.md)
# The "FinSafe" Transaction Validator

#📌 Overview

FinSafe is a simple Java-based console application that helps users manage their personal finances. It allows users to deposit money, withdraw funds, check balance, and view recent transaction history.
This project demonstrates core programming concepts like Object-Oriented Programming (OOP), exception handling, and basic data management.

#🚀 Features
     Create account with initial balance
      Deposit money
💸 Withdraw money with validation
📊 View last 5 transactions (Mini Statement)
🔍 Check current balance
⚠️ Custom exception for insufficient funds

🛠️ Tools & Technologies Used

👨‍💻 Programming Language
-Java

📚 Java Concepts Used
-Object-Oriented Programming (OOP)
-Classes & Objects

Exception Handling
-Custom Exception (InsufficientFundsException)
-Try-Catch Blocks

Collections Framework
-ArrayList for transaction history
🧰 Libraries / Utilities
-java.util.Scanner – for user input
-java.util.ArrayList – for storing transaction history

📂 Project Structure
FinSafe/
│
├── MainApp.java                  # Main program (User interaction)
├── Account.java                 # Core logic (Deposit, Withdraw, History)
└── InsufficientFundsException.java  # Custom Exception
