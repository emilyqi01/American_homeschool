# Discover American_homeschool Project

## Description
The goal of American_homeschool Project is to discover the  home-school enrollment from 2017-18 through 2022-23 in America.

---

## Getting Started

Follow these steps to prepare the data and execute the analysis:

### Step 1: Data Cleaning
1. Navigate to the `src/data-cleaning` directory.
2. Execute `delete_nas.qmd` to remove all instances of missing data and change year column(char)  data to integers.
3. Run `web_scrapping_states_abbre.qmd` to compile a new dataframe containing American states and their corresponding abbreviations.
4. Run `add_abbre.qmd` to append the abbreviations to the dataset.

### Step 2: Analysis
(Provide instructions here for how to proceed with the analysis.)

### Step 3: Further Steps
(Include any additional steps or instructions here.)

---
## Test file
testthat::test_file("tests/testthat/test-cagr.R")
testthat::test_file("tests/testthat/test-gr.R")

## Data from The Post's analysis of home-schooling enrollment across the US
The data set is a CSV file, [home_school_district.csv](https://github.com/washingtonpost/data_home_schooling/blob/main/home_school_district.csv), [home_school_state.csv](https://github.com/washingtonpost/data_home_schooling/blob/main/home_school_state.csv), and a data [dictionary](https://github.com/washingtonpost/data_home_schooling/blob/main/home_school_data_dictionary.csv) explaining each file which were derived from [data_home_schooling](https://github.com/washingtonpost/data_home_schooling.git).


## Dataset preprocessing
The `README.md` file is often the first entry point for users interacting with your dataset or repository. Here is a refined and concise version of your text for the `README.md`:

---

## Datasets Overview

We utilize two primary datasets: `home_school_district.csv` and `home_school_state.csv`, sourced from the Washington Post's repository on home schooling.

- `home_school_state.csv` provides six years of home-school enrollment data across 33 states.
- `home_school_district.csv` contains records from 6,661 districts, with each state comprising a unique set of districts.

### Data Cleaning

- Removed all instances of `NA` values from both datasets.
- Excluded districts with zero enrollments from `home_school_district.csv`.

### Data Integration

- Introduced an 'Abbreviation' column to `home_school_state.csv` to align with `home_school_district.csv`, which uses state abbreviations.

All refined datasets are stored in the `data/derived` directory for streamlined access.

---


## Dataset Analyzing


## Licensing
This project is licensed under the MIT License - see the [LICENSE.md](LICENSE) file for details.
