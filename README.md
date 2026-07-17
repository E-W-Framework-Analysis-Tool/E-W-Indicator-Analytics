# E-W Indicator Analytics

[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](LICENSE)
[![GitHub Issues](https://img.shields.io/github/issues/E-W-Framework-Analysis-Tool/E-W-Indicator-Analytics)](https://github.com/E-W-Framework-Analysis-Tool/E-W-Indicator-Analytics/issues)

Sample Power BI dashboards and a reference data pipeline built to answer select **Essential Questions** from the
[Education-to-Workforce Indicator Framework (E-W Framework)](https://educationtoworkforce.org), a set of Essential
Questions and Indicators for understanding how students progress from education into the workforce.

This repository shows what end-to-end analysis looks like for a handful of Essential Questions, built on the
[CEDS Data Warehouse](https://ceds.ed.gov/) schema. It's a companion to the
[E-W Framework Analysis Tool](https://github.com/E-W-Framework-Analysis-Tool/E-W-Framework-Analysis-Tool), which helps
agencies assess their data readiness against the full Framework and embeds these same dashboards for reference.

## Essential Questions Covered

| EQ                     | Question                                                                                                              |
| ---------------------- | --------------------------------------------------------------------------------------------------------------------- |
| [EQ-12](PowerBI/EQ-12) | Do students have access to and complete rigorous and accelerated college preparatory coursework?                      |
| [EQ-18](PowerBI/EQ-18) | Are students experiencing sufficient early momentum in postsecondary education to be on track for on-time completion? |
| [EQ-19](PowerBI/EQ-19) | Are students completing credentials of value after high school that set them up for success in the workforce?         |

Each dashboard follows the same pattern: a Summary page, a Reference page mapping Indicators to report pages, one or
more Indicator Analysis pages (filterable by Cohort/School Year, Disaggregates, and Organization level), and a
Resources page with context and links. See [Dashboard Design Notes](docs/dashboard-design-notes.md) for the shared
design tenets and conventions, and the
[Visualizations](https://github.com/E-W-Framework-Analysis-Tool/E-W-Framework-Analysis-Tool) page in the E-W
Framework Analysis Tool for embedded previews and screenshots.

## Project Structure

This repository contains the end-to-end data pipeline for generating the dashboards above. It follows a standard
Extract, Transform, Load (ETL) pattern, moving data from a CEDS Data Warehouse into a purpose-built DataMart for
reporting. The solution has three parts:

### 1. [`Dashboards.Database`](Dashboards.Database)

- **Type**: SQL Server Database Project (`.sqlproj`)
- **Purpose**: Defines the schema for the Dashboards DataMart — the destination layer for the ETL process.
- **Content**: Table definitions, views, and stored procedures organized into four schemas — `staging` → `etl` →
  `reporting` → `bi` — where `bi` is the actual read contract Power BI consumes. See
  [Technical Overview](docs/technical-overview.md) for what each layer does.

### 2. [`Dashboards.Database.ETL`](Dashboards.Database.ETL)

- **Type**: SQL Server Integration Services (SSIS) Project
- **Purpose**: The orchestration layer that handles data movement.
- **Workflow**: `Master.dtsx` loads a school year at a time (tracked in `etl.BatchControl`) from a CEDS Data
  Warehouse into `staging`, then merges `staging` into `reporting` via the `etl.Upsert_*` stored procedures. K12 and
  postsecondary data move through parallel package pairs — see [Technical Overview](docs/technical-overview.md#data-flow)
  for the current execution state.
- This ETL is a **reference implementation**, not a required dependency — the database schema is the contract. You're
  welcome to use it as-is, adapt it, or build your own pipeline against the same schema.

### 3. [`PowerBI`](PowerBI)

- **Type**: Power BI Project files (`.pbip`) — stored as text/JSON so changes are reviewable in pull requests, rather
  than as opaque `.pbix` binaries.
- **Purpose**: The visualization layer used by stakeholders to answer Essential Questions.
- One folder per Essential Question (`EQ-12`, `EQ-18`, `EQ-19`), each containing a Report and a Semantic Model.
  Shared theming and assets live in [`PowerBI/assets`](PowerBI/assets).

## Getting Started

### Prerequisites

- [SQL Server](https://www.microsoft.com/en-us/sql-server/sql-server-downloads) (Developer Edition or higher)
- [SQL Server Management Studio (SSMS)](https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms)
- Visual Studio with the **SQL Server Data Tools (SSDT)** and **SSIS** workloads, if you plan to modify the database
  project or ETL packages
- [Power BI Desktop](https://powerbi.microsoft.com/en-us/desktop/) (latest version)
- Access to a CEDS Data Warehouse (or your own data source mapped to the same schema)

### Option A: Explore with the Sample Database

The fastest way to see the dashboards in action is to restore the pre-populated sample database rather than standing
up your own CEDS Data Warehouse:

1. Download the sample database backup (`.bak`) from the
   [Releases page](https://github.com/E-W-Framework-Analysis-Tool/E-W-Indicator-Analytics/releases).
2. In SSMS, right-click **Databases** → **Restore Database** → **Device**, browse to the downloaded `.bak` file, and
   click **OK**. Confirm the `Dashboards` database now appears under Databases.
3. Open the `.pbip` file for the EQ you want in the `PowerBI` folder — Power BI Desktop will load the dashboard.
4. Point Power BI at your restored database: **Home → Transform Data → Data source settings** → **SQL Server**, set
   **Server** to `localhost\<INSTANCE_NAME>` (found in SSMS at the top of the object tree) and **Database** to
   `Dashboards`, then connect using Windows Authentication.

### Option B: Deploy the Full Pipeline

1. **Database**: Deploy `Dashboards.Database/Dashboards.Database.sqlproj` to your SQL instance to create the schema.
2. **ETL** *(optional — only if using the reference pipeline)*: Open `Dashboards.Database.ETL`, update the
   `Project.Params` values to point at your Source (CEDS Data Warehouse) and Destination (Dashboards DataMart), and
   execute the packages.
3. **Reports**: Open the `.pbip` file for the EQ you want in the `PowerBI` folder and update the data source (**Home →
   Transform Data → Data source settings**) to point at your populated Dashboards database, using your server name and
   Windows Authentication.

See [docs/development.md](docs/development.md) and [docs/deployment.md](docs/deployment.md) for more detail.

## Documentation

| Document                                                 | Description                                                               |
| -------------------------------------------------------- | ------------------------------------------------------------------------- |
| [Technical Overview](docs/technical-overview.md)         | Architecture, schema layers, and data flow.                               |
| [Development Guide](docs/development.md)                 | Local environment setup and contribution workflow.                        |
| [Deployment](docs/deployment.md)                         | Deploying the database, running the ETL, and publishing reports.          |
| [Dashboard Design Notes](docs/dashboard-design-notes.md) | Shared design tenets, page pattern, and filtering conventions across EQs. |

## Contributing

Contributions are welcome! See [CONTRIBUTING.md](CONTRIBUTING.md) for how to report bugs, request features, and
submit pull requests.

## License

This project is licensed under the [Apache License 2.0](LICENSE).
