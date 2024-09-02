# High Turnout Equals Democracy? A Statistical Analysis of Periodical Turkey Voting Data

## Overview

This project presents a systematic examination of electoral data from Turkey to identify potential anomalies and irregularities in voting outcomes. The study leverages multiple statistical methods, including Benford's Law, the Turnout-Vote Nexus, and the analysis of "Suspicious Numbers," to detect signs of electoral fraud. The analysis covers Turkey's elections from 2014 to 2023, with a focus on the controversial elections under the rule of President Recep Tayyip Erdoğan and his Justice and Development Party (AKP).

## Data

The dataset used in this project was compiled by Prof. Cantay Caliskan, a computational social scientist at the University of Rochester. It includes data from 11 major elections in Turkey, including presidential, general, and local elections. The dataset consists of 973 district-level observations, with variables such as the number of eligible voters, the number of valid and invalid votes, and detailed vote counts for various parties.

### Files and Data

- `Turkey_vote.xls`: the original dataset
- `Turkey_cleaned.csv`: cleaned dataset
- `Turkey Analysis.R`: processsing codes
- `Methodology.pdf`: abstract, methods and intentions
- `Democracy is turnout?.pdf`: report

### Key Variables

- **Eligible Voters**: Number of eligible voters in each district.
- **Actual Voters**: Number of voters who actually voted.
- **Valid Votes**: Number of valid votes cast.
- **Invalid Votes**: Number of invalid votes cast.
- **Vote Counts**: Detailed vote counts for each political party.

## Methodology

The project employs three primary methods to detect potential electoral fraud:

1. **Benford's Law Examination**: Analyzes the distribution of the first digits in the voting dataset. According to Benford's Law, the logarithm of the first digit in many real-life datasets follows a specific distribution. Deviations from this pattern may suggest the presence of fraudulent activities.

2. **Turnout-Vote Nexus Examination**: Investigates the correlation between turnout rates and the vote share of the ruling party (AKP or Erdoğan). A high correlation between these variables may indicate ballot stuffing or other forms of manipulation.

3. **Suspicious Number Examination**: Examines whether a significant number of districts report vote percentages for the ruling party that are multiples of five (e.g., 50%, 65%, 75%). This pattern can be an indicator of electoral fraud, as it suggests artificial rounding or tampering with the vote counts.

## Analysis and Findings

- **Benford's Law**: The dataset for the 2014 and 2018 presidential elections in Turkey fits well with Benford's Law, suggesting a lack of significant anomalies in the distribution of the first digits.

- **Turnout-Vote Nexus**: The correlation between turnout rates and vote shares for Erdoğan significantly increased from the 2014 to 2018 elections, indicating potential government intervention in the electoral process.

- **Suspicious Numbers**: The analysis found a notable presence of vote percentages that are exact multiples of five, raising concerns about the legitimacy of the reported results.

## Conclusion

The study raises significant concerns regarding the integrity of Turkey's electoral process, particularly in the 2018 presidential election. The findings suggest the need for further investigation into the mechanisms behind the detected anomalies and the extent of potential electoral fraud.

## Future Work

Future research could focus on:

1. **Mechanism and Causation**: Investigating the political and social mechanisms behind the detected anomalies.
2. **Quantitative Estimation**: Developing methods to quantify the extent of electoral fraud by estimating the proportion of dishonest vote counts.

## References

- Mebane, W.R. (2006). Election Forensics: Vote Counts and Benford’s Law.
- Klimek, P., Yegorov, Y., Hanel, R., & Thurner, S. (2012). Statistical Detection of Systematic Election Irregularities.
- Collier, P. (2009). Wars, Guns, and Votes: Democracy in Dangerous Places.

For a full list of references and detailed analysis, please refer to the accompanying PDF documents.
