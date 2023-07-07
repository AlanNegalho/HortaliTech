
import subprocess

def change_mac(interface, new_mac):
    print(f"[+] Alterando o endereço MAC da interface {interface} para {new_mac}")

    # Desativa a interface de rede
    subprocess.run(["ifconfig", interface, "down"], check=True)

    # Altera o endereço MAC da interface
    subprocess.run(["ifconfig", interface, "hw", "ether", new_mac], check=True)

    # Ativa a interface de rede
    subprocess.run(["ifconfig", interface, "up"], check=True)

    # Salva as alterações permanentemente
    subprocess.run(["ifconfig", interface, "down"], check=True)
    subprocess.run(["ifconfig", interface, "up"], check=True)

try:
    # Insira o nome da interface de rede desejada
    interface = "eth0"

    # O MAC que você deseja usar no lugar do seu.
    new_mac = "ec:a8:6b:bd:40:63"

    change_mac(interface, new_mac)
    print("[+] Alteração do endereço MAC concluída com sucesso!")
except subprocess.CalledProcessError as e:
    print("[-] Ocorreu um erro ao alterar o endereço MAC:", e)
except Exception as e:
    print("[-] Ocorreu um erro inesperado:", e)

