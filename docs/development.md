# Development Guide

## Prerequisites

See the [README Prerequisites](../README.md#prerequisites) — Visual Studio with the SSDT and SSIS workloads, a SQL
Server instance, and Power BI Desktop.

## Local Environment Setup

### Database (`Dashboards.Database`)

Open `Reporting.slnx` (or the `.sqlproj` directly) in Visual Studio, point
`Dashboards.Database/Dashboards.Database.publish.xml`'s `TargetConnectionString` at your instance, and Publish. The
post-deployment script re-seeds the static reference dimensions automatically — safe to re-run.

### ETL (`Dashboards.Database.ETL`)

Open the project in Visual Studio (SSIS workload). Update `Project.params` for `SourceServer`/`SourceDatabase` (your
CEDS Data Warehouse) and `TargetServer`/`TargetDatabase` (your `Dashboards` DataMart). Run `Master.dtsx` from the SSIS
debugger to execute the full flow, or run one of the standalone `Load*.dtsx`/`PS_Load*.dtsx` packages to iterate on a
single stage.

### Power BI Reports

Open the `.pbip` for the EQ you're working on — Power BI Desktop treats the folder as a live project. Point its
semantic model at your local `Dashboards` database (via the `bi` schema views) before editing report visuals.

## Standard Workflow

1. Identify which layer your change belongs to — staging extract, `etl` merge logic, `reporting`/`bi` model, or
   report visuals (see [Technical Overview](technical-overview.md)).
2. Make the change and deploy/re-run just that layer locally.
3. Verify against your local database and Power BI Desktop — there is no automated test suite.
4. Update the relevant doc (this one, [Technical Overview](technical-overview.md), or
   [Dashboard Design Notes](dashboard-design-notes.md)) if the change affects setup or design.

## Branching Strategy

See [CONTRIBUTING.md](../CONTRIBUTING.md) — `feature/`, `bug/`, `chore/` prefixes, PRs squash-merged into `main`.

## Releases

Code in this repository isn't versioned/released separately — `main` is the deployable state of the schema, ETL, and
reports. The sample database (see [Deployment](deployment.md#restoring-the-sample-database)) is published
independently as a single rolling GitHub Release whose asset is replaced in place as the data is refreshed; it is not
tied to a specific commit or code version.
