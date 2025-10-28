
/*
---------------------------------------------------------------------------------
Stored Procedure: bronze.load_bronze
---------------------------------------------------------------------------------
  
Purpose:
    Loads data from external CSV files into the 'bronze' schema. 

    Steps performed:
    1. Truncate the target bronze tables before loading.
    2. Load CSV data into bronze tables using BULK INSERT.

Parameters:
    None. This stored procedure does not accept any parameters or return any values.

Usage:
    EXEC bronze.load_bronze;

Notes:
    - Ensure CSV files are accessible and not locked by another process.
    - Execution requires proper permissions on the bronze schema and file paths.
    - Track start and end times to monitor load duration if necessary.
---------------------------------------------------------------------------------
*/

CREATE OR ALTER PROCEDURE bronze.load_bronze AS

    BEGIN 
    DECLARE 
    @batch_start_time DATETIME = GETDATE();
    @batch_end_time DATETIME;
    @start_time DATETIME;
    @end_time DATETIME;

    BEGIN TRY
    PRINT '========================================================';
    PRINT 'Loading Bronze Layer';
    print '========================================================';

    PRINT '--------------------------------------------------------';
    PRINT 'Loading CRM Tables';
    PRINT '--------------------------------------------------------';

    SET @start_time = GETDATE ();
    PRINT '>> Truncating Table: crm_cust_info';
    TRUNCATE TABLE bronze.crm_cust_info
    PRINT '>> Inserting Data Into: Table: crm_cust_info';
    BULK INSERT DataWarehouse.bronze.crm_cust_info
    FROM 'C:\Users\Usuário\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
    WITH (
        FIRSTROW = 2
        ,FIELDTERMINATOR = ','
        ,TABLOCK
    );
    SET @end_time = GETDATE ();
    PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
    PRINT '---------------------';

    SET @start_time = GETDATE ();
    PRINT '>> Truncating Table: crm_prd_info';
    TRUNCATE TABLE bronze.crm_prd_info
    PRINT '>> Inserting Data Into: Table: crm_prd_info';
    BULK INSERT DataWarehouse.bronze.crm_prd_info
    FROM 'C:\Users\Usuário\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
       WITH (
       FIRSTROW = 2
        ,FIELDTERMINATOR = ','
        ,TABLOCK
    );
    SET @end_time = GETDATE ();
    PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
    PRINT '---------------------';

    SET @start_time = GETDATE ();
    PRINT '>> Truncating Table: crm_sales_details';
    TRUNCATE TABLE bronze.crm_sales_details

    PRINT '>> Inserting Data Into: Table: crm_sales_details';
    BULK INSERT DataWarehouse.bronze.crm_sales_details
    FROM 'C:\Users\Usuário\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
       WITH (
        FIRSTROW = 2
        ,FIELDTERMINATOR = ','
        ,TABLOCK
    );
    SET @end_time = GETDATE ();
    PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
    PRINT '---------------------';

    PRINT '--------------------------------------------------------';
    PRINT 'Loading ERP Tables';
    PRINT '--------------------------------------------------------';
    SET @start_time = GETDATE ();
    PRINT '>> Truncating Table: erp_cust_az12'
    TRUNCATE TABLE bronze.erp_cust_az12

    PRINT '>> Inserting Data Into: Table: erp_cust_az12';
    BULK INSERT DataWarehouse.bronze.erp_cust_az12
    FROM 'C:\Users\Usuário\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
       WITH (
       FIRSTROW = 2
        ,FIELDTERMINATOR = ','
        ,TABLOCK
    );
    SET @end_time = GETDATE ();
    PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
    PRINT '---------------------';

    SET @start_time = GETDATE ();
    PRINT '>> Truncating Table: erp_loc_a101'
    TRUNCATE TABLE bronze.erp_loc_a101

    PRINT '>> Inserting Data Into: Table: erp_loc_a101';
    BULK INSERT DataWarehouse.bronze.erp_loc_a101
    FROM 'C:\Users\Usuário\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
        WITH (
        FIRSTROW = 2
        ,FIELDTERMINATOR = ','
        ,TABLOCK
    );
    SET @end_time = GETDATE ();
    PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
    PRINT '---------------------';

    SET @start_time = GETDATE ();
    PRINT '>> Truncating Table: erp_px_cat_g1v2'
    TRUNCATE TABLE bronze.erp_px_cat_g1v2

    PRINT '>> Inserting Data Into: Table: erp_px_cat_g1v2';
    BULK INSERT DataWarehouse.bronze.erp_px_cat_g1v2
    FROM 'C:\Users\Usuário\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
        WITH (
        FIRSTROW = 2
        ,FIELDTERMINATOR = ','
        ,TABLOCK
    );
    SET @end_time = GETDATE ();
    PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
    PRINT '---------------------';
  
	  SET @batch_end_time = GETDATE();
	  PRINT '=========================================='
	  PRINT 'Loading Bronze Layer is Completed';
    PRINT '   - Total Load Duration: ' + CAST(DATEDIFF(SECOND, @batch_start_time, @batch_end_time) AS NVARCHAR(20)) + ' seconds';
    PRINT '==========================================';

    END TRY
    BEGIN CATCH
  
    PRINT '========================================================';
    PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER';
    PRINT 'Error Message' + ERROR_MESSAGE();
    PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR);
    PRINT '========================================================';
    END CATCH
END;
