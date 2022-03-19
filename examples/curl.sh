#!/bin/bash

# Case example:
# You just received an email that one of your APIs is down and you have to check it
echo "==================================="
echo "==        curl example          ==="
echo "==     Print weather forcast    ==="
echo "==================================="
sleep 1
# Basic curl request example with python json parsing
OUTPUT=$(curl -q https://api.tfl.gov.uk/AirQuality | python3 -m json.tool | grep forecastText | awk -F':' '{print $2}')
echo -e "\n\n"

echo $OUTPUT
# For more similar example you can google it and check https://curl.se/docs/httpscripting.html

echo ""
echo "## END OF EXECUTION ##"