---
layout: no_sidebar
title: Churn Project
---

<div style="text-align: right; margin-top: 10px;">
  <a href="https://joshht92.github.io/joshht92/" style="font-size: 0.95em; text-decoration: none; color: #0366d6;">← Back to Home</a>
</div>



<div style="text-align: center; margin-top: 40px; margin-bottom: 40px;">
  <h1>Which customers are worth Retaining?</h1>
  <p style="font-size: 1.2em; font-weight: 500;">
    A Machine Learning and Optimization Framework for Targeted Customer Retention
  </p>
  <p><strong>Joshua Thompson</strong><br>
  Date: 03/28/2025</p>
</div>


________________________________________
  
<div style="text-align: center; margin-top: 40px;">

  <h2 style="margin-bottom: 20px;">Table of Contents</h2>

  <ul style="list-style: none; padding-left: 0; display: inline-block; text-align: left;">
    <li><a href="#1-business-context">1. Business Context</a></li>
    <li><a href="#2-exploratory-data-analysis">2. Exploratory Data Analysis</a>
      <ul>
        <li><a href="#21-summary-statistics">2.1. Summary Statistics</a></li>
      </ul>
    </li>
    <li><a href="#3-customer-churn">3. Customer Churn</a>
      <ul>
        <li><a href="#31-machine-learning-model-for-churn-prediction">3.1. Machine Learning Model for Churn Prediction</a></li>
        <li><a href="#32-model-performance-evaluation">3.2. Model Performance Evaluation</a></li>
        <li><a href="#33-threshold-and-trade-off-analysis">3.3. Threshold and Trade-Off Analysis</a></li>
      </ul>
    </li>
    <li><a href="#4-customer-segmentation">4. Customer Segmentation</a>
      <ul>
        <li><a href="#41-determining-optimal-number-of-clusters">4.1. Determining Optimal Number of Clusters</a></li>
        <li><a href="#42-customer-segmentation-visualization">4.2. Customer Segmentation Visualization</a></li>
        <li><a href="#43-customer-segments--personas">4.3. Customer Segments & Personas</a></li>
      </ul>
    </li>
    <li><a href="#5-customer-retention">5. Customer Retention</a>
      <ul>
        <li><a href="#51-baseline-heuristic-approach">5.1. Baseline heuristic approach</a></li>
        <li><a href="#52-knapsack-optimization-strategy">5.2. Knapsack Optimization Strategy</a></li>
        <li><a href="#53-comparative-results">5.3. Comparative Results</a></li>
      </ul>
    </li>
    <li><a href="#6-recommendations--future-work">6. Recommendations & Future Work</a></li>
  </ul>

</div>


________________________________________

## 1. Business Context

The Telco-Customer-Churn dataset contains detailed records for over 7,000 customers of a telecommunications company. Each row represents a single customer, capturing both demographic and service-related attributes. Key fields include:

- **Demographics:** Basic information such as gender, senior citizen status, partner, and dependents.
- **Subscription Details:** Contract type (month-to-month, one-year, two-year), payment method, and paperless billing preferences.
- **Service Usage:** Internet service type (DSL, Fiber optic, None), phone and multiple line usage, and optional add-on services such as online security, online backup, device protection, streaming TV, and streaming movies.
- **Financials:** *MonthlyCharges* indicating how much a customer pays per month, and *TotalCharges* representing the cumulative amount paid throughout their tenure.
- **Churn Indicator:** A binary flag showing whether the customer has discontinued service.

In the telecommunications industry, customer churn is a major business challenge, especially for subscription-based models. Reducing churn directly impacts profitability by improving customer lifetime value (LTV), increasing marketing efficiency, and reinforcing brand loyalty. Even small improvements in churn rates can lead to significant financial gains.

This analysis is set in the context of a highly competitive market with constrained retention resources such as loyalty incentives and discounts. As such, the business requires a data-driven approach to optimize who to target for retention, given a limited budget.

**Business Objectives:**

1. Predict which customers are most likely to churn.
2. Segment customer groups based on behavior and churn risk.
3. Prioritize customers for retention under budget constraints.
4. Maximize the expected net profit from retained customers.

To address these challenges, I conducted a comprehensive churn analysis and designed an optimized retention strategy. By combining machine learning with budget-constrained optimization, this solution not only predicts churn but also determines which customers to retain to maximize profitability. This framework ensures that retention efforts are focused on high-value, high-risk customers, preserving revenue while avoiding unnecessary spending.

________________________________________

## 2. Exploratory Data Analysis

### 2.1. Summary Statistics
<div style="float: left; margin: 0 20px 20px 0; width: 300px;">
  <img src="images/Churn_Project/Picture2.png?raw=true" alt="Churn Status" style="width: 100%;" />
</div>

I began with looking at the distribution of churn status among customers in the dataset. Approximately 26.5% of customers have churned while 73.5% have remained loyal.

The churn rate is relatively high at 26.5%, signaling a significant portion of customers who have stopped using the service for various reasons.

This level of churn could have substantial implications on revenue and customer lifetime value (CLV). Thus, highlighting the importance of implementing targeted retention strategies.

<div style="clear: both;"></div>
________________________________________
<div style="text-align: center;">
  <img src="images/Churn_Project/Picture3.png?raw=true" alt="Customer Tenure, Charges" />
</div>

**Customer Tenure:**  
Indicating two main groups — short-term churners and long-term loyal customers, with fewer medium-tenure customers.

**Monthly Charges:**  
Right-skewed, with most customers paying between $20–$50, but a significant portion paying higher amounts, reflecting diverse pricing tiers.

**Total Charges:**  
Highly skewed due to the interaction between tenure and monthly charges. Higher total charges are associated with long-tenured, high-value customers.

After exploring the key patterns in customer behavior, I wanted to dive deeper into understanding the drivers of churn. This led me to develop a predictive churn model and, more importantly, design an optimized retention strategy to help the business effectively prioritize which customers are worth retaining.

________________________________________

## 3. Customer Churn Analysis

### 3.1. Machine Learning Model for Churn Prediction

| Model                | Accuracy | Recall | Precision | F1-Score | AUC   |
|----------------------|----------|--------|-----------|----------|-------|
| Logistic Regression  | 0.739    | 0.805  | 0.505     | 0.620    | 0.843 |
| Naïve Bayes          | 0.687    | 0.857  | 0.453     | 0.592    | 0.819 |
| CART                 | 0.686    | 0.836  | 0.458     | 0.587    | 0.797 |

During my churn analysis, I compared different machine learning model results and among the three models, logistic regression achieved the best overall performance, offering a strong balance of recall, precision, and AUC. While Naïve Bayes excelled in recall, it suffered from low precision. CART, despite being highly interpretable, underperformed in both classification and ranking power.

________________________________________

<div style="text-align: center;">
  <img src="images/Churn_Project/Picture4.png?raw=true" alt="Customer Tenure, Charges" style="max-width: 100%;" />
  <p style="margin-top: 5px; font-style: italic;">Figure 3.1 This plot visualizes the average effect of each feature on churn probability, as learned by the logistic regression model.
</p>
</div>


**Insight** | **Description**
--- | ---
**Long-Term Contracts Reduce Churn** | Customers with 1-year and especially 2-year contracts are significantly less likely to churn, confirming the effectiveness of contract-based retention.
**Fiber Optic Internet Increases Churn** | Customers subscribed to fiber optic internet show the highest churn risk. This group may require targeted interventions such as service quality improvements or loyalty incentives.
**Engagement with Support Services Lowers Churn** | Usage of technical support, online security, and phone services are associated with lower churn, suggesting that engaged customers who use multiple services tend to stay longer.
**Streaming Services & Paperless Billing Increase Churn Slightly** | Customers who use streaming services or have paperless billing show a modestly higher churn risk. These customers may be more digitally aware and willing to switch providers.
**High Customer Lifetime Value (CLV) Segments are More Loyal** | Customers classified into medium and high-value CLV bins show a lower likelihood of churn, making them prime candidates for retention efforts.

By producing actionable churn probabilities, this model enables the business to proactively reduce churn and improve Customer Lifetime Value (CLV) by targeting high-risk customers with tailored retention strategies.

________________________________________

### 3.2. Model Performance Evaluation

<div style="text-align: center;">
  <img src="images/Churn_Project/Picture5.png?raw=true" alt="Customer Tenure, Charges" style="max-width: 100%;" />
  <p style="margin-top: 5px; font-style: italic;">Figure 3.2 shows the confusion matrix of the logistic regression model.</p>
</div>



**Confusion Matrix**  
This plot represents the aggregate confusion matrix resulting from the Logistic Regression classifier evaluated across all folds of cross-validation.

**Key Insights:**

- The model correctly identified 1,504 customers who actually churned (True Positives).
- It also correctly identified 3,701 customers who did not churn (True Negatives).
- However, there were 1,473 false positives (non-churners predicted as churners).
- There were 365 false negatives (actual churners who were missed by the model).

**Business Implication:**

- While the model successfully captures a significant number of actual churners, there is a noticeable number of false positives. This means some retention resources may be allocated to customers who were unlikely to churn.
- The relatively low number of false negatives is encouraging, as fewer actual churners are being missed.

In customer retention contexts, this trade-off may be acceptable if the cost of offering retention incentives is lower than the cost of losing customers.

However, a single confusion matrix reflects only one threshold setting. To optimize retention strategies, we need to see how performance changes as we adjust that threshold.

________________________________________

### 3.3. Threshold and Trade-Off Analysis
<div style="float: right; margin: 0 20px 20px 0; width: 400px;">
  <img src="images/Churn_Project/Picture6.png?raw=true" alt="Churn Status" style="width: 100%; max-width: 100%;" />
</div>


Here are some results from the tradeoffs considered when selecting a reasonable classification threshold value.

**F1-Score vs. Threshold Analysis**

This chart shows how well our churn prediction model performs as we adjust the threshold — the point where we classify a customer as an actual churner.  
The key takeaway here is how to set the threshold to best identify churners without generating too many false alarms:


This pattern suggests that the model tends to assign low probabilities even to customers who are actually at risk of churning. Therefore, to maximize effectiveness, we need to adopt a lower threshold to ensure we capture most potential churners early.
<div style="clear: both;"></div>
________________________________________

**Balancing Precision and Recall**
<div style="float: left; margin: 0 20px 20px 0; width: 400px;">
  <img src="images/Churn_Project/Picture7.png?raw=true" alt="Churn Status" style="width: 100%; max-width: 100%;" />
</div>

This chart illustrates how our model balances the True Positive Rate (TPR, or recall — how many churners we successfully detect) and the False Positive Rate (FPR — how often we incorrectly predict churn for non-churners) as we adjust the classification threshold.

The trade-off visualized here is critical for churn prediction:

- A higher TPR means we successfully identify more actual churners.
- A lower FPR ensures we minimize false alarms and focus retention efforts on truly at-risk customers.

The goal is to select a threshold that balances these two objectives — catching as many churners as possible while avoiding excessive false positives.

Choosing the right balance improves the efficiency of retention campaigns, allowing us to prioritize customers who are genuinely at risk. Based on this trade-off, I proceeded to select an optimal threshold that best aligns with business objectives.
<div style="clear: both;"></div>
________________________________________

**Final Threshold Selection and Model Performance**

After analyzing the trade-offs, I selected a threshold of 0.25 as the optimal cut-off for identifying churners. This choice balances business priorities with model performance, while being informed by the ROC Curve which achieved an AUC of 0.866 — indicating the model has strong discriminatory power.

**Why this threshold?**

- **High Recall (0.805):**  
  Our main objective is to capture as many potential churners as possible. Since retention interventions are typically less costly than the revenue lost from churn, it's worth identifying a large portion of at-risk customers — even if it means including some who might not churn.
- **Acceptable Precision (0.505):**  
  While not perfect, this precision level is acceptable given business needs. The retention team can manage a moderate number of false positives, especially since proactive engagement with these customers can still strengthen loyalty or even open up up-selling opportunities. In many cases, the cost of engaging non-churners is outweighed by the value of preventing churn or increasing CLV.
- **Balanced F1-Score (0.620):**  
  This F1-Score shows that the model strikes a practical balance — identifying enough churners (high recall) without overwhelming retention teams with too many false alarms.

In business terms, using this threshold ensures we detect about 81% of real churners, giving the company a strong opportunity to engage and retain them, even if it occasionally involves interacting with customers who might not have churned. Since missed churners cost far more than a few false alarms, we value recall most.

Having established churn risk, we now turn to understanding which types of customers exhibit these risks.

________________________________________

## 4. Customer Segmentation

The next step was to segment customers into distinct groups based on shared behavioral patterns, allowing the business to tailor retention strategies more effectively. To ensure the segmentation was objective and data driven, I used the Elbow Method to determine the optimal number of customer groups.

### 4.1. Determining Optimal Number of Clusters (Elbow Method)
<div style="float: left; margin: 0 20px 20px 0; width: 300px;">
  <img src="images/Churn_Project/Picture8.png?raw=true" alt="Churn Status" style="width: 100%;" />
</div>

**Choosing the Optimal Number of Clusters (K):**

To determine the ideal number of customer segments, I applied the Elbow Method. This technique shows a sharp bend at **K = 3**, suggesting that three clusters offer a good balance between compression and complexity. Therefore, I selected **K = 3** for the number of segmentations.
<div style="clear: both;"></div>
________________________________________

### 4.2. Customer Segmentation Visualization (PCA)
<div style="text-align: center;">
  <img src="images/Churn_Project/Picture9.png?raw=true" alt="Customer Tenure, Charges" style="width: 80%; max-width: 600px;" />
</div>


To uncover patterns in customer behavior, I performed K-means clustering using a variety of customer attributes such as contract type, tenure, monthly charges, and usage patterns. The objective was to group customers with similar characteristics into distinct, actionable segments.

Using Principal Component Analysis (PCA) for dimensionality reduction, I visualize the three customer segments. Each point in the scatter plot represents a customer, colored by their cluster assignment.

In the next step, I analyzed these clusters in detail to understand their defining characteristics and identify actionable customer personas.

________________________________________

### 4.3. Customer Segments & Personas

<div style="float: left; margin: 0 20px 20px 0; width: 300px;">
  <img src="images/Churn_Project/Picture10.png?raw=true" alt="Churn Status" style="width: 100%;" />
</div>
A summary of customer behavioral & demographic insights used to better understand each segment:

<div style="margin-bottom: 20px;">
  <p style="margin-bottom: 4px;"><strong>Cluster 1 (High) – 85% likelihood of churn</strong></p>
  <ul style="margin-top: 0;">
    <li>Mostly month-to-month contracts (94%)</li>
    <li>Low tenure and low autopay use</li>
    <li>Heavy use of fiber internet, limited support services</li>
  </ul>
</div>

<div style="margin-bottom: 20px;">
  <p style="margin-bottom: 4px;"><strong>Cluster 2 (Loyal) – 0% likelihood of churn</strong></p>
  <ul style="margin-top: 0;">
    <li>Long-tenured customers</li>
    <li>Low monthly charges and strong service adoption </li>
    <li>High percentage have phone service</li>
  </ul>
</div>

<div style="margin-bottom: 20px;">
  <p style="margin-bottom: 4px;"><strong>Cluster 3 (Moderate) – 13% likelihood of churn</strong></p>
  <ul style="margin-top: 0;">
    <li>Highest revenue customers</li>
    <li>Long tenure, high overall service use </li>
  </ul>
</div>

<div style="clear: both;"></div>

Equipped with customer personas and churn probabilities, I next focused on designing a data-driven retention strategy. The following analysis compares two approaches to deciding which customers should be targeted under realistic budget constraints.

________________________________________

## 5. Customer Retention

This analysis evaluates two approaches for selecting customers for retention initiatives:

1. A Rule-Based Decision Model without budget constraints.
2. A Budget-Constrained Knapsack Optimization Model.

The goal is to maximize net profit from retention actions while considering practical budget limitations.

________________________________________

**Assumptions:**

| Parameter           | Value | Description                                          |
|---------------------|-------|------------------------------------------------------|
| Average Gross Profit| 40%   | Gross profit margin on retained customers            |
| Retention Discount  | 15%   | The discount applied as part of retention offers     |
| Marketing Cost      | $5    | Average marketing cost per customer targeted         |
| Cost of Service     | 40%   | Service delivery cost as a percentage of CLV         |
| Acceptance Rate     | 40%   | Percentage of targeted customers expected to accept the retention offer |

**Financial Formulas Used:**

- Expected Net Benefit = (CLV − Service Cost) × Churn Propensity × Acceptance Rate − Retention Cost  
- Expected Gross Benefit = (CLV − Service Cost) × Churn Propensity × Acceptance Rate  
- Retention Cost = (CLV × Retention Discount %) + Marketing Cost  
- Service Cost = CLV × Cost of Service %

________________________________________

### 5.1. Baseline Heuristic Approach

**Approach 1 — Baseline heuristic approach (without budget constraint):**

This approach targets all customers if their expected benefit exceeds their retention cost, without considering budget limitations.

**Metric** | **Value**
--- | ---
Total Customers | 7,032
Identified for Retention | 2,620
Total Expected Benefit | $887,798
Retention Cost | $632,057
Total Expected Profit | $255,741

This approach provides a quick and intuitive way to select customers but assumes that the business has no budget constraints, which may not reflect operational realities.

________________________________________

### 5.2. Knapsack Optimization Strategy

**Approach 2 — Knapsack Optimization:**  
This approach solves a binary knapsack optimization problem to select the subset of customers that maximizes expected net profit while adhering to a fixed retention budget.

#### Scenario 1: Full Optimization (No segmentation)

| Metric                   | Value       |
|--------------------------|-------------|
| Retention Budget         | $250,000    |
| Identified for Retention | 775 customers |
| Total Expected Benefit   | $387,769    |
| Retention Cost           | $250,000    |
| Total Expected Profit    | $137,769    |

#### Scenario 2: Cluster-Based Budget Allocation (Includes customers’ likelihood of churn segments)

In this scenario, the $250,000 budget is distributed across customer segments with 70% of the budget allocated to segment 1 (high risk of churn customers) and 30% to segment 3 (moderate risk but high value customers).

| Metric                        | Value       |
|-------------------------------|-------------|
| Retention Budget              | $250,000    |
| Retention Target — Cluster 1  | 487 customers |
| Retention Target — Cluster 3  | 106 customers |
| Total Expected Benefit        | $372,468    |
| Retention Cost                | $250,000    |
| Total Expected Profit         | $122,468    |

By splitting the budget across clusters, the model sacrifices ~11% of potential net profit but achieves additional strategic objectives such as maintaining market share among moderate-risk customers.

________________________________________

### 5.3. Comparative Results

**Retention Funnel:**

<div style="float: right; margin: 0 20px 20px 0; width: 500px;">
  <img src="images/Churn_Project/Picture11.png?raw=true" alt="Retention Funnel" style="width: 100%; max-width: 100%;" />
</div>

- Starting with 7,032 total customers, the churn model first identifies 2,620 customers as likely churners based on predicted probabilities and expected benefits (heuristic approach).
- Applying the final Knapsack (Scenario 2), only 593 customers are selected as the optimal retention targets from 2 segments. These are the customers who provide a balance of high net expected profit and maintain market share, while staying within budget.
<div style="clear: both;"></div>

This highlights the importance of not only predicting churn but also strategically selecting which customers to retain given limited resources. The next section summarizes the key insights and actionable recommendations derived from this analysis.


## 6. Final Summary and Recommendations

This project successfully combines machine learning and optimization techniques to develop a targeted and cost-effective customer retention strategy. By integrating churn prediction with a budget-constrained selection framework, the solution addresses not only the challenge of identifying at-risk customers but also the crucial question of which customers are worth retaining under real-world financial constraints.

________________________________________

**Key Takeaways:**

- The Logistic Regression churn model produced actionable churn probabilities with strong recall, ensuring that most actual churners are successfully captured.
- The customer segmentation revealed distinct behavioral patterns, enabling the design of tailored retention strategies across different customer groups.
- The Rule-Based approach, while effective for initial scoping and exploratory analysis, fails to account for budget limitations and can lead to inefficient resource allocation.
- The Knapsack Optimization framework balances profitability and budget constraints, achieving approximately 54% higher profit per dollar spent compared to the Rule-Based model by focusing on high-value, high-risk customers.

________________________________________

**Recommendation:**

Based on the findings, I recommend that the business adopt a data-driven customer retention strategy, combining machine learning for churn prediction with an optimization-based retention framework.

This approach:
- Maximizes net expected profit, preventing unnecessary spending on low-return or loyal customers.
- Focuses retention efforts on strategically important, high-risk, and high-value customers.
- Provides flexibility to adapt to dynamic budget scenarios and changing business conditions.

Overall, Knapsack Optimization aligns financial objectives with operational capabilities, making it a scalable and sustainable strategy to improve customer lifetime value and reduce churn-related revenue loss.

________________________________________

**Future Considerations:**

1. **Personalized Retention Offers:**  
   Move beyond generic discounts by tailoring incentives according to cluster characteristics or individual churn probabilities.
2. **Model Monitoring and Updates:**  
   Regularly update churn models and optimization inputs (e.g., acceptance rates, cost structures) to reflect evolving customer behavior.
3. **CLV Segmentation Integration:**  
   Incorporate predicted Customer Lifetime Value (CLV) into the optimization process to better prioritize customers with the greatest long-term revenue potential.

By embedding this data-driven approach into the organization’s retention strategy, the business can achieve sustainable profitability while strengthening customer relationships and brand loyalty.


