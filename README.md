# SCALES UAS Data Community 

## 🎯 Repository Intention
The SCALES UAS Data Community repository serves as the "Mission Control" for entire portfolio of UAS platforms (and other instruments) involved in the SCALES campaign. Its primary purpose is to provide a transparent, version-controlled link between raw data and curated scientific products. While Zenodo provides a permanent archive, this repository provides the context and versioning logic to determine which specific DOI version is the current recommended dataset for a given platform. By maintaining a living "Main Index," this repository directs users to the "Best-Available" version of a dataset on Zenodo, reflecting the latest intercomparison corrections and quality-control insights.

Zenodo community: [zenodo.org/communities/scales](https://zenodo.org/communities/scales/) 

## ⚖️ The Golden Rule
To maintain clarity for both developers and users, we strictly separate work from science:
- *Use [Issues](https://github.com/eeeeelizzzzz/SCALES-UAS-Data-Community/issues) for Fixes:* Actionable work including broken links, metadata corrections, missing files, and quality-control updates. Issues should be reserved for _known_ problems that need to be addressed.
- *Use [Discussions](https://github.com/eeeeelizzzzz/SCALES-UAS-Data-Community/discussions) for Everything Else:* Discussions should cover _suspected_ problems, scientific conversation, and Q&A.
This separation ensures that maintenance remains traceable while community debate stays accessible and searchable.

#### 🗺️ Discussion Roadmap
Our community dialogue is organized into four distinct categories to prevent information silos and keep technical profiles clean:
1. Platform-Based Discussions (Maintainer-Only): These act as the "Homepages" for each platform that provided data during SCALES. These threads allow users to find information and Zenodo links for each platform. It also allows the community to share information about a specific system.
2. Data Quality Alerts (Open): A crowd-sourced "Warning System" for anomalies and suspected issues. Users post here to report specific biases or data issues. Confirmed alerts are eventually converted into Issues to document technical correction.
3. Science and Findings (Open): A space for sharing preliminary results, intercomparison insights, and discoveries regarding atmospheric boundary layer structures; can also be a place to share "cool things" and tools developed by the community.
4. Q&A (Open): General technical support for repository navigation, data access troubleshooting, and other questions for the community.

## 🏗️ Repository Data Framework
This repository follows a modular structure to support the dozens of systems deployed for SCALES:
- [main_data_index.csv](./main_data_index.csv): The top-level index mapping each platform and reference to the current "best-available" data via Zenodo DOI.
- [platforms/](./platforms/): Contains per-platform metadata, specifications, and calibration artifacts.
- [.github/ISSUE_TEMPLATE/](./.github/ISSUE_TEMPLATE/): Standardized forms for reporting _known_ data problems, bugs, etc.

## 📂 Platform-specific Documentation
Information for each platform with available data (within the Zenodo community) is organized here. Within each platform's directory ([platforms/](./platforms/)/<your_platform_id>/) you will find the following:
- specs.yaml: A machine readable file providing a standardized set of minimum required metadata (e.g., aircraft type, sensed variables, payload position, etc.)
- platforms/<your_platform_id>/calibration: Documentation about calibration efforts and QA procedures.
- README.md: A technical overview of the platform and the data it provides, including metadata that extends beyond the specs.yaml file. The readme should also point to the relevant Zenodo links, include contact information, and provide relevant references. The relevant platform-based discussion thread should also be provided here.

#### 🛠️ Updating & Maintaining Platform Information
As an operator or collaborator, your goal is to keep your platform's "Digital Twin" in this repository accurate. Follow these steps to update information:
1. Locate your Folder: Navigate to [platforms/](./platforms/)/<your_platform_id>/.
2. Refine specs.yaml: Ensure the technical fields (e.g., airflow_solution, payload_position, wind_adaptation_flag) accurately reflect the physical setup used.
3. Upload Artifacts: Add any sensor calibration PDFs, chamber test results, validation reports, or other QA/QC reports to the calibration/ folder.
4. Link your Data: Update the platform's README.md with the specific Zenodo DOIs for your NRT, Corrected, and Operator-Specified datasets as they are minted. Provide all information about your platform beyond what is reported in specs.yaml
5. Update the Main Index: Edit the root main_data_index.csv to update rows for your platform. Ensure the entry points to the current best-available version.
6. Submit a Pull Request: Provide a brief description of the update (e.g., "Updated calibration for BL022" or "Updated main index entry to reflect updated data on Zenodo").
