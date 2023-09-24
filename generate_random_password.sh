#!/bin/bash

# Function to generate a random password
generate_password() {
  # Define the length of the password
  local length="$1"
  
  # Use OpenSSL to generate a random password with the desired length
  password=$(openssl rand -base64 48 | cut -c1-"$length")
  
  echo "$password"
}

# Prompt the user for the desired password length
read -p "Enter the desired password length: " password_length

# Check if the input is a positive integer
if [[ ! $password_length =~ ^[0-9]+$ || $password_length -lt 1 ]]; then
  echo "Invalid input. Please enter a positive integer for the password length."
  exit 1
fi

# Generate and display the random password
random_password=$(generate_password "$password_length")
echo "Generated password: $random_password"
