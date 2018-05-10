---
title: "Show Truth Table"
date: 2016-12-10T00:55:10Z
draft: false
---



[(Git)](https://github.com/lukemgriffith/ShowTruthTable)

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
