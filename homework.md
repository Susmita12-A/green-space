# OBJECTIVE: Forest Carbon Stock Assessment Using R

## 1. Assignment objective

Develop a robust and reproducible R programming pipeline to estimate Total Above-Ground Carbon Stock per Hectare ($Mg\ C\ ha^{-1}$) across different forest stands using the provided Bagmati forest inventory dataset.

The assignment is designed to assess your ability to integrate R programming concepts with forest inventory analysis, ecological reasoning, data quality assessment, and forest carbon accounting.

You are expected to independently design and implement a custom analytical workflow rather than simply perform calculations on the dataset.

## 2. Dataset and data exploration

The dataset is provided in the following directory:

text

```text
data/
└── raw/
    └── bagmati/
        └── bagmati_raw_inventory.csv
```

The dataset contains individual tree-level forest inventory observations from different forest stands in Bagmati Province, Nepal.

The structure of the dataset, the first six observations are provided below.

Dataset variables

| Variable         | Description                    |
| ---------------- | ------------------------------ |
| Plot_ID          | Forest plot identification     |
| Stand_ID         | Forest stand identification    |
| Tree_ID          | Individual tree identification |
| Species          | Tree species                   |
| DBH_cm           | Diameter at breast height (cm) |
| Height_m         | Tree height (m)                |
| Wood_density     | Wood density (g/cm³)           |
| Biomass_kg       | Above-ground biomass (kg)      |
| Plot_area_ha     | Plot area (ha)                 |
| Elevation_m      | Elevation (m)                  |
| Latitude         | Geographic latitude            |
| Longitude        | Geographic longitude           |
| Measurement_Date | Inventory measurement date     |
| Census_Year      | Census year                    |

The six observations supplied in the assignment are for understanding the CSV structure only. Your analysis must use the complete dataset.

## 3. Mathematical background

Your carbon calculations must follow these equations:

A. Individual tree carbon stock

$$
C_{\text{tree}}=Biomass_{\text{kg}}\times0.47
$$

B. Conversion to megagrams

$$
C_{\text{tree}}(Mg)=\frac{C_{\text{tree}}(kg)}{1000}
$$

C. Carbon density per hectare

$$
C_{\text{ha}}=
\frac{Total\ Carbon\ Stock\ (Mg)}
{Total\ Sampled\ Area\ (ha)}
$$

Use 0.47 as the default biomass carbon fraction, consistent with the assignment's IPCC-based assumption.

## 4. Technical tasks

Develop your R pipeline to address the following requirements.

### Task 1: Data import and exploration

- Import the original CSV dataset.
- Examine its dimensions, structure, variable classes, and summary statistics.
- Identify the number of unique forest stands, plots, and tree observations.
- Examine missing values and potential inconsistencies.

### Task 2: Develop a custom analytical function

Write a user-defined R function for stand-level carbon stock analysis.

Your function must incorporate:

- Input validation.
- Missing-value management.
- Sample size validation.
- Biological and ecological plausibility checks.
- Carbon stock calculations.
- Stand-level summary statistics.

### Task 3: Implement biology-driven quality-control guards

Design custom validation conditions based on the ecological characteristics of forest inventory data.

Consider the following parameters:

- Above-ground biomass.
- Plot sampling area.
- Wood density.
- Missing or invalid observations.
- Biologically unrealistic measurements.

Your function should distinguish between critical data errors and observations that require further investigation.

### Task 4: Implement the carbon calculation pipeline

Calculate:

- Individual tree carbon stock (kg C).
- Individual tree carbon stock (Mg C).
- Total stand-level carbon stock (Mg C).
- Stand-level carbon density (Mg C ha⁻¹).

Pay particular attention to correct area scaling when multiple plots belong to the same forest stand.

### Task 5: Dynamic stand-level partitioning

Your analysis must dynamically separate the dataset by forest stand.

Use the R programming concepts discussed during practical sessions, including:

- `split()`
- `sapply()`
- `by()`

The number of forest stands must not be hard-coded.

### Task 6: Generate a summary matrix

Produce a final stand-level summary matrix containing appropriate metrics, including:

- Total trees measured.
- Species richness.
- Maximum individual tree biomass.
- Total above-ground carbon stock.
- Total sampled area.
- Total above-ground carbon density per hectare.

Your final matrix must have forest stands as columns and analytical metrics as rows.

## 5. Expected deliverables

Submit the following:

1. R script: Complete, functional, and properly commented R code.
2. Data exploration: Basic descriptive statistics and dataset structure.
3. Quality-control report: Description of identified data issues and how they were handled.
4. Carbon stock summary: Final stand-level summary matrix.
5. Interpretation: A brief scientific interpretation (approximately 300–500 words) comparing carbon stocks among forest stands.

## 6. Important instructions

- Use only the original dataset provided in `data/raw/bagmati/bagmati_raw_inventory.csv`.
- Do not manually create or substitute a mock dataset.
- Your code must work for all forest stands without manually specifying their names.
- Develop your own custom analytical function.
- Use meaningful variable names and appropriate comments.
- Ensure that calculations are dimensionally correct.
- Do not silently remove problematic observations without documenting the reasons.
- Ensure the script is reproducible and can run from beginning to end.
