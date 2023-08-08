# data1202_project
****************************** Data Selection ***********************************

Sales analysis of a stationary store

i selected a stationary sales data from kaggle.
The dataset can be found from https://www.kaggle.com/datasets/rohitsahoo/sales-forecasting. 

The dataset had just one file train.csv

******************************* Data Extraction **********************************
I normalized this csv file and made three tables

1) Orders Table ( Fact Table )
2) Customer Table ( Dimension Table)
3) Product Table ( Dimension Table )

Steps taken to make three tables. Split the train csv file. Cut and Pasted the product and Customer related columns into a seperate file and removed the duplicates. 
Removing the duplicates ensures that we can create a many to one relationship.
Finally we load the three tables into SQL

******************************** Data Transformation ******************************
******** Check Nulls *********
First step is to check the data types and perform quality checks such as null values 
```sql
Select *
from orders_table
where  Sales is NULL ;
```




