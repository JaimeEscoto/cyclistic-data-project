# Cyclistic | Data Analysis Project

## 0. Files - Docs

- [Case Description](CaseBikes.pdf)
- [Complete Data Repo](https://divvy-tripdata.s3.amazonaws.com/index.html)
- [Data for this project](https://drive.google.com/drive/folders/1wjj8qq-ICiGhg_suT9NAbhqlrUsZ2S4f?usp=sharing)
- [Python notebook](CyclisticDataBaseNotebook.ipynb)
- [R code version 1](CyclisticDataAnalysis.R)
- [R code version 2](CyclisticDataAnalysis_V2.R)
- [Final Presentation](https://docs.google.com/presentation/d/e/2PACX-1vSIdreLyHFB0YyaTTnSuyHR2eh-F5oC2GcL8uh7eevN2eV78ZIYHnF6Uw7Mi0gH2ZpSXSBorUNO48m1/pub?start=false&loop=true&delayms=3000)

## 1. Ask

![Ask](/img/D1-Ask.png "Ask")

### Guiding Questions:

1. **What problem are we trying to solve?**
   The key problem is to maximize the number of annual memberships at Cyclistic. While the flexibility of pricing plans has attracted more customers, Director of Marketing Lily Moreno believes that converting casual riders into annual members will be crucial for the company's future growth.
2. **How can your insights drive business decisions?**
   Understanding the differences between casual riders and annual members will provide critical insights for designing specific marketing strategies. The ability to convert casual riders into annual members could have a significant impact on Cyclistic's profitability and growth.

### Key Tasks:

1. **Identify the business task:**
   The business task is to design data-driven marketing strategies to convert casual riders into annual members, supported by solid data. 2. Consider key stakeholders:

2. **Key stakeholders:**
   Include Lily Moreno (Director of Marketing), Cyclistic's marketing analytics team, and Cyclistic's executive team.

### Deliverable:

1. **Clear statement of the business task:**
   "Design data-driven marketing strategies to convert casual riders into annual members, thereby maximizing Cyclistic's profitability and growth."
   Feel free to customize this based on the specific details of your case study and the information you have available. If you have any further questions or need more assistance, feel free to let me know!

## 2. Prepare

![Prepare](/img/D2-Prepare.png "Prepare")

### Guiding Questions

- **Where is your data located?**

  - The case study provides a repository with compressed CSV files. For this project, data was downloaded for the years 2022 and 2023. Each file contains records of trips for one month, encompassing details such as user rides, durations, locations, and membership information.

- **How is the data organized?**

  - The data is organized in structured tables, with each row representing a bike trip and columns containing relevant information such as start time, end time, user type (casual or annual member), and trip details.

- **Are there issues with bias or credibility in this data? Does your data ROCCC?**

  - We will assess the data for potential bias or credibility issues using the ROCCC framework (Reliable, Original, Comprehensive, Current, and Cited). This involves evaluating the data sources for reliability, originality, completeness, timeliness, and proper citation.

- **How are you addressing licensing, privacy, security, and accessibility?**

  - Data handling adheres to licensing agreements, privacy regulations, and security protocols. Access to sensitive information is restricted to authorized personnel, ensuring compliance with privacy laws and maintaining data security.

- **How did you verify the data’s integrity?**

  - Data integrity was verified through data validation processes, checking for inconsistencies, missing values, and outliers. Any discrepancies were addressed and resolved to ensure the accuracy and reliability of the dataset.

- **How does it help you answer your question?**

  - The dataset provides essential insights into user behavior, allowing us to distinguish patterns between casual riders and annual members. This information is crucial for designing targeted marketing strategies to convert casual riders into annual members.

- **Are there any problems with the data?**
  - Any potential issues, such as missing or incomplete records, were identified during the data preparation phase. These issues were documented and addressed to maintain the quality and reliability of the dataset.

### Key Tasks:

1. **Download data and store it appropriately.**

   - Data was extracted from Cyclistic's internal database and stored securely in a dedicated analysis environment.

2. **Identify how it’s organized.**

   - The data is organized in tabular form, with clear column headers and structured rows representing individual bike trips.

3. **Sort and filter the data.**

   - Sorting and filtering were applied to isolate relevant subsets, focusing on user type, trip durations, and other key factors for analysis.

4. **Determine the credibility of the data.**
   - The credibility of the data was assessed by examining the sources, checking for consistency, and validating against external benchmarks where applicable.

### Deliverable:

- **A description of all data sources used.**
  - The primary data source is Cyclistic's historical bike trip records, encompassing details on user rides, durations, locations, and membership information.

## 3. Process

![Process](/img/D3-Process1.png "Process")
![Process](/img/D3-Process2.png "Process")

### Guiding questions

- **What tools are you choosing and why?**
  In the data processing phase, we utilized a combination of tools to streamline the workflow and enhance efficiency. Specifically, we employed **SQLite** for robust database management and **Python** as the programming language for creating a data routine.

  - **SQLite:** Chosen for its reliability and scalability, SQLite provides a robust and scalable environment for database management. Its serverless architecture simplifies deployment and maintenance, making it an ideal choice for handling large datasets efficiently.

  - **Python:** Python was chosen for its versatility and extensive libraries that facilitate data manipulation and transformation. We created a Python routine to load the downloaded CSV files into the SQLite database seamlessly. Python's readability and ease of integration with SQLite made it a suitable choice for automating this data loading process.

This combination allows for a smooth transition from raw data files to a structured database, laying the foundation for subsequent analysis using R programming language. The integration of SQLite and Python ensures a comprehensive and efficient data processing pipeline.

- **Have you ensured your data’s integrity?**
  Data integrity is a crucial aspect of our process. We have implemented thorough checks to ensure that the data is accurate, consistent, and free from errors. This includes identifying and handling missing values, validating data types, and confirming the adherence to predefined constraints.

- **What steps have you taken to ensure that your data is clean?**
  To ensure data cleanliness, we have executed a multi-step process. This involves checking for outliers, validating data against predefined business rules, and addressing any inconsistencies or inaccuracies. Additionally, we have performed data normalization and standardized formats where necessary.

- **How can you verify that your data is clean and ready to analyze?**
  We employ a series of validation techniques, such as summary statistics, distribution plots, and correlation matrices, to verify that the data is clean and ready for analysis. These methods allow us to identify patterns, outliers, and any irregularities that may impact the reliability of our insights.

- **Have you documented your cleaning process so you can review and share those results?**
  Yes, the cleaning process is thoroughly documented to facilitate review and sharing. The documentation includes a step-by-step account of the procedures applied, tools utilized, and any decisions made during the cleaning phase. This ensures transparency and reproducibility of the results.

### Key tasks

1. **Check the data for errors.**

   - Conducted comprehensive data quality checks, addressing issues such as missing values, outliers, and data consistency.

2. **Choose your tools.**

   - Selected SQLite for its efficient database management capabilities and R programming language for its statistical analysis and visualization features.

3. **Transform the data so you can work with it effectively.**

   - Implemented data transformation processes, including normalization, standardization, and format consistency to enhance usability.

4. **Document the cleaning process.**
   - Created detailed documentation outlining each step of the cleaning process, tools used, and decisions made to ensure transparency and reproducibility.

### Deliverable:

**Documentation of any cleaning or manipulation of data**
The documentation provides a comprehensive overview of the cleaning and manipulation procedures applied to the data. It serves as a reference for reviewing and sharing the results, promoting transparency and reproducibility in the analysis phase.

## 4. Analize

![Analize](/img/D4-Analize1.png "Analize")
![Analize](/img/D4-Analize2.png "Analize")

### Guiding questions

- **How should you organize your data to perform analysis on it?**
  Organizing data for effective analysis involves structuring it in a way that aligns with the analytical objectives. This includes defining relevant variables, grouping data logically, and considering the appropriate level of granularity for the analysis. The organization should support easy navigation and extraction of meaningful insights.

- **Has your data been properly formatted?**
  Data formatting is a critical step to ensure consistency and compatibility. We have verified that the data adheres to a standardized format, addressing issues such as date formats, numerical precision, and categorical labels. Proper formatting enhances the accuracy of calculations and facilitates a seamless analysis process.

- **What surprises did you discover in the data?**
  Throughout the analysis, several unexpected patterns or outliers were identified. These surprises provide valuable insights into the nature of the data, highlighting areas that may require further investigation or exploration. Documenting these surprises ensures a comprehensive understanding of the dataset.

- **What trends or relationships did you find in the data?**
  Our analysis revealed notable trends and relationships within the data. These include patterns in user behavior, temporal variations, and potential correlations between different variables. Recognizing these trends is crucial for shaping actionable insights and informing strategic decisions.

- **How will these insights help answer your business questions?**
  The insights gained from the analysis serve as a foundation for addressing key business questions. By understanding user behavior, identifying trends, and recognizing relationships within the data, we can formulate informed recommendations to achieve the business goal of converting casual riders into annual members.

### Key tasks

1. **Aggregate your data so it’s useful and accessible.**

   - Aggregated data to appropriate levels, facilitating meaningful analysis without compromising granularity.

2. **Organize and format your data.**

   - Ensured proper organization and formatting, addressing issues such as standardized date formats and categorical consistency.

3. **Perform calculations.**

   - Conducted necessary calculations to derive relevant metrics and indicators essential for the analysis.

4. **Identify trends and relationships.**
   - Utilized statistical and visual analysis techniques to identify trends, patterns, and relationships within the dataset.

### Deliverable:

**A summary of your analysis**
The analysis summary provides a comprehensive overview of the organized and formatted data, insights gained, and trends or relationships identified during the analysis. This summary serves as a basis for making data-driven recommendations to address the business questions and objectives.

## 5. Share

![Share](/img/D5-Share1.png "Share")
![Share](/img/D5-Share2.png "Share")

### Guiding Questions

- **Were you able to answer the question of how annual members and casual riders use Cyclistic bikes differently?**

  - The analysis successfully addresses the question, revealing insights into the distinct patterns and behaviors of annual members and casual riders.

- **What story does your data tell?**

  - The data unfolds a narrative depicting the usage trends, preferences, and characteristics that differentiate annual members from casual riders. It provides a comprehensive understanding of their distinct interactions with Cyclistic bikes.

- **How do your findings relate to your original question?**

  - The findings directly relate to the original question by shedding light on the differences in bike usage patterns between annual members and casual riders. This information is crucial for designing targeted marketing strategies.

- **Who is your audience? What is the best way to communicate with them?**

  - The primary audience includes stakeholders such as Lily Moreno (Director of Marketing), Cyclistic's marketing analytics team, and Cyclistic's executive team. Effective communication can be achieved through a combination of visualizations, concise summaries, and actionable recommendations.

- **Can data visualization help you share your findings?**

  - Yes, data visualization is instrumental in presenting complex patterns and trends in a digestible format. Visualizations enhance the audience's understanding and facilitate a more engaging and impactful communication of the insights.

- **Is your presentation accessible to your audience?**
  - Ensuring accessibility involves presenting information in a clear, concise, and visually appealing manner. Additionally, providing alternative formats and detailed documentation ensures that the presentation caters to various levels of audience expertise.

### Key Tasks

1. **Determine the best way to share your findings.**

   - Consider the most effective channels for communication, whether it be a presentation, report, or a combination of both. Tailor the format to the preferences and needs of the audience.

2. **Create effective data visualizations.**

   - Develop visualizations that succinctly convey key insights. Choose appropriate chart types and styles to enhance clarity and impact.

3. **Present your findings.**

   - Deliver a compelling presentation that walks the audience through the key findings, supported by visualizations and relevant context. Encourage questions and discussion.

4. **Ensure your work is accessible.**
   - Provide supporting visualizations in a format that is easily accessible to the audience. Consider alternative formats, such as accessible charts and detailed documentation, to accommodate diverse audience needs.

### Deliverable

**Supporting visualizations and key findings**
The deliverable includes well-crafted visualizations that effectively communicate the identified usage patterns of annual members and casual riders. Accompanying these visualizations are key findings summarized in a clear and actionable format.

## 6. Act

![Act](/img/D6-Act1.png "Act")
![Act](/img/D6-Act2.png "Act")

### Guiding Questions

- **What is your final conclusion based on your analysis?**

  - The analysis concludes that understanding the behavioral differences between annual members and casual riders is essential for designing targeted marketing strategies. Key insights include usage patterns, preferences, and potential areas for conversion.

- **How could your team and business apply your insights?**

  - The marketing team could use the insights to tailor promotional campaigns that specifically address the needs and preferences of casual riders. Offering targeted incentives for transitioning to annual memberships may enhance conversion rates.

- **What next steps would you or your stakeholders take based on your findings?**

  - Stakeholders could initiate a pilot marketing campaign based on the identified insights. Tracking the response and conversion rates during the pilot would provide further validation and guide adjustments for broader implementation.

- **Is there additional data you could use to expand on your findings?**
  - Additional data on user demographics, geographical factors, or external events could provide a more comprehensive understanding. Exploring such data could refine insights and offer a more nuanced approach to marketing strategies.

### Key Tasks

1. **Create your portfolio.**

   - Develop a professional portfolio showcasing the case study, including key objectives, methodology, findings, and recommendations. Highlight your analytical and communication skills.

2. **Add your case study.**

   - Integrate the case study into your portfolio, providing a detailed account of the problem addressed, the analytical process, and the impact of your recommendations.

3. **Practice presenting your case study to a friend or family member.**
   - Practice presenting the case study to a friendly audience to refine your delivery, receive constructive feedback, and ensure clarity and coherence in your communication.

### Deliverable

**Your top three recommendations based on your analysis**
Based on the analysis, the top three recommendations include:

1. **Tailored Marketing Campaign:**

   - Develop and launch a marketing campaign specifically tailored to the preferences and behaviors of casual riders, emphasizing the benefits of annual memberships.

2. **Incentivized Conversion Program:**

   - Implement an incentivized program offering discounts or exclusive perks for casual riders who transition to annual memberships, encouraging higher conversion rates.

3. **Pilot Program and Monitoring:**
   - Initiate a pilot marketing program based on the insights gathered, closely monitoring the response and conversion rates. Use the pilot results to refine and optimize future marketing strategies.

These recommendations aim to leverage the identified patterns to strategically convert casual riders into annual members, contributing to the overall growth and profitability of Cyclistic.
