import socket
import json

HOST = "127.0.0.1"
PORT = 5005

sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
sock.bind((HOST, PORT))

print(f"Listening for Godot messages on {HOST}:{PORT}")

while True:
    data, address = sock.recvfrom(4096)

    try:
        controls = json.loads(data.decode("utf-8"))

        pitch = float(controls["pitch"])
        roll = float(controls["roll"])
        yaw = float(controls["yaw"])
        throttle = float(controls["throttle"])

        print(
            f"Pitch: {pitch:.2f} | "
            f"Roll: {roll:.2f} | "
            f"Yaw: {yaw:.2f} | "
            f"Throttle: {throttle:.2f}"
        )

    except (json.JSONDecodeError, KeyError, ValueError, TypeError) as error:
        print(f"Invalid packet: {error}")