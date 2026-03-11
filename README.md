B2B SALES PIPELINE ANALYTICS PROJECT
End-to-End CRM Intelligence System

----------------------------------------------------
1. PROJECT OVERVIEW
----------------------------------------------------

This project focuses on analyzing a B2B sales pipeline to generate
business insights related to revenue, sales performance, pipeline
efficiency, and product performance.

The goal of the project is to build a complete business intelligence
solution that helps management understand:

- Which sales agents generate the most revenue
- What the win rate of deals is
- Which products drive revenue
- Which regions perform better
- Where the sales pipeline drops off
- How long deals take to close

The project integrates multiple tools to perform data engineering,
analysis, and visualization.

----------------------------------------------------
2. DATA SOURCES
----------------------------------------------------

The dataset contains CRM opportunity data and includes the following
tables:

1. accounts
2. products
3. sales_pipeline
4. sales_teams

These tables contain information about customers, products,
sales agents, and deal opportunities.

----------------------------------------------------
3. TOOLS & TECHNOLOGIES USED
----------------------------------------------------

The following tools were used to build the project:

Excel
- Used for initial data understanding and auditing
- Checking missing values and duplicates

Google Sheets
- Used as a cloud-based data storage source

Google Cloud Console
- Used to configure API access and enable connectivity
  between Google Sheets and the analysis environment

Python (Jupyter Notebook)
- Used for Exploratory Data Analysis (EDA)
- Data validation and transformation

MySQL
- Used for database creation
- Data storage and querying
- KPI calculations and analytical views

Power BI
- Used to build interactive dashboards
- Connected directly to the MySQL database

----------------------------------------------------
4. DATA PIPELINE ARCHITECTURE
----------------------------------------------------

The project follows this data flow pipeline:

Google Sheets
      ↓
Google Cloud Console (API Connection)
      ↓
Jupyter Notebook (Python)
      ↓
MySQL Database
      ↓
Power BI Dashboard

Step Explanation:

1. Data was stored in Google Sheets.
2. Google Cloud Console was used to enable API access.
3. Jupyter Notebook connected to Google Sheets using Python.
4. Data was cleaned and validated in Python.
5. The cleaned dataset was loaded into a MySQL database.
6. SQL queries and analytical views were created.
7. Power BI was connected to MySQL for dashboard visualization.

----------------------------------------------------
5. SQL DATA ENGINEERING
----------------------------------------------------

A MySQL database named "project" was created.

Tables used:
- sale_pipeline
- products
- accounts
- sales_teams

Several analytical views were created to simplify analysis:

1. opportunity_metrics
   - days_to_close
   - deal_status (Won/Lost/Open)

2. sales_agent_performance
   - total_opportunities
   - win_rate
   - total_revenue
   - avg_deal_size
   - avg_days_to_close

3. product_performance
   - total_revenue
   - win_rate
   - avg_deal_size

4. regional_performance
   - regional_office
   - total_revenue
   - win_rate
   - active_agents

Example SQL code is included in:
Sql_Final_Project.sql

----------------------------------------------------
6. KPI METRICS IMPLEMENTED
----------------------------------------------------

The following business KPIs were engineered using SQL:

- Total Pipeline Value
- Closed Revenue
- Win Rate %
- Average Deal Size
- Average Sales Cycle Length
- Revenue by Region
- Revenue by Sector
- Revenue by Product
- Manager Performance
- Top 5 Sales Agents
- Open vs Closed Opportunities
- Stage-wise Drop-off

These KPIs help management monitor the performance
of the sales pipeline and identify improvement areas.

----------------------------------------------------
7. POWER BI DASHBOARD
----------------------------------------------------

The Power BI dashboard contains multiple report pages:

Executive Overview
- Total Revenue
- Win Rate
- Total Opportunities
- Average Sales Cycle

Sales Performance
- Revenue by Sales Agent
- Manager Performance
- Regional Revenue

Pipeline Analysis
- Opportunities by Stage
- Pipeline Drop-off
- Open vs Closed Deals

Product & Account Insights
- Revenue by Product
- Revenue by Sector
- Top Accounts

The dashboard includes slicers for:
- Region
- Product
- Sales Agent
- Deal Stage

----------------------------------------------------
8. KEY INSIGHTS
----------------------------------------------------

Some insights identified during analysis:

- GTXPro is the highest revenue generating product.
- Retail and Technology sectors generate the most revenue.
- Some sales agents significantly outperform others.
- Certain pipeline stages cause deal drop-offs.
- Most revenue is generated from the United States region.

These insights help management optimize the sales strategy.

----------------------------------------------------
9. STRATEGIC RECOMMENDATIONS
----------------------------------------------------

Based on the analysis:

1. Focus marketing efforts on high-performing products.
2. Improve conversion rates in weak pipeline stages.
3. Train low-performing sales agents using top performers.
4. Reduce the average sales cycle length.
5. Expand business in high-revenue sectors.

----------------------------------------------------
10. PROJECT FILE STRUCTURE
----------------------------------------------------

B2B-Sales-Pipeline-Analytics

data/
    raw data files

sql/
    Sql_Final_Project.sql

powerbi/
    dashboard.pbix files

notebooks/
    EDA final project.ipynb

presentation/
    Sales pipeline Report Presentation.pdf

README.txt

----------------------------------------------------
11. PROJECT OUTCOME
----------------------------------------------------

This project demonstrates:

- Data engineering with SQL
- Exploratory Data Analysis using Python
- Cloud data connectivity
- Business KPI development
- Interactive dashboard creation
- End-to-end data analytics workflow

The system provides a scalable framework for analyzing
CRM sales pipelines and supporting data-driven decisions.

----------------------------------------------------
END OF DOCUMENT
----------------------------------------------------
