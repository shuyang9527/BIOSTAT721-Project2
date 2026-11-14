# BIOSTAT 721 Project 2: Air Quality at RDU

This project cleans and summarizes daily carbon monoxide (CO), fine
particulate matter (PM2.5), and ozone (O3) concentrations at
Raleigh-Durham International Airport (RDU).

## Data Source

The course-provided CSV files contain measurements from the EPA air
quality monitor at RDU. The data cover 2018 and 2019, and January
through April of 2020.

## Project Files

- `data/`: Three raw air quality CSV files, one for each year.
- `clean_air_quality.R`: Function that cleans each CSV and calculates
  daily concentrations.
- `Project2_Michael_Yu.Rmd`: Source for the tables, figures, and interpretation.
- `reference.docx`: Word template used to format the report.
- `Project2_Michael_Yu.docx`: Rendered Word report.

## How to Reproduce the Report

1. Open `BIOSTAT721-Project2.Rproj` in RStudio.
2. If needed, install the required R packages:

   ```r
   install.packages(c("rmarkdown", "knitr", "dplyr", "tidyr", "ggplot2"))
   ```

3. Open `Project2_Michael_Yu.Rmd` and select **Knit to Word**.

**Author:** Michael Yu  
**Date:** November 14, 2026