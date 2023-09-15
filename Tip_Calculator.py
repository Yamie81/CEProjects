print("Asanka Hotel Tax & Tip Calculator App")
total_charge = float (input("Enter Total Charge :"))
total_tax =total_charge*7/100
total_tip = total_charge*18/100
gross_charge = total_charge+total_tax+total_tip
print("Tax :", total_tax)
print("Tip :", total_tip)
print("Total Amount Payable :", gross_charge)
exit


