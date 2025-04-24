---
layout: no_sidebar
title: Dynamic Pricing
---

<div style="text-align: right; margin-top: 10px;">
  <a href="https://joshht92.github.io/joshht92/" style="font-size: 0.95em; text-decoration: none; color: #0366d6;">← Back to Home</a>
</div>



<div style="text-align: center; margin-top: 40px; margin-bottom: 40px;">
  <h1>Dynamic Pricing Optimization for Rideshare Platforms</h1>
  <p style="font-size: 1.2em; font-weight: 500;">
    Behavioral Modeling, Machine Learning, and Revenue Optimization
  </p>
  <p><strong>Joshua Thompson</strong><br>
  Date: In progress</p>
</div>

<hr style="margin: 40px 0;">

<div style="max-width: 900px; margin: 0 auto; font-size: 1em; line-height: 1.7;">

  <p>
    This project simulates a dynamic pricing system for rideshare platforms aimed at maximizing revenue while accounting for rider behavior and contextual ride conditions. Traditional surge pricing methods often rely on fixed thresholds based on supply and demand ratios, but these approaches fail to capture the nuance of individual rider preferences, loyalty status, location context, and time-based demand patterns.
  </p>

  <p>
    To address this, I developed a data-driven framework that integrates behavioral modeling, probabilistic simulation, machine learning, and optimization techniques to recommend personalized surge multipliers in real time. While currently based on simulated acceptance data, the framework is designed for future integration with real-world user feedback and deployment at scale.
  </p>

  <h2 style="margin-top: 40px;">Business Objectives</h2>
  <ul>
    <li>Replace static surge rules with individualized pricing recommendations based on contextual and behavioral features.</li>
    <li>Model customer acceptance probability using rule-based scoring and stochastic simulation to reflect real-world variability.</li>
    <li>Identify optimal surge multipliers that balance increased prices with acceptance likelihood to maximize expected revenue.</li>
    <li>Build a modular, scalable pricing system that can evolve with live behavioral data and support real-time deployment.</li>
  </ul>

  <h2 style="margin-top: 40px;">Methodology Highlights</h2>
  <ul>
    <li>Developed a probabilistic rider acceptance model using custom scoring and binomial sampling.</li>
    <li>Trained a logistic regression model to predict rider acceptance based on contextual ride attributes.</li>
    <li>Calculated expected revenue using price sensitivity adjustments with exponential decay functions.</li>
    <li>Optimized surge multipliers per ride to maximize expected revenue, achieving a simulated 15.9% uplift over rule-based pricing.</li>
  </ul>

  <h2 style="margin-top: 40px;">Skills and Tools Demonstrated</h2>
  <ul>
    <li>Python for end-to-end pipeline development and simulation</li>
    <li>Machine learning (Logistic Regression, feature engineering, model evaluation)</li>
    <li>Probabilistic modeling and customer behavior simulation</li>
    <li>Revenue optimization and pricing strategy</li>
    <li>Data visualization and performance analysis</li>
  </ul>

  <p style="margin-top: 40px;">
    This framework demonstrates the potential for a personalized, real-time pricing engine that adapts to changing market conditions and rider behavior. It offers a more intelligent alternative to static surge strategies and lays the foundation for scalable monetization in high-volume, on-demand platforms.
  </p>
</div>


