import socket

HOST = "127.0.0.1"
PORT = 5005

sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
sock.bind((HOST, PORT))

print(f"Listening for Godot messages on {HOST}:{PORT}")

while True:
    data, address = sock.recvfrom(4096)
    message = data.decode("utf-8")

    print(f"Received from {address}: {message}")