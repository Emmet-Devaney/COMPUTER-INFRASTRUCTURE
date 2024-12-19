#!/bin/bash

# Create the weather directory if it doesn't exist
if [ ! -d "data/weather" ]; then
  mkdir -p data/weather
fi

# Navigate to the weather directory
cd data/weather

# Download the weather data with a timestamped filename using wget
wget -o $(date +"%Y%m%d_%H%M%S").json https://prodapi.metweb.ie/observations/athenry/today
