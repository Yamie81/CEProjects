#!/bin/bash

# Define the data file to store records
data_file="records.txt"

# Initialize the data file if it doesn't exist
touch "$data_file"

# Function to add a new record
add_record() {
    clear
    echo "Add a New Record"
    echo "----------------"
    echo -n "Enter Name: "
    read name
    echo -n "Enter Age: "
    read age
    echo -n "Enter Email: "
    read email

    # Append the new record to the data file
    echo "$name|$age|$email" >> "$data_file"
    echo "Record added successfully!"
    read -n 1 -s -r -p "Press any key to continue..."
}

# Function to edit an existing record
edit_record() {
    clear
    echo "Edit an Existing Record"
    echo "-----------------------"
    echo -n "Enter the Name to Edit: "
    read search_name

    # Search for the record
    record=$(grep -i "^$search_name|" "$data_file")

    if [ -n "$record" ]; then
        echo "Current Record: $record"
        echo -n "Enter New Age: "
        read new_age
        echo -n "Enter New Email: "
        read new_email

        # Replace the existing record with the edited one
        sed -i "s|$record|$search_name|$new_age|$new_email|" "$data_file"
        echo "Record edited successfully!"
    else
        echo "Record not found."
    fi

    read -n 1 -s -r -p "Press any key to continue..."
}

# Function to search for records by name
search_record() {
    clear
    echo "Search for a Record by Name"
    echo "---------------------------"
    echo -n "Enter Name to Search: "
    read search_name

    # Search for the record and display the results
    search_result=$(grep -i "$search_name" "$data_file")
    
    if [ -n "$search_result" ]; then
        echo "Search Results:"
        echo "$search_result"
    else
        echo "No records found for '$search_name'."
    fi

    read -n 1 -s -r -p "Press any key to continue..."
}

# Function to generate a report of all records
generate_report() {
    clear
    echo "Generating Report of All Records"
    echo "--------------------------------"
    
    if [ -s "$data_file" ]; then
        cat "$data_file"
    else
        echo "No records found."
    fi

    read -n 1 -s -r -p "Press any key to continue..."
}

# Main menu loop
while true; do
    clear
    echo "Record Management System"
    echo "------------------------"
    echo "1. Add New Record"
    echo "2. Edit Existing Record"
    echo "3. Search for a Record"
    echo "4. Generate Report"
    echo "5. Exit"
    echo -n "Enter your choice (1-5): "

    read choice

    case $choice in
        1) add_record ;;
        2) edit_record ;;
        3) search_record ;;
        4) generate_report ;;
        5) clear; exit ;;
        *) echo "Invalid choice. Please enter a valid option (1-5)."; read -n 1 -s -r -p "Press any key to continue...";;
    esac
done
