Project Overview

The goal of this project is to identify patterns and relationships between Yelp user activity and their popularity. We specifically explore the following:

The correlation between different types of votes (cool, funny, and useful votes).
The relationship between review counts and the number of fans.
The impact of useful votes on fan count.
The clustering of users based on their activity and fan base.
Data Description

The dataset consists of 552,339 entries and contains the following columns:

user_id: Unique identifier for each user.
name: Name of the user.
review_count: The number of reviews written by the user.
average_stars: The average rating given by the user across all their reviews.
cool_votes: The number of "cool" votes the user received.
funny_votes: The number of "funny" votes the user received.
useful_votes: The number of "useful" votes the user received.
friends: Number of friends the user has on the platform.
elite: Whether the user is an elite member (yes/no).
yelping_since: The year when the user joined Yelp.
fans: The number of fans the user has.
Analysis Summary

The analysis explores various relationships and performs linear regression, clustering, and correlation analysis:

1. Correlation Analysis
We calculated the correlation coefficients between the different types of votes:

Cool Votes ~ Useful Votes: r = 0.98
Cool Votes ~ Funny Votes: r = 0.97
Useful Votes ~ Funny Votes: r = 0.95
These high correlation scores suggest that if a user receives one type of vote, they are likely to receive the others as well.

2. Review Count and Fans
A linear regression model for review_count vs. fans produced the equation:

Fans = -0.6576 + 0.0720 * Review Count
This indicates a weak positive relationship between the number of reviews written and the number of fans a user has. For every additional review written, a user gains 0.072 fans.

3. Useful Votes and Fans
The relationship between useful_votes and fans was also analyzed using linear regression:

Fans = 0.2466 + 0.0212 * Useful Votes
This suggests a stronger positive relationship than review count, with each useful vote contributing about 0.021 additional fans.

4. K-Means Clustering
K-means clustering was applied to understand user behavior. We performed clustering twice:

Clustering with Review Count and Fans: Users with more reviews tended to have more fans, but outliers (users with many fans and fewer reviews) were present.
Clustering with Useful Votes and Fans: Users with higher useful votes also tended to have more fans, confirming the positive correlation between useful votes and fans.
We chose 3 clusters for both analyses, based on the elbow method.

Conclusions

Popularity vs. Impact
Popularity on Yelp is defined as the number of fans a user has.
Impact refers to the influence a user's reviews have, as reflected by votes (cool, funny, useful).
The analysis shows that review count has a weak positive correlation with popularity (fans), but useful votes have a stronger relationship with fans, indicating that writing high-quality, helpful reviews is more likely to enhance a user's popularity and impact on the platform.
To maximize popularity and impact, a Yelp user should focus on writing reviews that are perceived as useful by others, rather than simply increasing the number of reviews written.
