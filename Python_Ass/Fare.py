# Fare Calculator
rate_map={"Economy":10,"Premium":18, "SUV":25}

def compute_amount(distance, v_type, hrs):
    base=distance*rate_map[v_type]
    
    if 17<=hrs<=20:
        base=base*1.5
        surge_flag=True
    else:
        surge_flag=False
    
    return base, surge_flag

try:
    print("------ City Cab Fare Calculator ------")
    dist= float(input("Enter distance (in km): "))
    vtype= input("Vehicle Type:").title()
    time_hr=int(input("Hour(0-23): "))
    
    if vtype not in rate_map:
        print("Service not Available or Invalid vehicle type.")
    else:
        total, surge= compute_amount(dist, vtype, time_hr)
        print("\n-----Receipt-----")
        print(f"Distance: {dist} km")
        print(f"Vehicle Type: {vtype}")
        print(f"Hours: {time_hr}")
        print(f"Rate: {rate_map[vtype]} per km")
        if surge:
            print("Surge : Applied.")
        else:
            print("Surge : Not Applied.")
        print(f"Total :{round(total,2)}")
        print("-----------------")
except :
    print("Invalid input.")
            