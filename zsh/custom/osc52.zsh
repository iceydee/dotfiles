osc52() {
  python3 -c '
import sys, base64
data = sys.stdin.buffer.read()
sys.stdout.write("\033]52;c;" + base64.b64encode(data).decode() + "\n")
sys.stdout.flush()
'
}

