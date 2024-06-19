import json
import sys
import argparse

# Handling arguments
parser = argparse.ArgumentParser()
parser.add_argument(
    "--device_name", help="Name of the onboarded edge device")
args = parser.parse_args()
device = args.device_name.replace(" ", "")

# Load data
rawData = json.load(sys.stdin)['data']
deviceID = ""
for d in rawData:
    if(d['deviceName']) == str(device):
        deviceID = d['deviceId']

print(deviceID)
