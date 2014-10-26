This file describes the data transformations done to the data from the given experiment:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

1. Subject and activity identifiers are joined to the test and train data.
2. Test and training data sets and merged.
3. Only the features containing the substring "std" or "mean" are retained, as I've seen this as a good proxy for average and standard deviation measurements.
4. The activity feature is refactored with the activity ids from the activity_labels.txt file.
5. The features are named with labels from the features.txt file, with the following character replacements:
  * Any character like _-() is replaced by a dot (.).
6. An average for each respective feature, grouped by activity and subject, is computed in the "summarization.txt".

The features have not been altered in any other way and for their description and meaning, please consult the experiment documentation.

Wojciech Gajewski
