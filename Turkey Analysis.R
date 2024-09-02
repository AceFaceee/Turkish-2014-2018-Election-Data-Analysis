library(ggplot2)

# Load the data
df <- Turkey_cleaned

# Calculate turnout rates
df$`2014_Turnout_Presidency` <- df$Voter_2014_Presidency / df$Eligible_2014_Presidency
df$`2018_Turnout_Presidency` <- df$Voter_2018_Presidency / df$Eligible_2018_Presidency

ggplot(df) +
  geom_histogram(aes(x=`2014_Turnout_Presidency`, y=..density.., fill="2014"), 
                 binwidth=0.01, alpha=0.2, position="identity") +
  geom_histogram(aes(x=`2018_Turnout_Presidency`, y=..density.., fill="2018"), 
                 binwidth=0.01, alpha=0.2, position="identity") +
  geom_density(aes(x=`2014_Turnout_Presidency`, y=..density.., color="2014"), 
               size=1) +
  geom_density(aes(x=`2018_Turnout_Presidency`, y=..density.., color="2018"), 
               size=1) +
  labs(title="Turnout Rate Distributions for 2014 and 2018 Turkey Presidential Elections",
       x="Turnout Rate Bins", 
       y="Density") +
  scale_fill_manual(name="Election Year", values=c("2014"="grey", "2018"="blue")) +
  scale_color_manual(name="Election Year", values=c("2014"="black", "2018"="blue")) +
  theme_minimal() +
  theme(legend.position="bottom", 
        legend.title.align=0.5)



df$`2014_Erdogan_Rate` <- df$Erdogan_2014_Presidency / df$Valid_2014_Presidency

df$`2018_Erdogan_Rate` <- df$Erdogan_2018_Presidency / df$Valid_2018_Presidency

ggplot(df) +
  geom_histogram(aes(x=`2014_Erdogan_Rate`, y=..density.., fill="2014 Presidential Election"), 
                 binwidth=0.01, alpha=0.5, position="identity") +
  geom_histogram(aes(x=`2018_Erdogan_Rate`, y=..density.., fill="2018 Presidential Election"), 
                 binwidth=0.01, alpha=0.5, position="identity") +
  geom_density(aes(x=`2014_Erdogan_Rate`, color="2014 Presidential Election"), 
               size=1) +
  geom_density(aes(x=`2018_Erdogan_Rate`, color="2018 Presidential Election"), 
               size=1) +
  scale_color_manual(name="Election Year", 
                     values=c("2014 Presidential Election"="black", "2018 Presidential Election"="blue"),
                     labels=c("2014 Presidential Election", "2018 Presidential Election")) +
  scale_fill_manual(name="Election Year", 
                    values=c("2014 Presidential Election"="grey", "2018 Presidential Election"="blue"),
                    labels=c("2014 Presidential Election", "2018 Presidential Election")) +
  labs(title="Erdogan's Vote Percentage Distribution Across Districts",
       x="Erdogan Vote Percentage", 
       y="Density") +
  theme_minimal() +
  theme(legend.position="bottom", 
        legend.title=element_blank(),
        legend.text=element_text(size=12)) +
  guides(color=guide_legend(override.aes=list(size=2)),
         fill=guide_legend(override.aes=list(alpha=0.5)))


df$`2014_Demirtas_Rate` <- df$Demirtas_2014_Presidency / df$Valid_2014_Presidency
df$`2018_Demirtas_Rate` <- df$Demirtas_2018_Presidency / df$Valid_2018_Presidency
ggplot(df) +
  geom_histogram(aes(x=`2014_Demirtas_Rate`, y=..density.., fill="2014 Presidential Election"), 
                 binwidth=0.01, alpha=0.5, position="identity") +
  geom_histogram(aes(x=`2018_Demirtas_Rate`, y=..density.., fill="2018 Presidential Election"), 
                 binwidth=0.01, alpha=0.5, position="identity") +
  geom_density(aes(x=`2014_Demirtas_Rate`, color="2014 Presidential Election"), 
               size=1) +
  geom_density(aes(x=`2018_Demirtas_Rate`, color="2018 Presidential Election"), 
               size=1) +
  scale_color_manual(name="Election Year", 
                     values=c("2014 Presidential Election"="black", "2018 Presidential Election"="blue"),
                     labels=c("2014 Presidential Election", "2018 Presidential Election")) +
  scale_fill_manual(name="Election Year", 
                    values=c("2014 Presidential Election"="grey", "2018 Presidential Election"="blue"),
                    labels=c("2014 Presidential Election", "2018 Presidential Election")) +
  labs(title="Demirtas's Vote Percentage Distribution Across Districts",
       x="Dermirtas Vote Percentage", 
       y="Density") +
  theme_minimal() +
  theme(legend.position="bottom", 
        legend.title=element_blank(),
        legend.text=element_text(size=12)) +
  guides(color=guide_legend(override.aes=list(size=2)),
         fill=guide_legend(override.aes=list(alpha=0.5)))

#Calculate logarithmic vote rate, and check the normality:
df$logvote_Erdogan_2014 <- log((df$Valid_2014_Presidency - df$Erdogan_2014_Presidency) / df$Erdogan_2014_Presidency)
df$logvote_Erdogan_2018 <- log((df$Valid_2018_Presidency - df$Erdogan_2018_Presidency) / df$Erdogan_2018_Presidency)

ggplot(df) +
  geom_histogram(aes(x=logvote_Erdogan_2014, y=..density.., fill="2014 Presidential Election"), 
                 binwidth=0.1, alpha=0.5, position="identity") +
  geom_histogram(aes(x=logvote_Erdogan_2018, y=..density.., fill="2018 Presidential Election"), 
                 binwidth=0.1, alpha=0.5, position="identity") +
  geom_density(aes(x=logvote_Erdogan_2014, color="2014 Presidential Election"), 
               size=1) +
  geom_density(aes(x=logvote_Erdogan_2018, color="2018 Presidential Election"), 
               size=1) +
  scale_fill_manual(name="Election Year", 
                    values=c("2014 Presidential Election"="grey", "2018 Presidential Election"="blue"),
                    labels=c("2014", "2018")) +
  scale_color_manual(name="Election Year", 
                     values=c("2014 Presidential Election"="black", "2018 Presidential Election"="blue"),
                     labels=c("2014", "2018")) +
  labs(title="Distribution of Logarithmic Vote Rate for Erdogan: 2014 vs 2018",
       x="Logarithmic Vote Rate for Erdogan", 
       y="Density") +
  theme_minimal() +
  theme(legend.position="bottom", 
        legend.title=element_blank(),
        legend.text=element_text(size=12)) +
  guides(color=guide_legend(override.aes=list(size=2)),
         fill=guide_legend(override.aes=list(alpha=0.5)))

library(ggplot2)
library(dplyr)
library(e1071)


skewness_2014 <- skewness(df$logvote_Erdogan_2014, na.rm = TRUE)
kurtosis_2014 <- kurtosis(df$logvote_Erdogan_2014, na.rm = TRUE)

skewness_2018 <- skewness(df$logvote_Erdogan_2018, na.rm = TRUE)
kurtosis_2018 <- kurtosis(df$logvote_Erdogan_2018, na.rm = TRUE)

num_observations <- nrow(df)

# Calculate average number of eligible voters for 2014 and 2018
average_eligible_2014 <- sum(df$Eligible_2014_Presidency, na.rm = TRUE) / num_observations
average_eligible_2018 <- sum(df$Eligible_2018_Presidency, na.rm = TRUE) / num_observations

# Print the results
cat("Number of Observations (Voting Units):", num_observations, "\n")
cat("Average Number of Eligible Voters in 2014:", average_eligible_2014, "\n")
cat("Average Number of Eligible Voters in 2018:", average_eligible_2018, "\n")
cat("Skewness for Erdogan's Logvote Rate in 2014:", skewness_2014, "\n")
cat("Kurtosis for Erdogan's Logvote Rate in 2014:", kurtosis_2014, "\n")
cat("Skewness for Erdogan's Logvote Rate in 2018:", skewness_2018, "\n")
cat("Kurtosis for Erdogan's Logvote Rate in 2018:", kurtosis_2018, "\n")

df$`2014_Turnout_Presidency_Percent` <- df$`2014_Turnout_Presidency` * 100
df$`Erdogan_rate_2014_Percent` <- df$`2014_Erdogan_Rate` * 100

# Create a 2D density plot for 2014
p1 <- ggplot(df, aes(x=`2014_Turnout_Presidency_Percent`, y=`Erdogan_rate_2014_Percent`)) +
  geom_bin2d(bins = 30) + # Adjust bin size as necessary
  scale_fill_gradient(low="blue", high="red") +
  labs(title="2014 Voter Turnout vs Erdogan Rate",
       x="Voter Turnout (%)",
       y="Votes for Erdogan (%)") +
  theme_minimal() 
print(p1)
# Repeat the process for 2018 data
df$`2018_Turnout_Presidency_Percent` <- df$`2018_Turnout_Presidency` * 100
df$`Erdogan_rate_2018_Percent` <- df$`2018_Erdogan_Rate` * 100

# Create a 2D density plot for 2018
p2 <- ggplot(df, aes(x=`2018_Turnout_Presidency_Percent`, y=`Erdogan_rate_2018_Percent`)) +
  geom_bin2d(bins = 30) + # Adjust bin size as necessary
  scale_fill_gradient(low="blue", high="red") +
  labs(title="2018 Voter Turnout vs Erdogan Rate",
       x="Voter Turnout (%)",
       y="Votes for Erdogan (%)") +
  theme_minimal() +
  scale_x_continuous(breaks=c(25, 50, 75, 100))

# Plot them

print(p2)


# Perform linear regression for 2014
regression_2014 <- lm(`2014_Erdogan_Rate` ~ `2014_Turnout_Presidency`, data=df)

# Summary of regression to get coefficients and standard errors for 2014
summary_2014 <- summary(regression_2014)
print(summary_2014)

# Perform linear regression for 2018
regression_2018 <- lm(`2018_Erdogan_Rate` ~ `2018_Turnout_Presidency`, data=df)

# Summary of regression to get coefficients and standard errors for 2018
summary_2018 <- summary(regression_2018)
print(summary_2018)

t_test_result <- t.test(df$`2014_Turnout_Presidency`, df$`2018_Turnout_Presidency`, paired = TRUE, alternative = 'less')

# Print the results
print(t_test_result)


mean_2014 <- mean(df$logvote_Erdogan_2014)
sd_2014 <- sd(df$logvote_Erdogan_2014)

# Sample mean and standard deviation for logvote_Erdogan_2018
mean_2018 <- mean(df$logvote_Erdogan_2018)
sd_2018 <- sd(df$logvote_Erdogan_2018)
mean_diff_2014 <- mean_2014 - 0
sd_diff_2014 <- sd_2014 - 1

mean_diff_2018 <- mean_2018 - 0
sd_diff_2018 <- sd_2018 - 1

# Use t-tests to check if means significantly differ from 0
t_test_2014 <- t.test(df$logvote_Erdogan_2014, mu = 0)
t_test_2018 <- t.test(df$logvote_Erdogan_2018, mu = 0)

# Results
mean_2014; sd_2014; mean_diff_2014; sd_diff_2014; t_test_2014
mean_2018; sd_2018; mean_diff_2018; sd_diff_2018; t_test_2018

library(benford.analysis)
library(ggplot2)
numeric_columns <- sapply(Turkey_cleaned, is.numeric)
data <- Turkey_cleaned[numeric_columns]
data <- data[data > 0]  # Ensure data is positive

# Extract the first digit of each number
first_digits <- floor(data / 10^(floor(log10(abs(data)))))
first_digit_freq <- table(first_digits) / length(first_digits)

# Expected Benford frequencies
digits <- 1:9
benford_freq <- log10(1 + 1/digits)

# Data frame for plotting
df <- data.frame(Digit = as.numeric(names(first_digit_freq)), 
                 Frequency = as.numeric(first_digit_freq), 
                 Benford = benford_freq)

# Plot
ggplot(df, aes(x = Digit)) +
  geom_bar(aes(y = Frequency, fill = "Observed"), stat = "identity") +
  geom_line(aes(y = Benford, group = 1, colour = "Benford"), size = 1) +
  scale_fill_manual(name = "", values = c("Observed" = "skyblue")) +
  scale_colour_manual(name = "", values = c("Benford" = "red")) +
  labs(y = "Frequency", title = "Benford's Law Analysis") +
  theme_minimal()
