# Machine learning

## Tools

1. Python(sklearn, xgboost, pandas)

## Sources

Input data taken from public dataset repo https://archive.ics.uci.edu/ml/datasets/Car+Evaluation


## Approach

Python notebook contains necessary scripts required to process the input data, create prediction model(using xgboost) and predict output value for given input

Following are the steps performed,

1. Read the input source data from `data/` directory
2. Exploratory data analysis to understand nature of data
3. Transform input data

    a. Split data into input and output features. Also split to train and test with 20% of data for testing

    b. Encode data using `OrdinalEncoder` in `sklearn` for input feature

    c. Encode output features using `LabelEncoder`. Because `xgboost` doesn't accept `OrdinalEncoder` for output feature

4. Train model `XGBClassifier` with parameters `n_estimators=100,max_depth=3,learning_rate=0.01,objective='binary:logistic'`

    Because `XGBClassifier` gives better results than `RandomForest` and `DecisionTree`, I have selected `XGBClassifier` for this scenario

    Also tried kmeans clustering and svm classification. But couldn't improve the accuracy

5. Predict output using the test data
6. Check model accuracy with `accuracy_score`
7. Predict output for the given input values (Maintenance = High
Number of doors = 4
Lug Boot Size = Big
Safety = High
Class Value = Good). Assumption made to default persons to `None`
8. Final result as per this mode is **"Low"**





