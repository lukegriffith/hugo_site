---
title: "Monzo to Ynab connector"
date: 2018-05-10T00:55:10Z
draft: false
---

[(Git)](https://github.com/lukemgriffith/MonzoToYnab)

Monzo is a UK based online first bank. Ynab is a budgeting application that allows you to track expenses and keep monthly pots. Unfortunately Ynab does not support auto syncing with pretty much all UK banks but offers a great REST api and Monzo supports transaction webhooks. 

I implemented a simple lambda function that executed via an API gateway, and registered the function with Monzo, automatically adding my transactions to my budgeting app. This was my first real experience with serverless and writing a useful NodeJs project.
