# COMPUTER-INFRASTRUCTURE

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

---

## Project
