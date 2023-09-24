#!/bin/bash

while true; do
    # Display a menu to the user
    echo "Select an option:"
    echo "1. List files in the current directory"
    echo "2. Print the current date and time"
    echo "3. Exit"

    # Prompt the user for their choice
    read choice

    # Use a case statement to perform actions based on the user's choice
    case $choice in
        1)
            # List files in the current directory
            ls
            ;;
        2)
            # Print the current date and time
            date
            ;;
        3)
            # Exit the script
            echo "Exiting the script. Goodbye!"
            exit 0
            ;;
        *)
            # Handle invalid input
            echo "Invalid choice. Please enter 1, 2, or 3."
            ;;
    esac
done
