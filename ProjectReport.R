# Load required library
library(ggplot2)

# Load the dataset
   user_data <- (OA_11_6_yelp_academic_dataset_user_json)  # Replace with your file path
   print(colnames(user_data))  # Print column names
        
  
     # 1. Correlation Analysis
     correlation_matrix <- cor(user_data[, c("cool_votes", "funny_votes", "useful_votes")], use = "complete.obs")
     print("Correlation Matrix for cool_votes, funny_votes, and useful_votes:")
     print(correlation_matrix)
   
    
       # 2. Linear Regression: Cool Votes vs. Funny Votes
       linear_model1 <- lm(funny_votes ~ cool_votes, data = user_data)
     coefs <- coef(linear_model1)
     cat("Equation of the fit line: Funny Votes =", coefs[1], "+", coefs[2], "* Cool Votes\n")

       # Scatter plot with regression line
       ggplot(user_data, aes(x = cool_votes, y = funny_votes)) +
      +     geom_point(alpha = 0.6) +
      +     geom_smooth(method = "lm", se = FALSE, color = "blue") +
      +     labs(title = "Relationship between Cool Votes and Funny Votes",
                 +          x = "Cool Votes", y = "Funny Votes")

       # 3. Review Count vs. Fans
       linear_model2 <- lm(fans ~ review_count, data = user_data)
    coefs2 <- coef(linear_model2)
     cat("Equation of the fit line: Fans =", coefs2[1], "+", coefs2[2], "* Review Count\n")
       # Scatter plot for Review Count vs. Fans
       ggplot(user_data, aes(x = review_count, y = fans)) +
      +     geom_point(alpha = 0.6) +
      +     geom_smooth(method = "lm", se = FALSE, color = "green") +
      +     labs(title = "Relationship between Review Count and Fans",
                 +          x = "Review Count", y = "Fans")

       # 4. Finding another variable that influences Fans
       linear_model3 <- lm(fans ~ useful_votes, data = user_data)
     coefs3 <- coef(linear_model3)
     cat("Equation of the fit line: Fans =", coefs3[1], "+", coefs3[2], "* Useful Votes\n")

       # Scatter plot for Useful Votes vs. Fans
       ggplot(user_data, aes(x = useful_votes, y = fans)) +
      +     geom_point(alpha = 0.6) +
      +     geom_smooth(method = "lm", se = FALSE, color = "purple") +
      +     labs(title = "Relationship between Useful Votes and Fans",
                 +          x = "Useful Votes", y = "Fans")

       # 5. K-Means Clustering: Review Count vs. Fans
       set.seed(123)  # For reproducibility
     cluster_data <- user_data[, c("review_count", "fans")]
     kmeans_result1 <- kmeans(cluster_data, centers = 3, nstart = 10)
     user_data$cluster1 <- as.factor(kmeans_result1$cluster)
     
       # Scatter plot with clusters
       ggplot(user_data, aes(x = review_count, y = fans, color = cluster1)) +
      +     geom_point() +
      +     labs(title = "K-Means Clustering: Review Count vs. Fans",
                 +          x = "Review Count", y = "Fans")
     
       # 6. K-Means Clustering: Useful Votes vs. Fans
       cluster_data2 <- user_data[, c("useful_votes", "fans")]
     kmeans_result2 <- kmeans(cluster_data2, centers = 3, nstart = 10)
     user_data$cluster2 <- as.factor(kmeans_result2$cluster)
     
      # Scatter plot with clusters
       ggplot(user_data, aes(x = useful_votes, y = fans, color = cluster2)) +
      +     geom_point() +
      +     labs(title = "K-Means Clustering: Useful Votes vs. Fans",
                 +          x = "Useful Votes", y = "Fans")