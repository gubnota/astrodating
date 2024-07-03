from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes
from cryptography.hazmat.primitives import padding
from cryptography.hazmat.backends import default_backend
import base64
import os

# Correctly convert the hex string to a bytes object
AES_KEY = bytes.fromhex(
    "e845da978c2696955e3025555eb125c1c62ddc511dd288b8fce7a88648534349"
)  # Replace with your actual 32-byte AES key


def encrypt_message(message: str) -> str:
    iv = os.urandom(16)  # Generate a random IV
    cipher = Cipher(algorithms.AES(AES_KEY), modes.CBC(iv), backend=default_backend())
    encryptor = cipher.encryptor()
    padder = padding.PKCS7(128).padder()
    padded_data = padder.update(message.encode("utf-8")) + padder.finalize()
    encrypted = encryptor.update(padded_data) + encryptor.finalize()
    return base64.b64encode(iv + encrypted).decode(
        "utf-8"
    )  # Prepend the IV and base64 encode


def decrypt_message(encrypted_message: str) -> str:
    try:
        encrypted_data = base64.b64decode(encrypted_message)
        iv = encrypted_data[:16]  # Extract the IV
        encrypted_message = encrypted_data[16:]  # Extract the encrypted message
        cipher = Cipher(
            algorithms.AES(AES_KEY), modes.CBC(iv), backend=default_backend()
        )
        decryptor = cipher.decryptor()
        decrypted_padded = decryptor.update(encrypted_message) + decryptor.finalize()
        unpadder = padding.PKCS7(128).unpadder()
        decrypted = unpadder.update(decrypted_padded) + unpadder.finalize()
        return decrypted.decode("utf-8")
    except Exception as e:
        print(f"Decryption error: {e}")
        return ""


def form_encrypted_message(message_dict: dict) -> dict:
    return {
        "from": encrypt_message(message_dict["from"]),
        "to": encrypt_message(message_dict["to"]),
        "msg": encrypt_message(message_dict["msg"]),
        "timestamp": message_dict["timestamp"],
    }
