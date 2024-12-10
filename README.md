# SQL Server Database Deployment with DACPAC

This repository contains the database schema for the [Project Name] SQL Server database. The schema is stored as a `.dacpac` file, which is used to automate deployments to an Azure SQL Database using GitHub Actions.

## Repository Structure

```
.
├── Database.dacpac         # Compiled database schema
├── Schema
│   └── DatabaseSchema.sql
├── .github
│   └── workflows
│       └── deploy-database.yml  # GitHub Actions workflow file
├── README.md               # This file
```

## Deployment Workflow

This repository is set up with a GitHub Actions workflow to deploy the database schema to Azure SQL Database.

### Workflow Trigger
The deployment workflow (`deploy-database.yml`) is triggered automatically:
- On every push to the `main` branch.
- When a pull request is merged into `main`.

## Prerequisites

Before using this repository, ensure the following:

1. **Azure SQL Database**:
   - A logical SQL Server is set up on Azure.
   - An empty database is created, or the target database name is known.

2. **Secrets Configuration**:
   Add the following secrets to your GitHub repository:
   - `AZURE_SQL_SERVER`: The name of your Azure SQL Server (e.g., `your-server-name.database.windows.net`).
   - `AZURE_SQL_DB_NAME`: The target database name.
   - `AZURE_SQL_USER`: The username for the Azure SQL admin.
   - `AZURE_SQL_PASSWORD`: The password for the Azure SQL admin.

3. **GitHub Actions Runner**:
   Ensure the repository is enabled for GitHub Actions.

## Setting Up the Workflow

The deployment is defined in the `.github/workflows/deploy-database.yml` file:

```yaml
name: Deploy SQL Database

on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main

jobs:
  deploy:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout Repository
      uses: actions/checkout@v3

    - name: Deploy Schema using SQLPackage
      run: |
        sqlpackage /Action:Publish \
                   /SourceFile:Database.dacpac \
                   /TargetServerName:${{ secrets.AZURE_SQL_SERVER }} \
                   /TargetDatabaseName:${{ secrets.AZURE_SQL_DB_NAME }} \
                   /TargetUser:${{ secrets.AZURE_SQL_USER }} \
                   /TargetPassword:${{ secrets.AZURE_SQL_PASSWORD }}
```

## How to Use

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-username/your-repo.git
   cd your-repo
   ```

2. **Update the DACPAC File**:
   Replace `Database.dacpac` with your updated database schema file.

3. **Push Changes to Main**:
   Commit and push changes to trigger the deployment workflow.
   ```bash
   git add .
   git commit -m "Update database schema"
   git push origin main
   ```

4. **Monitor Workflow**:
   Check the GitHub Actions tab to monitor the deployment process.

## Security Considerations

- Use **GitHub Secrets** to store sensitive credentials.
- Restrict access to the `main` branch to authorized personnel.

## Features

- Automates deployment of SQL Server database schema to Azure.
- Integrates with GitHub Actions for continuous delivery.
- Tracks schema changes using version control.

## Testing

1. Test the `.dacpac` file locally using SQL Server Management Studio (SSMS) or `sqlpackage`:
   ```bash
   sqlpackage /Action:Publish /SourceFile:Database.dacpac /TargetServerName:<ServerName> /TargetDatabaseName:<DatabaseName>
   ```

2. Validate the schema and ensure successful deployment before committing changes.

## Contributing

Contributions are welcome. Please open an issue or submit a pull request for enhancements.

## License

This repository is licensed under the [MIT License](LICENSE).

## Support

For questions or issues, contact [Ruebled] at [daniel.canevschii@student.usv.ro].
