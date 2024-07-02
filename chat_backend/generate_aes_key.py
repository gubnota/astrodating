import os

# Generate a 256-bit (32 bytes) AES key
key = os.urandom(32)

# Save the key to a text file in base64 format
with open('aes_key.txt', 'w') as file:
    file.write(key.hex())

print(f"Key saved to aes_key.txt: {key.hex()}")
