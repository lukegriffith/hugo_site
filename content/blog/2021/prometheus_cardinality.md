---
title: "Prometheus Cardinality Explosions"
date: 2010-01-28T22:56:00+00:00
draft: true 
---

I've been maintaing a number Prometheus clusters for a while now. Moving from a new deployment and seeing it organically grow to a key point of infrastructure scraping thousands of metrics from a huge amount of targets and I wanted to gather some notes from the experience I've gained and how typical or unchecked use can lead to dramatic performance degredation. 

At first the world seems so bright, prometheus loads fast. You add more exporters, you copy some dashboards from grafana labs website or develop some custom views and you're really impressed with the metrics setup. Time goes by, maybe a few more exporters get added then all of a sudden prometheus containers start crashing. 

At first you brush it off as a one off, a few weeks later you're looking at graphs with huge gaps in time series or the graphs just dont load because Prometheus is timing out. 

What could be happening is metrics cardinality explosion. 

## What is metrics cardinality, and why should I care? 

Cardinality is a term that comes from set theroy, the mathematical theroy of well-determined collections, called sets. Cardinality is a measure of the number of elemenets of a set. 

```
[1,2,3]
```

The above is a set of numbers. It has a cardinality of 3.

Prometheus metrics i.e. `kube_pod_start_time` have a set of labels that make them uniqe. labels like `pod_name`, `namespace` are some of them. Each of these metrics have their own set of individual values. The `namespace` metric would contain all the values of metrics scraped for any namespace.

When prometheus recieves too many labels, the internal data structures and and operation of the system become extremely strained, _exploding_ the values of the set causing more data to be stored and longer time to query. 

## How Prometheus stores data

Write Ahead  Logs

Flush to old WAL 










