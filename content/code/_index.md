---
title: "Code"
date: 2018-02-05T00:59:10Z
draft: false
---

## Opensource Contributions 

### cChoco/cChocoFeature [(#5b57ef4)](https://github.com/chocolatey/cChoco/commit/5b57ef464822737679702b07e32897f108e52b37)

Development of a DSC resource to set Chocolatey client features via configuration management.


## Personal Projects 

### MonzoToYnab [(Git)](https://github.com/lukemgriffith/MonzoToYnab)
Monzo is a UK based online first bank. Ynab is a budgeting application that allows you to track expenses and keep monthly pots. Unfortunately Ynab does not support auto syncing with pretty much all UK banks but offers a great REST api and Monzo supports transaction webhooks. 

I implemented a simple lambda function that executed via an API gateway, and registered the function with Monzo, automatically adding my transactions to my budgeting app. This was my first real experience with serverless and writing a useful NodeJs project.

### ShowTruthTable [(Git)](https://github.com/lukemgriffith/ShowTruthTable)
During the first year of university I came across a number of logic problems in revision and exams, to give me an easy way to check my work and improve my Python I created a dynamic truth table generator that outputs to the console the result of the python expresson entered into a REPL loop. 

```bash
enter python expression or type exit.
        > r and q

| q      | r      | r and q |
|    True|    True|    True |
|    True|   False|   False |
|   False|    True|   False |
|   False|   False|   False |
```

### Breadth-first search algorithm [(Git)](https://github.com/lukemgriffith/JavaScriptPlayground)
Studying for my data structures course, I implemented a BFS algorithm to find the shortest path across a HTML grid with obstacles in javascript.

<script src="/scr/bfs_appendCss.js"></script>
<section id="grid">
<article class="cell active" id="0">
0
</article>
<article class="cell" id="1">
1
</article>
<article class="cell" id="2">
2
</article>
<article class="cell" id="3">
3
</article>
<article class="cell dead" id="4">
4
</article>
<article class="cell" id="5">
5
</article>
<article class="cell" id="6">
6
</article>
<article class="cell dead" id="7">
7
</article>
<article class="cell" id="8">
8
</article>
<article class="cell" id="9">
9
</article>
<article class="cell" id="10">
10
</article>
<article class="cell" id="11">
11
</article>
<article class="cell" id="12">
12
</article>
<article class="cell" id="13">
13
</article>
<article class="cell" id="14">
14
</article>
<article class="cell dead" id="15">
15
</article>
<article class="cell" id="16">
16
</article>
<article class="cell dead" id="17">
17
</article>
<article class="cell" id="18">
18
</article>
<article class="cell" id="19">
19
</article>
<article class="cell" id="20">
20
</article>
</section>
<script src="/scr/bfs_Grid.js"></script>
<script src="/scr/bfs_Main.js"></script>
