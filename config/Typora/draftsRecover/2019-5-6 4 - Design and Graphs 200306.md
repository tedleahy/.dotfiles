# FIV

# Design and Graphs

## What design criteria should we follow?

### Choosing Visual Encodings
- Assume $k$ visual encodings and $n$ data attributes. We would like to pick the "best" encoding among a combinatorial set of possibilities of size $(n+1)^k$
- **Principle of Consistency**
    - The properties of the image (visual variables) should match the properties of the data.

- **Principle of Importance Ordering**
    - Encode the most important information in the most effective way.

### What Design Criteria to Follow?
- **Expressiveness**
    - A set of facts is expressible in a visual language if the sentences (i.e. the visualizations) in the language:
      1. Express ***all*** the facts in the set of data, and
      2. ***Only*** the facts in the data.
    - TLDR; **Tell the truth!!**

- **Effectiveness**
    - A visualization is more effective than another visualization if the information conveyed by one visualization is more readily perceived than the information in the other visualization.
    - Use proper encoding!!

### Expressiveness - Examples

#### First Criterion - Express *all* the facts of the data set

- This visualisation does not meet the first criterion, because it only tells you about price, not about mileage, weight, etc.

![](img/expressiveness.png)



#### Second Criterion - Express *only* the facts in the data set

- This visualisation fails the second criterion, because the size of the bars gives an impression of quantity or ranking that does not exist in the data, e.g. cars sold in the USA appear less than those sold in France.
  - A length is interpreted as a quantitative value.

![](img/expressiveness2.png)



- An Alternative is to use a box plot, which conveys the same information but now meets the second criterion, because it expresses only the information present in the data set.

![](img/expressiveness3.png)

---

### Effectiveness

- **Effectiveness** = A visualization is more effective than another visualization if the information conveyed by one visualization ***is more readily perceived*** than the information in the other visualization.

#### Example

- Which of these is more effective? That is, which better conveys the information in the data it's representing?

![](img/effectiveness.png)

- The **left chart** is more effective.
- This is similar to a limitation of using **pie charts**: it is difficult to compare 2 different sectors if they are similar.
  - In the same way, it's difficult to compare many of the points on the right chart to find out whether one price is higher or lower than another.
- Also, because there is no y axis on the right chart, the values plotted have random positions, and in some cases overlap, making it even harder to make accurate comparisons between data points.

### Effectiveness: Accuracy Ranking for Quantitative Information

![](img/effectiveness2.png)

- Generally, position and length are the most accurate for encoding quantitative information, while area, color and density are less accurate, meaning that users are more likely to make mistakes when viewing the visualisation.

### Effectiveness: Accuracy Ranking for Nominal/Ordinal Information?

![](img/effectiveness3.png)

- Area encoding is much better for nominal/ordinal data than quantitative.
- Be careful using this for nominal data! You can accidentally fail the second criteria (encode more information than exists in the dataset) by communicating a ranking or difference between categories that doesn't exist - making the user interpret the variables as ordinal when they are actually nominal.
- If you have too many, e.g. 20 categories, it will become difficult to compare two values as the circles (or w/e shape) will have to be similar sizes. This is even true with ordinal data.

### Conjectured Effectiveness of Encodings by Data Type

- **Nominal/Ordinal variables**: detect differences
- **Quantitative variables**: estimate magnitudes

![](img/conjectured_effectiveness.png)

- The higher an encoding in a list, the more effective it is for that data type.
- When picking a visualisation, you should establish the types of all the variables you want to represent, then rank them based on importance (which ones you want to emphasise the most/least), and then based on that, go through and pick the best encoding for each variable.
  - You need to rank based on importance because you may have multiple variables of the same type, e.g. 2 quantitative variables, so you'd need to use position for the most important one, then length for the next-most important one.

### Mackinlay’s Design Algorithm

- **APT** - "A Presentation Tool", 1986.
- An algorithm that automatically generates the best visualisation for a given dataset.
- User formally specifies data model and type
- Input: ordered list of data variables to show

- APT searches over design space
    - Test expressiveness of each visual encoding
    - Generate encodings that pass test
    - Rank by perceptual effectiveness criteria

- Outputs the "most effective" visualization

### APT - Example
- Automatically generate chart for car data
- Input variables:
    - Price
    - Mileage
    - Repair
    - Weight

![](img/apt.png)

### Limitations of APT?
- Does not cover many visualization techniques
    - Networks, hierarchies, maps, diagrams
    - Also: 3D structure, animation, illustration, ...
- Does not consider interaction - can only output static visualisations.
- Does not consider semantics / conventions
- Assumes single visualization as output

### Summary of Design Criteria
- Choose expressive and effective encodings
    - Rule-based tests of expressiveness
    - Perceptual effectiveness rankings
        - Prioritizes encodings that are most easily/accurately interpreted
        - Principle of Importance Ordering: Encode more important information more effectively (Mackinlay)

---

## Graphs

### How Many Variables?
- Data sets of dimensions 1, 2, 3 are common
- Number of variables per class
    - 1 - Univariate data
    - 2 - Bivariate data
    - 3 - Trivariate data
    - \> 3 - Hypervariate data

### Graphs
- Data Dimensions
    - 1 - Univariate data
    - 2 - Bivariate data
    - 3 - Trivariate data
    - \> 3 - Hypervariate data

- We mainly focus on uni, bi and tri-variate data for the rest of the lecture.

- Data Types
    - Nominal, Ordinal, Quantitative

- Visualization Representations
    - Points, Lines, Bars, Boxes

### Components of Graphs
- Framework
    - Measurement types, scale

- Content (Specifier)
    - Marks, lines, points

- Labels
    - Title, axes, ticks

![](img/components_of_graphs.png)


### Points, Lines, Bars, Boxes
- **Points**
    - Useful in scatterplots for 2-values
    - Can replace bars when scale doesn’t start at 0

- **Lines**
    - Connect values in a series
    - Show changes, trends, patterns
    - Not for a set of nominal or ordinal values

- **Bars**
    - Emphasizes individual values
    - Good for comparing individual values

- **Boxes**
    - Shows a distribution of values

### Univariate Data
- In univariate representations, we often think of the data case as being shown along one dimension, and the value in another.
- Statistical view - Generally:
    - You show the **independent variable** (the data case - name of the actual data point) on the **x-axis**
    - You track the **dependent variable** (the value) along the **y-axis** 
- Bar charts, line graphs and dot plots are generally used

![](img/univariate_data.png)

### Bivariate Data
- Scatter plot is commonly used
- Each mark is now a data case
- Objective:
    - Two variables, want to see relationship
    - Is there a linear, curved or random pattern?

![](img/bivariate_data.png)

### Trivariate Data
- **3D scatter plot**
    ![](img/3d_scatter_plot.png)
- **2D + mark property**
    - Both axes are used (position) for the first 2 variables, but a 3rd encoding is also added to represent a third variable - here, color is used to encode depth.
	![](img/2d_mark_property.png)
- **Represent each variable in its own explicit way**
	- Show each one on its own chart, then concatenate all the charts
		 	![](img/represent_each_var.png)


### Chart Suggestions - A Thought-Starter

![](img/chart_suggestions.png)



### Data Visualisation with `ggplot2` - Cheat Sheet

![](img/ggplot2_cheat_sheet.png)



### Dot Plots

- When to use:
    - When analyzing values that are spaced at irregular intervals
    - continuous, quantitative, univariate data

![](img/dot_plots.png)

### Scatter Plot
- When to use:
    - To compare how two quantitative variables change
    - Continuous, quantitative, bivariate data
    - Relationships for two variables

![](img/scatter_plot.png)

### Line Graphs
- When to use:
    - When quantitative values change during a continuous period of time (for more than one group)
    - Time series data
    - Non-cyclical data over time

![](img/line_graphs.png)

### Bump Chart
- When to use:
    - Similar to line graph
    - Difference is that the y-axis is used to represent **rank** rather than continuous values
      - So instead of the y-axis showing some continuous measure, e.g. age, it is used to show the rank of data points relative to all the other data points for that interval of the x-axis.

![](img/bump_chart.png)



### Area Graph

- When to use:
    - To compare two or more quantities.
    - The area between axis and line are commonly emphasised with colours and textures.

![](img/area_graph.png)

### Radar Graphs
- When to use:
    - Quantitative variables
    - When you want to represent data across the cyclical nature of time
    - A two-dimensional chart of three or more quantitative variables represented on axes starting from the same point
    - Very easy to compare 2 variables to see which is bigger than the other

![](img/radar_graphs.png)

### Bar Graphs
- When to use:
    - When you want to support the comparison of individual values between different groups
    - Can run vertically or horizontally

![](img/bar_graphs.png)

### Stacked Bar Chart
- When to use:
    - When you want to present the total in a clear way while comparing part-towhole relationship between different groups
    - Harder to compare the size of each categories

![](img/stacked_bar_chart.png)

### Histogram
- When to use:
    - the most commonly used graph to show frequency distributions
    - Continuous, quantitative, univariate data

![](img/histogram.png)

### Pareto chart
- When to use:
    - When analyzing data about the frequency of problems or causes in a process.
    - Containing both bars and a line graph

![](img/pareto_chart.png)

### Box Plots
- When to use:
    - You want to show allow for comparison of data from different categories
    - Graphically depicting groups of numerical data through their quartiles

![](img/box_plots.png)

### Heat Maps
- When to use:
    - When you want to display a large quantity of cyclical data (too much for radar)
    - Color choices: grayscales, rainbow, etc.

![](img/heat_maps.png)

### Crosstab Plot
- When to use:
    - Comparing different groups while presenting values (count)
    - Similar to heatmap

![](img/crosstab_plot.png)

### Trellis Display
- When to use:
    - Typically varies on one variable
    - Distribute different values of that variable across views

![](img/trellis_display.png)

### Hybrid: Map based Heatmap
- When to use:
    - When you want to display a large quantity of cyclical data over different geo-locations

![](img/map_based_heatmap.png)

### Comparisons

![](img/comparisons.png)



![](img/comparisons2.png)

- With this, the trellis chart is better because it's clearer to display each piece of information on separate graphs, rather than try to fit it all into one.