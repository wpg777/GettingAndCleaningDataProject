require(plyr)
data_directory <- '.'
feature_names <- read.table(file.path(data_directory, "features.txt"), col.names=c("ord", "feature_names"))
activity_labels <- read.table(file.path(data_directory, "activity_labels.txt"), col.names=c("ord", "label"))

test_data <- read.table(file.path(data_directory, "test", "X_test.txt"), col.names=feature_names$feature_names)
test_data$activity <- read.table(file.path(data_directory, "test", "y_test.txt"))$V1
test_data$subject <- read.table(file.path(data_directory, "test", "subject_test.txt"))$V1
train_data <- read.table(file.path(data_directory, "train", "X_train.txt"), col.names=feature_names$feature_names)
train_data$activity <- read.table(file.path(data_directory, "train", "y_train.txt"))$V1
train_data$subject <- read.table(file.path(data_directory, "train", "subject_train.txt"))$V1
total_set <- rbind(test_data, train_data)
column_names <- colnames(total_set)
cols_subset <- as.character(column_names[grepl("mean|std", column_names)])

selected_variables <- total_set[,c(cols_subset, "activity", "subject")]
selected_variables$activity <-factor(selected_variables$activity, levels=activity_labels$ord, labels=activity_labels$label)

summarization <- ddply(selected_variables, c("activity", "subject"), numcolwise(mean))
write.table(summarization, file="summarization.txt", row.name=FALSE)
