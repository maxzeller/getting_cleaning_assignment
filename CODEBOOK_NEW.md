# Variables

* `x_train`, `y_train`, `x_test`, `y_test`, `subject_train` and `subject_test` contain the data from the downloaded files.
* `x_data`, `y_data` and `subject_data` merge the previous datasets to further analysis.
* `features` contains the correct fullnames for the `x_data` dataset, which are applied to the column names stored in `mean_and_std`, a numeric vector used to extract the desired data.
* THe same is performed with activity names through the `activities` variable.
* `complete_set` merges `x_data`, `y_data` and `subject_data` in a big dataset.
* `averages_data` contains the relevant averages

