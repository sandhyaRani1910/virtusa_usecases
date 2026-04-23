# FareCalc Travel Optimizer
## Overview
The CityCab Fare Calculator is a simple Python-based application that calculates ride fares based on:

- Distance traveled
- Vehicle type (Economy, Premium, SUV)
- Time of booking (to apply surge pricing)

It simulates a basic backend logic used in ride-sharing platforms to estimate trip costs and generate a receipt.

## Features
-  Supports multiple vehicles categories with different pricing rang
-  Applies surge prices during peak hours like (5 PM – 8 PM)
-  Generates a clean fare receipt of price 
-  Handles invalid inputs gracefully without any confusion.

 ## Tools & Technologies Used
 ### Programming Language
- Python (Core Concepts

 ### Python Concepts & Libraries
- Built-in functions (input(), print())
- Exception handling (try-except)
- Dictionary for rate mapping
- Functions for modular design

 ## How It Works
1. User enters :
- Distance (in km)
- Vehicle type
- Hour (0–23)
  
2.System calculates :
- Base fare = Distance × Rate
- Applies surge pricing (1.5x) during peak hours
  
3.Displays a formatted receipt

## How to Run
1.Make sure Python is installed
2.Run the script:
- python Fare.py

## Screenshots
🔹 Input Example:

<img width="375" height="112" alt="WhatsApp Image 2026-04-24 at 00 47 40" src="https://github.com/user-attachments/assets/05bdb127-6e16-4c48-8daf-a9e80257b79f" />

🔹 Output Receipt:

<img width="223" height="204" alt="WhatsApp Image 2026-04-24 at 00 47 58" src="https://github.com/user-attachments/assets/df11a0d1-c8e4-4c0f-bb26-20ea44b6ca84" />

## Future Enhancements
- Add GUI (Tkinter / Web Interface)
- Store ride history using CSV/Database
- Integrate with SQL backend
- Convert into Java-based backend system
- Add user login & trip tracking

## Sample Logic (Core Function)

 def compute_amount(distance, v_type, hrs):
     base = distance * rate_map[v_type]
    
    if 17 <= hrs <= 20:
        base = base * 1.5
        surge_flag = True
    else:
        surge_flag = False
    
    return base, surge_flag
