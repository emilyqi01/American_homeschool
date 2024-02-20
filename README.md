# Discover American_homeschool Project

## Description
The American Homeschool Project aims to examine the trends in U.S. homeschooling enrollments between 2017-18 and 2022-23. Our findings indicate a significant uptick in homeschooling during 2019-20, with a modest decline in certain states. Over the six-year span, the overall enrollment rate has risen, suggesting the need for continued data gathering and analysis.

---

## Getting Started

Follow these steps to prepare the data and execute the analysis:
(note: no need to knit the `qmd` file, they are to view the results immediately for convenience. use the run all button will exactly give the results we need.)

### Step 1: Data Cleaning
1. Navigate to the `src/data-cleaning` directory.
2. Execute `delete_nas.qmd` to remove all instances of missing data and change year column(char)  data to integers.
3. Run `web_scrapping_states_abbre.qmd` to compile a new dataframe containing American states and their corresponding abbreviations.
4. Run `add_abbre.qmd` to append the abbreviations to the dataset.

### Step 2: Conducting Analysis

To begin analysis:

1. Change directory to `src/analyses`.
2. Run `state_data_select.qmd` to generate `state_update.png`.
3. Run `district_data_select.qmd` to produce `bar_district_gr_update.png` and `bar_district_cagr_update.png` in the output folder.
4. These graphs will be utilized for subsequent reporting.
### Step 3: Report
Render the file `02379566-math70076-assessment-1.qmd` in report folder and get the final article in pdf.

---

## Data from The Post's analysis of home-schooling enrollment across the US
The data set is a CSV file, [home_school_district.csv](https://github.com/washingtonpost/data_home_schooling/blob/main/home_school_district.csv), [home_school_state.csv](https://github.com/washingtonpost/data_home_schooling/blob/main/home_school_state.csv), and a data [dictionary](https://github.com/washingtonpost/data_home_schooling/blob/main/home_school_data_dictionary.csv) explaining each file which were derived from [data_home_schooling](https://github.com/washingtonpost/data_home_schooling.git).


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
 

## Dataset Analysis

The `state_data_select.qmd` follows this rationale:

To explore each state's growth rate in homeschooling, we initially crafted a line chart with years on the x-axis and population figures on the y-axis, encompassing 29 states. This visualization reveals a general increase in homeschooling populations, particularly between 2019 and 2020. For enhanced clarity, we selectively focused on specific states. We further computed the annual growth rate for all states and, after a weighted assessment(based on years' top absolute growth rate), identified `Kansas` as exhibiting the most significant population fluctuations.


The `district_data_select.qmd` process is detailed as follows:

Building on insights from `state_data_select.qmd`, our analysis narrows the focus from state to district levels. We examine 40 districts within the states identified in the previous step to compare both the specific annual growth rate for 2019-2020 and the compound annual growth rate across a six-year span.

Two circular bar charts are generated to depict the growth rates of these 40 districts. While the charts appear similar at a glance, their scale ranges differ markedly, which suggests underlying factors may have influenced the surge in homeschooling enrollments between 2019 and 2020.

---
## Test Folder
The test directory validates helper functions from the analysis suite. To run the tests, execute `testthat::test_file("tests/testthat/test-cagr.R")` and `testthat::test_file("tests/testthat/test-gr.R")` in the console.

## Licensing
This project is licensed under the MIT License - see the [LICENSE.md](LICENSE) file for details.
