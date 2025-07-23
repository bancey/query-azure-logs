# Query Azure Logs

This repository provides tools and scripts to process, filter, and analyze large sets of Azure log data stored in JSON format. It is designed to help you combine raw log files, filter them by criteria such as SNI, and perform further analysis using Python.

## Repository Structure

- `rawdata/`  
	Contains raw Azure log files, organized by day (`d=XX`) and hour (`h=XX`).

- `data/`  
	Stores processed and filtered data in `.jsonl` format.

- `combine-raw-data.sh`  
	Bash script to combine all raw JSON files into a single JSONL file.

- `filter-data.sh`  
	Bash script to filter the combined data by SNI value.

- `query-logs.ipynb`  
	Jupyter notebook for further analysis of the filtered data using Python.

## Usage

### 1. Combine Raw Data

Combine all raw JSON files into a single JSONL file:

```sh
bash combine-raw-data.sh
```

This creates `data/combined.jsonl`. Depending on the amount of data, this may take some time. For approx 50GB of raw data it took around 2 minutes. 

### 2. Filter Data by SNI

Filter the combined data for a specific SNI value:

```sh
bash filter-data.sh <sni_value>
```

This creates `data/combined_filtered.jsonl` containing only entries matching the given SNI. Again depending on the amount of data, this may take some time. For example, filtering a 50GB dataset took around 10 minutes.

### 3. Analyze Logs in Python

Open `query-logs.ipynb` in Jupyter. The notebook demonstrates:

- Filtering logs by client IP and time range
- Counting and listing distinct request URIs and their HTTP status codes
- Displaying samples of filtered data

## Requirements

- Bash shell (macOS/Linux)
- `jq` (for filtering JSON in shell scripts)
- Python 3 (for running the notebook)
- Jupyter Notebook

## Example Workflow

1. Place your raw Azure log files in the `rawdata/` directory, organized by day and hour.
2. Run `combine-raw-data.sh` to merge all logs.
3. Use `filter-data.sh` to extract logs for a specific SNI.
4. Open and run `query-logs.ipynb` for further analysis.
