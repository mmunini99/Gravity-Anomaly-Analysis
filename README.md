# GMT Gravity & Geodesy Scripts — Valley of Mexico

## Geophysical context: land subsidence in Mexico City

Several of these scripts (gravity anomaly, Bouguer correction, isostatic Moho modeling) are directly relevant to understanding the crustal and near-surface structure beneath Mexico City — a city undergoing one of the most severe land subsidence crises in the world.

Mexico City was built on the drained bed of ancient Lake Texcoco, and roughly 60% of its drinking water for about 22 million residents is drawn from an aquifer underlying the city. Decades of groundwater over-extraction have caused this aquifer to compact, and the clay-rich lakebed sediments above it — once saturated — have been steadily consolidating ever since. Researchers combining more than a century of ground-based and space-based measurements have concluded that wide areas beneath the city are steadily compacting after being drained of water long ago, and the ground is expected to keep compacting for roughly another 150 years, potentially adding tens of meters to the subsidence already measured during the 20th century.

**Key facts:**

- The city's subsidence was first documented by engineer Roberto Gayol back in 1925.
- By the late 1800s the city was already sinking roughly two inches per year, and that rate had climbed to about 18 inches per year by the 1950s.
- Subsidence is highly **uneven**: recent studies have found some regions sinking as fast as 50 centimeters per year while others barely move at all, which is especially dangerous for infrastructure like metro tunnels and pipelines that cross between stable and rapidly-sinking zones.
- NASA and ISRO's NISAR radar satellite measured parts of the city sinking at roughly 0.8 inches per month between October 2025 and January 2026 — over 9.5 inches a year — with the area around Benito Juárez International Airport among the hardest hit.
- The Angel of Independence monument, built in 1910, has needed 14 extra steps added to its base over the years as the surrounding ground has sunk beneath it.
- In 2021, a metro overpass collapse that killed 26 people was partly attributed to the effects of differential subsidence on the underlying rail infrastructure.
- The consolidation is largely **irreversible**: once the fine clay particles in the ancient lakebed compact, they don't rebound even if groundwater levels later recover.

**Why gravity and isostasy modeling matters here:** Bouguer anomaly and residual gravity maps (as computed in `Es3`, `Es6`, and `Es_10`) can help characterize subsurface density contrasts associated with the clay-rich lacustrine sediments versus the surrounding volcanic rock — the same contrast responsible for the differential subsidence Carreón-Freyre and other researchers have documented in areas like Iztapalapa. Isostatic Moho modeling (`Es8`, `Es9`) and horizontal gradient mapping (`Es11`) provide complementary context on deeper crustal loading and the location of density-contrast boundaries (e.g., basin edges), which can align with zones of maximum differential ground motion.

Mexico City is a globally cited case study for this phenomenon, alongside cities like Jakarta, Tehran, and other rapidly-subsiding urban centers built on depleted aquifers or unconsolidated sediments.

---

The scripts take gravity, topography, and geoid grids as input and produce a sequence of derived products: gravity anomaly maps, Bouguer corrections, regional/residual separations, spectral filters, horizontal gradients, isostatic Moho depth estimates, and terrain-relief visualizations (hillshade, slope).

They are numbered (`Es1`, `Es2`, ... `Es15`) and are meant to be run **in order**, since several later scripts consume grids produced by earlier ones.

## Requirements

- GMT installed and available on the Windows `PATH` 
- Input grids placed in `input_data_COM\` (depending on location and purpose of analysis please download the grid you need from https://icgem.gfz.de/calcgrid)


## Script summaries

| # | Script | Purpose |
|---|---|---|
| 1 | `Es1_GravityAnomalyMap.bat` | Plots the free-air / observed gravity anomaly grid as a color raster with coastline, contour lines (interval 30 mGal), and a color scale. |
| 2 | `Es2_GravityAnomaly_ContourMap.bat` | Same gravity anomaly data, shown as a contour-only map over a gray landmass (no raster fill) — useful for a cleaner structural view. |
| 3 | `Es3_SimpleBouguerAnomalyMap.bat` | Maps the simple Bouguer anomaly (gravity anomaly corrected for the attraction of topographic mass using a standard reduction density), with contours at 30 mGal. |
| 4 | `Es4_GeoidMap.bat` | Maps the geoid height grid — the equipotential surface representing mean sea level extended under the continents. |
| 5 | `Es5_TopographyMap.bat` | Plots the ETOPO1 topography/bathymetry grid using the `etopo1` color palette, contoured every 500 m. |
| 6 | `Es6_CompleteBouguerCalculation.bat` | Two-part script: (a) maps the gravity disturbance due to the topographic field, then (b) computes the **complete Bouguer anomaly** by subtracting that topographic gravity effect from the observed gravity anomaly, producing `BG_complete_COM.grd`. This is the key derived grid feeding several later scripts. |
| 7 | `Es7_isostaticMohoCalculation.bat` | Uses `grdflexure` to model the flexural (Airy-type) isostatic Moho, assuming an elastic thickness of 10 km, from the topography load. |
| 8 | `Es8_isostaticMohoCalculationT50.bat` | Same isostatic Moho calculation as script 8, but with a stiffer elastic thickness of 50 km, for comparison of lithospheric rigidity assumptions. |
| 9 | `Es9_Horizontal_grad.bat` | Computes the horizontal gradient magnitude of the complete Bouguer anomaly (√(∂x² + ∂y²)) — commonly used to highlight the edges of density contrasts, e.g. basin margins or fault zones. |
| 10 | `Es_10_BG_residual.bat` | Splits the complete Bouguer anomaly into **regional** (long-wavelength, `grdfilter -Fg50`) and **residual** (short-wavelength) components, isolating shallow/local density anomalies from deep crustal structure. |
| 11 | `Es11_LowFilter.bat` | Applies a low-pass Gaussian filter (`-Fg30`) to the complete Bouguer anomaly to isolate the regional gravity signal. |
| 12 | `Es12_Hill.bat` | Generates an illuminated hillshade relief of the topography grid (azimuth 315°) for cartographic terrain shading. |

> **Note:** Scripts 10–13 depend on `BG_complete_COM.grd`, which is created by script 6. Run `Es6` before any of `Es_10`, `Es11`, `Es12`, or `Es13`. Similarly, `Es13` depends on the low-pass grid created by `Es12`.

---
