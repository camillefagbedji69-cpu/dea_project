# Hydro-Efficiency-DEA: Ecological Benchmarking of River Basins

## 📌 Context & Overview
In regions under climate stress, the efficient management of watershed services is vital. This project evaluates the ecological efficiency of various sub-basins in Benin by combining hydrological outputs from the **InVEST Water Yield model** with **Data Envelopment Analysis (DEA)**. The goal is to identify which spatial units are the "top performers" in converting environmental inputs (rainfall, area) into ecosystem services (water yield, landscape diversity).

## 🎯 Objectives
* **Quantify Water Services:** Calculating total annual volume and mean water yield across multiple sub-basins.
* **Ecological Benchmarking:** Determining the efficiency scores of spatial units using a non-parametric frontier approach.
* **Management Diagnostics:** Identifying structural bottlenecks that limit water production and landscape resilience.

## 🛠️ Methodology & Tech Stack
* **Hydrological Modeling:** InVEST Water Yield (Natural Capital Project).
* **Efficiency Analysis:** Data Envelopment Analysis (DEA) with Output-Oriented Variable Returns to Scale (VRS).
* **Environment:** `R` (Packages: `Benchmarking`, `deaR`).
* **Input/Output Matrix:**
    * **Inputs:** Basin Area, Mean Annual Precipitation, Potential Evapotranspiration (PET).
    * **Outputs:** Real Evapotranspiration, Mean Water Yield, Total Water Volume, Shannon Diversity Index (SHDI).



## 🚀 Key Results
* **Hydrological Wealth:** Total water production reached **2,399,380 m³**, with significant variability between basins (ranging from 0 to over 550,000 m³).
* **Efficiency Performance:** An impressive mean efficiency of **0.93** was observed, with scores ranging from 0.88 to 1.0 (frontier).
* **Critical Insights:**
    * **Scale Sensitivity:** Very small sub-basins (≈1 ha) tend to saturate the model, showing a need for data normalization.
    * **Homogeneity Challenge:** Low variability in climatic inputs (Rainfall/PET) suggests that landscape structure is the true differentiating factor for efficiency.
* **Strategic Levers:** Targeted interventions on land cover and "useful surface area" could unlock latent efficiency in underperforming basins.

## 🔮 Perspectives for Improvement
* **Advanced DEA (rDEA):** Implementing Robust DEA to handle non-discretionary inputs like precipitation.
* **Metric Refinement:** Replacing SHDI with more granular landscape metrics (connectivity indices) to improve model discrimination.
* **GIS Integration:** Mapping DEA scores back into a GIS environment to visualize spatial clusters of high/low efficiency.
* **Normalization:** Correcting for hydrological asymmetry to ensure smaller basins are benchmarked fairly against larger ones.
