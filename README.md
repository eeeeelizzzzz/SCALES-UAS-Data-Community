# SCALES UAS Data Community 

## About SCALES

**SCALES** stands for Small-UAS Coordination for Atmospheric Low-Level Environmental Sampling and was the flight week campaign portion of the 2024 ISARRA meeting. The ISARRA team structured the project around three themes: **MicroSCALES** (urban heat island and turbulence around Tulsa), **MesoSCALES** (a multi-site vertical observing network between Tulsa and the I-35 corridor), and **integration** of recent UAS capabilities with standardized, WMO-aligned data practices in support of the WMO UAS Demonstration Campaign. The campaign also supported goals in rapid weather reporting, flight planning, airspace management, and collaboration with Urban Air Mobility stakeholders.

**Campaign context (deployment plans, hot-wash reports, and extended background):** [SCALES / Flight Week on Coda](https://coda.io/d/SCALES-Flight-Week_dPqDysn4kSm/SCALES-Intro_suGBnNdS#_luWfxq7e).

## 🎯 Repository Intention
The SCALES UAS Data Community repository serves as the "Mission Control" for the entire portfolio of UAS platforms (and other instruments) involved in the SCALES campaign. Its primary purpose is to provide a transparent, version-controlled link between raw data and curated scientific products. While Zenodo provides a permanent archive, this repository provides the context and versioning logic to determine which specific DOI version is the current recommended dataset for a given platform. By maintaining a living "Main Index," this repository directs users to the "Best-Available" version of a dataset on Zenodo, reflecting the latest intercomparison corrections and quality-control insights.

Zenodo community: [zenodo.org/communities/scales](https://zenodo.org/communities/scales/) 

## Scope (what this repository is not)
- **Not the raw-data archive.** Versioned files and DOIs live primarily on **[Zenodo](https://zenodo.org/communities/scales/)**; this repo points to the **recommended** dataset per platform and holds metadata and context.
- **Not a complete enumeration of every label in every archive.** Some uploads use alternate or legacy identifiers. Curated rows exist for platform folders under `platforms/`; ambiguous or orphan IDs may be discussed only in **[platforms/README.md](./platforms/README.md)** footnotes until a dedicated entry exists.

## Reference documentation (column and field semantics)
These short pages keep the README skimmable; use them when editing the index or `specs.yaml`:
- **[main_data_index.csv](./docs/main-data-index.md)** — column definitions (`Notes_ref`, `last_mod`, `Operator_ID`, etc.).
- **[specs.yaml](./docs/specs-yaml.md)** — key glossary and how it relates to the CSV.
- **[Calibration PDFs](./docs/calibration-artifacts.md)** — intercomparison reports and `_TRH` / `_WIND` file naming.

## ⚖️ The Golden Rule
To maintain clarity for both developers and users, we strictly separate work from science:
- *Use [Issues](https://github.com/eeeeelizzzzz/SCALES-UAS-Data-Community/issues) for Fixes:* Actionable work including broken links, metadata corrections, missing files, and quality-control updates. Issues should be reserved for _known_ problems that need to be addressed.
- *Use [Discussions](https://github.com/eeeeelizzzzz/SCALES-UAS-Data-Community/discussions) for Everything Else:* Discussions should cover _suspected_ problems, scientific conversation, and Q&A.
This separation ensures that maintenance remains traceable while community debate stays accessible and searchable. Every platform-related Issue and Discussion is tagged with a Platform ID label (e.g., BL022) to allow for seamless cross-referencing between technical fixes and scientific dialogue.

#### 🗺️ Discussion Roadmap
Our community dialogue is organized into four distinct categories to prevent information silos and keep technical profiles clean:
1. Platform-Based Discussions (Maintainer-Only): These act as the "Homepages" for each platform that provided data during SCALES. These threads allow users to find information and Zenodo links for each platform. It also allows the community to share information about a specific system.
2. Data Quality Alerts (Open): A crowd-sourced "Warning System" for anomalies and suspected issues. Users post here to report specific biases or data issues. Confirmed alerts are eventually converted into Issues to document technical correction.
3. Science and Findings (Open): A space for sharing preliminary results, intercomparison insights, and discoveries regarding atmospheric boundary layer structures; can also be a place to share "cool things" and tools developed by the community.
4. Q&A (Open): General technical support for repository navigation, data access troubleshooting, and other questions for the community.

## 🏗️ Repository Data Framework
This repository follows a modular structure to support the dozens of systems deployed for SCALES:
- [main_data_index.csv](./main_data_index.csv): The top-level index mapping each platform and reference to the current "best-available" data via Zenodo DOI (see [column reference](./docs/main-data-index.md)).
- [platforms/](./platforms/): Contains per-platform metadata, specifications, and calibration artifacts.
- [.github/](./.github/): Standardized forms for pull requests and reporting _known_ data problems, bugs, etc.

## 📂 Platform-specific Documentation
Information for each platform with available data (within the Zenodo community) is organized here. Within each platform's directory ([platforms/](./platforms/)/<your_platform_id>/) you will find the following:
- specs.yaml: A machine readable file providing a standardized set of minimum required metadata (e.g., aircraft type, sensed variables, `payload_relative_position`, `sensor_airflow_solution`; see [field reference](./docs/specs-yaml.md)).
- platforms/<your_platform_id>/calibration: Documentation about calibration efforts and QA procedures (see [calibration artifacts](./docs/calibration-artifacts.md)).
- README.md: A technical overview of the platform and the data it provides, including metadata that extends beyond the specs.yaml file. The readme should also point to the relevant Zenodo links, include contact information, and provide relevant references. The relevant platform-based discussion thread should also be provided here.

## 🏷️ Navigation via Labels
To make the SCALES fleet easy to manage, we use a global labeling system. Every platform involved in the campaign has a dedicated label in this repository that matches its ID (e.g., BL022, UNL06, FRG01).
- Filtered Views: Clicking a platform label anywhere in the repository will instantly show you every Issue (known bug/fix), Pull Request (pending update), and Discussion (science/alert) associated with that specific aircraft.
- Quick Access: Each platform's README.md contains direct links to these filtered views, allowing you to see the "Current Status" of a platform's data with a single click.

#### 🛠️ Updating & Maintaining Platform Information
As an operator or collaborator, your goal is to keep your platform's "Digital Twin" in this repository accurate. Follow these steps to update information:
1. Locate your Folder: Navigate to [platforms/](./platforms/)/<your_platform_id>/.
2. Refine specs.yaml: Ensure the technical fields (e.g., `sensor_airflow_solution`, `payload_relative_position`, `wind_adaptation_flag`) accurately reflect the physical setup used.
3. Upload Artifacts: Add any sensor calibration PDFs, chamber test results, validation reports, or other QA/QC reports to the calibration/ folder.
4. Link your Data: Update the platform's README.md with the specific Zenodo DOIs for your NRT, Corrected, and Operator-Specified datasets as they are minted. Provide all information about your platform beyond what is reported in specs.yaml
5. Update the Main Index: Edit the root main_data_index.csv to update rows for your platform. Ensure the entry points to the current best-available version.
6. Submit a Pull Request: Provide a brief description of the update (e.g., "Updated calibration for BL022" or "Updated main index entry to reflect updated data on Zenodo").
7. Tag Your Contribution: When submitting a Pull Request or opening a Data Quality Alert, ensure you apply the relevant Platform ID label (e.g., BL022) from the "Labels" menu on the right-hand sidebar. This ensures your contribution is indexed correctly in the platform's history.
