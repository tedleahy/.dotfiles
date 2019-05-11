# FIV

# The Seven Stages of Visualising Data

#### Information Visualisation Best Practices

- It's **important to plan** IV - complex datasets used for specialised applications require unique approaches; bar/pie charts etc. usually won't be the most useful way to visualise them.
- You might sometimes be dealing with **live data**, and you need to write code to handle the constant changes
  - Live data = data that is constantly moving and changing, w/ new values constantly appearing
  - E.g. temperature, train delays, website traffic
- You should **<u>focus on a question you want to ask the data</u>**
  - Don't just get a big chunk of data and say, *"How can we understand this?"* 
  - **Think about how the data will be used and *work backwards* to what was collected**
- The **more specific** you can make your question, the more specific & clear the visualisation result will be. 
- A proper visualisation is a kind of **narrative**, providing a **clear** answer to a question **without extraneous details**.

#### Subway Maps/London Underground Map Redesign

![](../img/london_underground.png)

- The new version is **abstracted** from the complex shape of the city and **focused on the rider's goal** - to get from one place to the next. This is all that matters for the person viewing the visualisation.
  - The new map **limits the detail** of each shape, turn and geographical formation, reducing the data to a series of vertical, horizontal and 45° diagonal lines.
  - This **reduces the complex dataset** to **just answering the rider's question** - *"how do I get from point A to point B?"*
  - The designer has **removed any details irrelevant to the rider's question**, leaving only the connections between stations, as that is the only information needed to decide a path through the system.

#### The Seven Stages

1. **<u>ACQUIRE</u>** 

   **Obtain** the data, e.g. from a file on disk or over a network.

2. **<u>PARSE</u>**

   Provide some **structure** for the data's meaning, and organise it into **categories**

3. **<u>FILTER</u>**

   **Remove** all but the data of interest

4. **<u>MINE</u>**

   Apply methods from statistics/data mining as a way to **discern patterns** or **place the data in a mathematical context**

5. **<u>REPRESENT</u>**

   Choose a **basic visualisation model**, e.g. bar graph, list, tree

6. **<u>REFINE</u>**

   **Improve** the basic representation to make it clearer and more visually engaging

7. **<u>INTERACT</u>**

   **Add methods** for **manipulating** the data or controlling what features are visible