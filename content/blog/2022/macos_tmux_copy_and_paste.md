---
title: "Macos Tmux copy and paste setup, post 2019"
date: 2022-01-12T19:00:00+00:00
draft: false 
---

 
Hello blog, it's been a minute - 4 years. You've been good? ... I mean I know you have, I've replatformed you 3 times and added no content. Me? Oh, nothing much… I've only got tmux copy and paste to work on MacOS!
 
Why is this big, well the last 5 years I've come to work on a new macbook exactly twice - I find [this blog post](https://thoughtbot.com/blog/tmux-copy-paste-on-os-x-a-better-future) explaining how to setup copy and paste in a macos world by somebody named Chris Toomey - Indeed the future would be better, Chris if this wasn't the first hit on google and wasn’t written in 2013. The future has moved on (oh boy it moved on 😷) and tmux has moved on.
 
If you brew install `tmux` and the `reattach-to-user-namespace` package, then you add the config documented on the linked blog in your .tmux.conf it wont load. If you manually source it ```Ctrl + B, :source-file ~/.tmux.conf``` it'll spit out something along the lines of
 
```
/home/user/.tmux.conf:12: usage: bind-key [-cnr] [-T key-table] key command [arguments]
```
 
This is on a tmux version greater than 3.0.

At this point previously, I looked for another article and was unable to find the  answer - reasoned with myself is tmux really worth it and moved on with my life. I installed iterm, learnt some hotkeys and got on with my multiplexless life.
 
But this time was different, this time - I had time. My age old enemy, well now it has become my friend.
 
It doesn't work because the command syntax changed, I'm unsure what version - if I cared more I would check, but alas.
 
```
setw -g mode-keys vi
bind-key -T copy-mode-vi v send-keys -X begin-selection
unbind -T copy-mode-vi Enter
bind-key -T copy-mode-vi Enter send-keys -X copy-pipe-and-cancel 'reattach-to-user-namespace pbcopy'
bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel 'reattach-to-user-namespace pbcopy'
```
 
The above added to my tmux config, after installing `reattach-to-user-namespace` actually worked, I can move into selection mode - smash Y and copy into the system clipboard. All it took was some patience and reading man pages. If I had just taken the literal 5 minutes of using my brain before to help myself out!
 
If there's some solace, hopfully this supassess Chris' blog post on Google and saves someone some time. But that would involve me actually having a sensible adsense setup.

In another four years!

Sayonara
