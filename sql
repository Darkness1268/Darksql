#VULNSCAN
print("""'\033[1;92m'                                                 

╔╗──╔╦╗─╔╦╗──╔═╗─╔╦═══╦═══╦═══╦═╗─╔╗
║╚╗╔╝║║─║║║──║║╚╗║║╔═╗║╔═╗║╔═╗║║╚╗║║ \033[1;31;36m  
╚╗║║╔╣║─║║║──║╔╗╚╝║╚══╣║─╚╣║─║║╔╗╚╝║\033[4;37m
─║╚╝║║║─║║║─╔╣║╚╗║╠══╗║║─╔╣╚═╝║║╚╗║║
─╚╗╔╝║╚═╝║╚═╝║║─║║║╚═╝║╚═╝║╔═╗║║─║║║
──╚╝─╚═══╩═══╩╝─╚═╩═══╩═══╩╝─╚╩╝─╚═╝ 

               \033[1;32m Coded by: Mr.Dark Hcktvst""") 
print("\033[1;31;36m__________________________________________________________")

import requests
from termcolor import colored
from concurrent.futures import ThreadPoolExecutor

def check_website(website):
    try:
        response = requests.get(website)
        if response.status_code == 200:
            print(colored(f"{website} is reachable", 'green'))
            # Check for SQL Injection vulnerability
            if "error" in response.text.lower() or "sql" in response.text.lower():
                print(colored(f"{website} may be vulnerable to SQL Injection", 'cyan'))
                # Auto SQL Injection
                auto_sql_injection(website)
        else:
            print(colored(f"{website} returned status code {response.status_code}", 'yellow'))
    except requests.exceptions.RequestException:
        print(colored(f"{website} is not reachable", 'red'))

def auto_sql_injection(website):
    # Implement your SQL injection attack logic here
    pass

def scan_websites(file_path):
    with open(file_path, 'r') as file:
        websites = [line.strip() for line in file]

    with ThreadPoolExecutor() as executor:
        executor.map(check_website, websites)

if __name__ == "__main__":
    file_path = input("Enter the file path containing websites: ")
    scan_websites(file_path)
