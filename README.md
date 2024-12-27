# COMPUTER-INFRASTRUCTURE


## My Computer Infrastructure Repository

This repository was created as part of the Computer Infrastructure - Semester 2 module, Higher Diploma in Science in Data Analytics at ATU. 

## About
This repository contains my submissions for the Computer Infrastructure module, demonstrating what I have learned so far in the course, as well as the Tasks and Project assigned by my lecturer.

---

## Tasks

### Task 1: Create Directory Structure

Create a directory structure with a `data` folder containing two subdirectories: `timestamps` and `weather`.

**Commands**
```bash
mkdir -p data/timestamps data/weather

ls data
```

**Command Reference:**  
- `mkdir -p`: Creates the directories if they do not exist.
- `ls`: Verifies the creation of the directories.

---

### Task 2: Append Current Date and Time
**Description:**  
Append the current date and time to a file named `now.txt` in the `data/timestamps` directory, repeating the process 10 times.

**Commands**  
```bash
cd data/timestamps

for i in {1..10}; do
  date >> now.txt
done

more now.txt
```

**Command Reference:**  
- `cd data/timestamps`: Navigates to the `timestamps` directory.
- `for i in {1..10}`: Loops through the sequence from 1 to 10.
- `date >> now.txt`: Appends the current date and time to `now.txt`.
- `more now.txt`: Displays the file's content to verify the appended timestamps.

---

### Task 3: Formatting Timestamps
**Description:**  
Format the date in `YYYYmmdd_HHMMSS` format and append it to a file named `formatted.txt`.

**Commands**  
```bash
date "+%Y%m%d_%H%M%S" >> formatted.txt

more formatted.txt
```

**Command Reference:**  
- `date "+%Y%m%d_%H%M%S"`: Formats the date and time.
- `>>`: Appends the output to `formatted.txt`.

---

### Task 4: Create Timestamped Files
**Description:**  
Create empty files with names in the `YYYYmmdd_HHMMSS.txt` format.

**Commands**  
```bash
touch `date "+%Y%m%d_%H%M%S"`.txt
```

**Command Reference:**  
- `touch`: Creates an empty file.
- `date "+%Y%m%d_%H%M%S"`: Embeds the formatted timestamp into the filename.

---

### Task 5: Download Today’s Weather Data
**Description:**  
Download weather data for Athenry into a file named `weather.json` using `curl`.

**Commands**  
```bash
curl -o weather.json https://prodapi.metweb.ie/observations/athenry/today
```

**Command Reference:**  
- `curl -o`: Downloads data and saves it to `weather.json`.

---

### Task 6: Timestamp the Data
**Description:**  
Download weather data and save it with a timestamped filename in the `YYYYmmdd_HHMMSS.json` format.

**Commands**  
```bash
curl -o `date "+%Y%m%d_%H%M%S"`.json https://prodapi.metweb.ie/observations/athenry/today
```

**Command Reference:**  
- `curl -o`: Downloads data.
- `date "+%Y%m%d_%H%M%S"`: Generates a timestamped filename from the link following.

---

### Task 7: Automate the Process with `weather.sh`
**Description:**  
Write a bash script to automate the weather data download process and save the data with a timestamped filename.

**Commands**  
```bash
if [ ! -d "data/weather" ]; then
  mkdir -p data/weather
fi

cd data/weather


curl -o $(date +"%Y%m%d_%H%M%S").json https://prodapi.metweb.ie/observations/athenry/today
```

**Execute `weather.sh`**
```bash
chmod +x weather.sh
./weather.sh
```

**Command Reference**
- `chmod`: Stands for "change mode," used to change file permissions.
- `+x`: Adds execute permissions to the file for the user, group, and others.

---

### Task 8: Notebook
**Description:**  
Create a Jupyter Notebook named `weather.ipynb` at the root of your repository. The notebook should include:

A brief explanation of how Tasks 1 to 7 were completed.

- Provide a short description of each command used in Tasks 1 to 7.
- Explain the role of each command in completing the tasks.


### Task 9: Review and Report on Dataset
**Description:**  
In `weather.ipynb`, use the pandas library to analyze one of the weather data files downloaded with your script.

**Steps:**  
1. Load Data: Use the read_json() function to load a weather data file.

```python
import pandas as pd
df = pd.read_json('data/weather/20241218_101530.json')
print(df.head())
```

2. Examine Data: Summarize the structure and content of the dataset.
```python
print(df.info())
df.isnull().sum()
print(df.describe())
```

3. Analysis of data from a specific file.

I used `pandas.read_json()` to quickly load and analyze the weather data. The dataset provides useful information about daily weather conditions for various applications.

---

## Project

This project automates the execution of the `weather.sh` script to run daily, download new weather data, and push the updated data to my GitHub repository. The automation is achieved using GitHub Actions.

---

### Project Objectives

1. **Automate the `weather.sh` Script**: Schedule the script to run daily and download weather data at 10am.

2. **Push Updates to GitHub**: Automatically commit and push the new weather data to the repository.

---

### Steps

#### Step 1: Create a GitHub Actions Workflow

- **Description**: Define the workflow that automates the execution of the script and data management.

- **Instructions**:
  1. Navigate to your repository.
  2. Create a folder: `.github/workflows/` (if it doesn't already exist).
  3. Inside this folder, create a file named `weather-data.yml`.

---

#### Step 2: Schedule the Script to Run Daily at 10 AM
- **Description**: Use `cron` to schedule the script to run daily at 10 AM. Include the `workflow_dispatch` event to enable manual triggering of the workflow for testing.

```yaml
  on:
    schedule:
      - cron: '0 10 * * *'  
    workflow_dispatch:  
```

#### Step 3: Use a Linux Virtual Machine
**Description**: Specify an Ubuntu virtual machine in the workflow to execute the tasks, and enable permissions for the workflow to edit the repository.

```yaml
jobs:
  fetch-weather-data:
    runs-on: ubuntu-latest

    permissions:
      contents: write  

```

#### Step 4: Clone the Repository
**Description**: Include a step in the workflow to clone your repository.
```yaml
    steps:
      - name: Checkout Repository
        uses: actions/checkout@v4
```

#### Step 5: Execute the weather.sh Script
**Description**: Add a step to run the weather.sh script, which downloads the weather data and saves it to the specified directory.
```yaml
    - name: Run weather.sh
      run: |
        chmod +x weather.sh 
        ./weather.sh 
```

#### Step 6: Commit and Push Changes Back to the Repository
**Description**: Configure the workflow to commit the downloaded weather data and push the changes back to the repository.
```yaml
      - name: Commit and Push Changes
        run: |
          git config --global user.name "GitHub Actions"
          git config --global user.email "actions@github.com"
          git add .
          git commit -m "Update weather data"
          git push
```

#### Step 7: Test the Workflow
**Description**: Commit and push the weather-data.yml file to my repository. Monitor the workflow's execution in the GitHub Actions logs to ensure it runs correctly and that new data is being committed to the repository.


## References

1. Athenry weather station data: https://prodapi.metweb.ie/observations/athenry/today

2. Today's weather, Athenry, data.gov.ie: https://data.gov.ie/dataset/todays-weather-athenry

4. Create a directory: https://www.w3schools.com/python/ref_os_mkdir.asp

5. more command: https://www.geeksforgeeks.org/more-command-in-linux-with-examples/

6. wget vs curl: https://www.warp.dev/terminus/curl-vs-wget

7. chmod-x: https://www.geeksforgeeks.org/what-does-chmod-x-do-and-how-to-use-it/

8. git commands: https://github.com/marketplace/actions/git-auto-commit

9. cron: https://crontab.guru/

10. checkout: https://github.com/actions/checkout

11. secrets.GITHUB_TOKEN: https://docs.github.com/en/actions/security-for-github-actions/security-guides/using-secrets-in-github-actions

12. jobs: https://docs.github.com/en/actions/writing-workflows/choosing-what-your-workflow-does/store-information-in-variables

13. Workflow Syntax: https://docs.github.com/en/actions/writing-workflows/workflow-syntax-for-github-actions

# Author

## Emmet devaney - Student of the Atlantic Technological University