# Contributing to E-W Indicator Analytics

Thank you for your interest in contributing! There are several ways to get involved, and we appreciate all of them.

## Ways to Contribute

- **Report a bug** – [Open an issue](https://github.com/E-W-Framework-Analysis-Tool/E-W-Indicator-Analytics/issues)
  describing what you found and how to reproduce it.
- **Request a feature** –
  [Open an issue](https://github.com/E-W-Framework-Analysis-Tool/E-W-Indicator-Analytics/issues) with the
  `enhancement` label describing the use case.
- **Submit a pull request** – Fix a bug, improve documentation, add or refine a dashboard, or implement an approved
  feature. See below.
- **Ask a question** –
  [Open a GitHub Discussion](https://github.com/E-W-Framework-Analysis-Tool/E-W-Indicator-Analytics/discussions) if
  you're unsure about something or want to talk through an idea before opening a PR.

For significant changes — a new schema layer, a new Essential Question dashboard, or a change to the ETL
orchestration — please open an issue first so we can align on approach before you invest time in implementation.

> **Team members with repository access:** See the [Development Guide](docs/development.md) for the internal
> workflow, local environment setup, and release process.

---

## Submitting a Pull Request

All external contributions are made via a fork.

1. **Fork the repository** and create a branch off `main`:

   ```bash
   git checkout -b feature/short-description
   ```

2. **Make your changes.**
   - Schema changes go in `Dashboards.Database` (keep views/procedures under the correct schema — `staging`, `etl`,
     `bi`, or `reporting`).
   - ETL changes go in `Dashboards.Database.ETL` (SSIS packages). Avoid hardcoding server names, database names, or
     credentials — use the project parameters in `Project.params` and the existing connection managers.
   - Report changes go in the relevant `PowerBI/EQ-*` folder. Power BI reports are stored in `.pbip` (PBIP) format so
     changes are reviewable as text/JSON diffs — please keep it that way rather than committing a `.pbix`.
   - If your change affects setup or behavior, update the relevant documentation too.

3. **Test your changes** against a local SQL Server instance and Power BI Desktop before opening a PR — see the
   [Development Guide](docs/development.md) for how to point the project at your own environment. There is no
   automated test suite for this repository; manual verification of the affected schema objects, ETL packages, or
   report visuals is expected.

4. **Open a pull request** against `main` with a clear title and description. Link to any related issue.

### Branch naming

- `feature/short-description`
- `bug/short-description`
- `chore/short-description`

### What to expect

- A maintainer will review your PR and provide feedback, usually within a few business days.
- At least one approving review is required before merging.
- PRs are merged using squash commits.

---

## Getting Help

- **Questions**:
  [Open a GitHub Discussion](https://github.com/E-W-Framework-Analysis-Tool/E-W-Indicator-Analytics/discussions)
- **Bug reports**:
  [Open a GitHub Issue](https://github.com/E-W-Framework-Analysis-Tool/E-W-Indicator-Analytics/issues)
- **Feature requests**:
  [Open a GitHub Issue](https://github.com/E-W-Framework-Analysis-Tool/E-W-Indicator-Analytics/issues) with the
  `enhancement` label

---

By contributing, you agree that your contributions will be licensed under the [Apache License 2.0](LICENSE).
