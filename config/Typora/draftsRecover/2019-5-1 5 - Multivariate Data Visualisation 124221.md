# FIV

# Multivariate Data Visualisation

### This Lecture

- Multivariate data = more than 3 variables

### Design Challenge

- Suppose you have this data about dogs:
  - Variety (N)
  - Group (N)
  - Size (O)
  - Smartness (N)
  - Popularity (Q)
  - Ranking (Q)
- Need to think about how to represent 6 different variables in just a single visualisation.

#### Intuition

- Fundamentally, we have 2 positions to display dimensions, x-axis and y-axis.
- We have more than 2 variables, but we need to project them down so that they are all somehow displayed in this 2D space we have to work with.
  - E.g. size, shape, colour (recall Bertin's semiology)

### 2 Main Ways of Representing Multivariate Datasets

- **Directly** (textually): Tables
- **Symbolically** (pictures): Graphs

- But when should we use each one?

### Table/Spreadsheet

- This is actually already a visualisation of all these variables, it's just very simple

![](img/table.png)

- Each variable becomes a column
- Each data case becomes a row
- This is a projection (mapping)

#### Limitations

- Occupy a large space
- Difficult to understand the relationships between variables
- Hard to see the overall picture, focus and see the context
  - If you want to compare two data cases, it's very difficult to do so within the context of the whole dataset
- Less effective in amplifying human perception and cognition

### Tables and Graphs - When to Use Each

#### Tables - use when...

- The document will be used to **look up individual values**
- The document will be used to **compare individual values**
- **Precise values** are required
- The quantitative info to be communicated involves **more than one unit of measure**

#### Graphs - use when...

- The message is contained in the **shape** of the values
- The document will be used to **reveal relationships** among values
- The **number of data points is huge** - especially useful here



### Image: Visual Encoding Values

- Recall Bertin's Semiology of Graphics

![](../Week 2/img/bertin_semiology_of_graphics.png)

- These are all the different dimensions you can use to encode values
- But you need to think about the effectiveness in terms of human perception (how understandable is the visualisation?)
  - We want to choose visualisations that represent the thing we're trying to show, but we also want it to be as understandable as possible by normal human perception.

![](../Week 2/img/conjectured_effectiveness.png)



- Size (O)
  - Size is an ordinal variable, but position, density, saturation aren't necessarily the best way to display it for a human to perceive it.
- A good way to represent size, is to just use size! E.g. physical size of the dog on the graph
- In our dogs example, say we care most about ranking.

### Best In Show

![](img/best_in_show.png)

- Putting it all together, you might come up w/ a visualisation like the above.



### An Example: Coffee Sales

- Sales:                    Q-Ratio 
- Profit:                   Q-Ratio 
- Marketing:           Q-Ratio 
- Product Type:      N {Coffee, Espresso, Herbal Tea, Tea}  

![](img/coffee_example.png)



![](img/coffee_example2.png)



![](img/coffee_example4.png)



![](img/coffee_example3.png)

- But this isn't great - **problems:**
  - A lot of the points overlap so it's impossible in some cases to look at individual data points
  - W/ the dog, the representations are **natural** - e.g. size to represent relative dog size, shape to represent breed of dog
    - But w/ this graph, the representations bear no relation to what they're representing - coffee isn't blue, central market isn't related to a circle, etc.
    - Makes it harder to understand the visualisation
- Could you encode 10-dimensional data in one visualisation?
  - Bertin's seminology (see earlier lecture slides then update) only allows for 8/9 max so you'd have to use the same representation for 2 variables, and it would be too confusing
  - So no!



### Small Multiples

*"At the heart of quantitative reasoning is a single question: **Compared to what?** Small multiple designs, multivariate and data bountiful, answer directly by visually enforcing **comparisons** of changes, of the differences among objects, of the scope of alternatives. For a wide range of problems in data presentation, **small multiples are the best design solution**. "* - Tufte, Envisioning Information

- Rather than having one big visualisation, it's much better to split it up into small visualisations for different variables.

![](img/small_multiples.png)



#### Trellis Display

- Subdivides space to enable comparison across multiple plots
- Typically nominal or ordinal variables are used as dimensions for subdivision.
- E.g. we can display the market variable from the coffee example by just having a separate visualisation for each market:

![](img/trellis_display.png)



### Minard 1869 - Napoleon's March

![](img/napoleons_march2.png)

- Top graph:
  - Color = march direction (N)
    - Red = marching to Moscow
    - Black = marching back
  - Size/width = the size of the army at that position
  - X-axis: latitude (Q)
  - Y-axis: longitude (Q)
- Bottom graph:
  - X-axis: longitude (Q) / time (O)
  - Y-axis: temperature (Q)

#### Decomposition

- We had 2 visualisations - army position & size over space/time, and temperature over space/time
- They were combined so that you can see the temperature in relation to the top graph; compare the temperature changes to changes in the size of the army

- So as you can see, there are 6 variables visualised all together in the whole visualisation
  - The ones on the slide, plus army direction - shown using colour

### Multiple Coordinated Views

![](img/multiple_coordinated_views.png)

- Where you concatenate 2 or more visualisations
- Works especially well when the visualisation is interactive



### Multivariate Data Visualisation - Summary

- Strategies:
  - Avoid "over-encoding"; don't encode too many variables on a single visualisation
    - It makes it confusing for the user
  - Use space and small multiples intelligently
  - Reduce the problem space
  - Use interaction to generate relevant views
  
  
- Rarely does a single visualisation answer all questions. Instead, the ability to **generate appropriate visualisations** **quickly** is key.
  - Think about visualising low-dimensional data quickly, then think about multivariate visualisation

---

## Common Multivariate Data Visualisation Techniques

### Chernoff Faces

- Observation: We have evolved a sophisticated ability to interpret faces.
- Idea: Encode different variables' values in characteristics of human face
  - Humans can also notice small changes in face features very easily

![](img/chernoff_face.png)

#### Example - Eugene Turner

![](img/chernoff_face_example.png)

- "The expressions evoke an emotional association with the data."

- Encodes the 4 different variables using different parts of the faces:
  - Affluence = shape of face
  - Unemployment rate = mouth shape (sad, neutral or happy)
  - Urban stresses = eyes and eyebrow shape
  - Proportion white population = color of face
- Turner found that using Chernoff faces can give people empathy with the data; sad faces for high unemployment, which is sad for people, etc.

#### Critiques

![](img/chernoff_face_example2.png)

- Because those faces carry emotion, they're conveying **additional information** that's not in the dataset.
  - So doesn't meet the second criterion of a good vis - only encode info that is present in the dataset.
  - However, this can sometimes be good - e.g. in the previous example, the happy/unhappy faces map to good/bad things, respectively. Here it communicates the idea of the vis effectively because unemployment & urban stresses are generally seen as bad by everyone, so it is effective to use Chernoff faces.
- In the death penalty example, the faces are happy when people under 40 are executed, which is counter-intuitive and confuses the idea you're trying to communicate.

---

### Table Lens

- Consider using a table for a viz
  - ✔ It's easy to lookup individual values
  - ✔ Good for hypervariate data with 20, 30 variables etc.
  - ✖ Bad for capturing the overall trend of the data
    - For doing this, a graph is much better
- This is the idea behind Table Lens - combining a table and a graph to get the benefits of both
  - By making the **text more visual and symbolic**

#### Example

![](img/table_lens.png)



- Here, you can sort the data by whichever column you like, e.g. above sorted by model year. This allows you to view trends for different variables

#### Focus & Context

![](img/table_lens2.png)

- But table lens still gives you the benefits of a table - you can zoom in to view individual values
- Focus & context = *focus* on 3 data points, while having the *context* of the dataset as a whole.

#### 3 Advantages of Table Lens

Video demo: http://www.open-video.org/details.php?videoid=8304

✔ Space advantage

✔ Fluid navigation

✔ Direct exploration

---

### Parallel Coordinates

- Encode variables along a horizontal row
- Vertical line specifies different values that variable can take
- Data point represented as a polyline

![](img/parallel_coords.png)



#### Live Demo

https://syntagmatic.github.io/parallelcoordinates

- E.g. you can look at only when the protein is between 20 and 40. And then combine that w/ when fibre is greater than 40.
- Shows the benefits of interaction

- To learn more:
  - Heinrich, Julian, and Daniel Weiskopf. "State of the Art of Parallel Coordinates." Eurographics (STARs). 2013.
  - http://www.parallelcoordinates.de

### Mosaic Plot

#### Multivariate Categorical Data
- How about **multivariate categorical** **data**?

- Students
  - Gender: Female, male
  - Eye color: Brown, blue, green, hazel
  - Hair color: Black, red, brown, blonde, gray
  - Home country: USA, China, Italy, India, ...

#### Mosaic Plot Decomposition

![](img/mosaic_plot_decomp.png)

### Mosaic Plot

![](img/mosaic_plot.png)

- Hair
- Sex
- Eye color
- Level of the Pearson residual

#### Data Overload
- Most of the techniques we’ve examined work for a modest number of data cases or variables
- What happens when you have lots and lots of data cases and/or variables?
  (We will address this in other lectures.)

![](img/data_overload.png)

---

### Summary

- Tables vs Graphs
- Visual 