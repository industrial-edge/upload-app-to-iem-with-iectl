import json
import sys
import argparse

# Handling arguments
parser = argparse.ArgumentParser()
parser.add_argument(
    "--app_name", help="Name of the standalone application")
args = parser.parse_args()
app = args.app_name.replace(" ", "")

# Load data
rawData = json.load(sys.stdin)['data']
appID = ""
for d in rawData:
    if(d['title']) == str(app):
        appID = d['applicationId']

print(appID)
