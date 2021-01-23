#!/bin/bash

# Case example:
# You just received an email that one of your APIs is down and you have to check it

# Basic curl request example with python json parsing
curl -v https://api.tfl.gov.uk/AirQuality | python3 -m json.tool

# For more similar example you can google it and check https://curl.se/docs/httpscripting.html
