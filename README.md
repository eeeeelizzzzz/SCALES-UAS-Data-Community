# SCALES-UAS-Data-Community

## Golden Rule
- Use **Issues** for fixes: broken links, metadata corrections, missing files, and quality-control updates.
- Use **Discussions** for science: interpretation, methods, experimental design, and community analysis questions.

This keeps actionable repository work separate from scientific conversation and makes maintenance traceable.

## Repository Data Framework
This repository uses:
- `main_data_index.csv` as the top-level cross-platform DOI index.
- `platforms/` for per-platform metadata and calibration artifacts.
- `.github/ISSUE_TEMPLATE/` for standardized community reporting and metadata updates.

## Adding a New Platform
1. Copy `platforms/_template_platform_/` to `platforms/<your_platform_id>/`.
2. Update `platforms/<your_platform_id>/specs.yaml` with platform-specific values:
   - `aircraft_type`
   - `num_rotors`
   - `sensed_variables`
   - `payload_relative_position`
   - `wind_adaptation_flag`
   - `sensor_airflow_solution`
   - `airflow_relative_position`
3. Add any calibration documents or files to `platforms/<your_platform_id>/calibration/`.
4. Fill in `platforms/<your_platform_id>/README.md` with:
   - **Overview**
   - **Zenodo Links** (NRT, corrected, operator-specific as applicable)
5. Add or update rows in `main_data_index.csv` for the platform and date coverage.
6. Open a pull request; use an Issue first if you are reporting a problem or requesting a metadata correction.
