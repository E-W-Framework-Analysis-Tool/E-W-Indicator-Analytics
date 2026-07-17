# Deployment

## Restoring the Sample Database

The quickest path to a running set of dashboards: download the sample database backup (`.bak`) from the
[Releases page](https://github.com/E-W-Framework-Analysis-Tool/E-W-Indicator-Analytics/releases) and restore it in
SSMS (**Databases → Restore Database → Device**). This gives you a populated `Dashboards` database without needing a
CEDS Data Warehouse — see the README's [Quick Start](../README.md#option-a-explore-with-the-sample-database) for the
full steps.

## Deploying the Database Project

Publish `Dashboards.Database/Dashboards.Database.sqlproj` — via Visual Studio's Publish action, or `sqlpackage`
against the generated `.dacpac` — to create or update the `staging`, `etl`, `reporting`, and `bi` schemas on your SQL
instance. The post-deployment script (`Scripts/Script.PostDeployment.sql`) re-seeds the static reference dimensions
on every publish and is safe to run repeatedly.

## Configuring and Running the ETL

### Project Parameters

`Dashboards.Database.ETL/Project.params` holds the `Source*`/`Target*` server, database, and authentication settings
— set these before running `Master.dtsx`. Leave `*IntegratedSecurity` set to `true` for Windows Authentication, or
supply SQL credentials via `*SqlUsername`/`*SqlPassword`.

### Package Execution Order

See the [architecture diagram](technical-overview.md#architecture) for the full picture. `Master.dtsx` runs, per
school year (tracked in `etl.BatchControl`):

1. **CEDS DWH → Staging** — `LoadStagingDimensions.dtsx` / `LoadStagingFacts.dtsx` for K12,
   `PS_LoadStagingDimensions.dtsx` / `PS_LoadStagingFacts.dtsx` for postsecondary.
2. **Staging → Reporting** — `LoadReporting.dtsx` / `PS_LoadReporting.dtsx`, which invoke the `etl.Upsert_*` stored
   procedures.

> As of this writing, the K12 steps are disabled in `Master.dtsx` — only the postsecondary path runs by default. See
> [Technical Overview](technical-overview.md#data-flow).

## Publishing Power BI Reports

Reports are consumed by opening the `.pbip` directly in Power BI Desktop — this repository doesn't include a Power BI
Service deployment pipeline. If your organization needs a hosted/shared version, publish to a workspace using Power
BI Desktop's **Publish** button.

### Connecting to Your Own Data Source

**Home → Transform Data → Data source settings → Change Source**, then update **Server**/**Database** to point at
your instance.

## Scheduling and Automation

Not included in this repository. A typical approach is a SQL Server Agent job invoking `Master.dtsx` via `dtexec` on
a schedule aligned to your source system's refresh cadence.

## Rollback

Take a database backup before publishing schema changes. Restoring that backup is the rollback path — there is no
automated rollback tooling.
