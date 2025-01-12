8# SQL Server Database Data

This repository contains the database schema for the ExamPlanner SQL Server database.

## How to Use

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/o-w-c-a/database-setup.git
   cd database-setup
   ```

2. **Update the DACPAC File**:
   Replace `ExamsDB.dacpac` with your updated database schema file.

3. **Push Changes to Main**:
   Commit and push changes to trigger the deployment workflow.
   ```bash
   git add .
   git commit -m "Update database schema"
   git push origin main
   ```

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
