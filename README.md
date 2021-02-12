# queijomen

## Content
###### 1. Project Aim
###### 2. Technologies
###### 3. Explore the Data.
###### 4. Build the Model.
###### 5. Project Status.
###### 6. Sources.
###### 7. Additional Information. 

### Project Aim
We are three students, currently enrolled in an IronHack data bootcamp. 

Our project was to build a model that will predict the price of a house based on features provided in the dataset. 

Within our python code we split the challenge into three components: ‘Explore the data, ‘Build the model’, ‘Visualise’. 

Additionally, our task required using Tableau to graph the data and MySql to explore particular groupings and trends.


### Technologies 
- Python 3.6
- MySQL 8.0
- Tableau 2020.4 

### Explore the Data
Exploring the dataset we decided to change two variables: 
* Utilize Uber’s hex_3 library rather zip codes.
* Create additional time variables from our date data: season, month_year, week_year. 

### Build a Model
![system breakdown](https://github.com/urgpan/quijoman/tree/main/data/Diagram.jpg?raw=false)

Regression models used were:
* Linear Regression
* KNeighbors Regression
* Lasso Lars
* Polynomial
* SGDC Classsifier
* Random Forest Regression
* SGD Regressor
* XGB Regressor
* Gradient Boosting Regressor

### Project Status
Project has finished, and was done in 5 days. We found that Gradient Boosting Regressor, coupled with Power Transformer, produced the best model for house price prediction with the Washington dataset. 

### Sources
Useful websites that we used:

https://eng.uber.com/h3/ 

https://towardsdatascience.com/why-you-shouldnt-use-zip-codes-for-your-hyperlocal-last-mile-analysis-3b9f8613bcc1

https://www.gislounge.com/modifiable-areal-unit-problem-gis/

https://towardsdatascience.com/stop-using-zip-codes-for-geospatial-analysis-ceacb6e80c38

https://hbr.org/2015/11/a-refresher-on-regression-analysis

https://www.upgrad.com/blog/types-of-regression-models-in-machine-learning/

https://www.earthdatascience.org/courses/use-data-open-source-python/use-time-series-data-in-python/date-time-types-in-pandas-python/
