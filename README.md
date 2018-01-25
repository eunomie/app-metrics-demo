Applicative Metrics Demo
========================

This repository contains a very simple demo of [prometheus](https://prometheus.io) and [grafana](https://grafana.com).

This demo allows to show how easy it is to scrape an application to create applicative metrics and not only resource monitoring.

This is part of a talk about _applicative metrics_ presented at [Snowcamp 2018](http://sched.co/D2nb)

Run
---

    chmod 777 prometheus-data
    docker-compose up

This will build the three containers (prometheus, grafana and the app) and launch it.

Browse
------

- http://localhost:4000/metrics exposed metrics with random data
- http://localhost:9090 prometheus
- http://localhost:3000 grafana

Configure
---------

1. Go to [grafana](http://localhost:3000) and log in with `admin`/`admin`
2. Add Datasource
    - Name: `prometheus`
    - Type: `Prometheus`
    - URL: `http://prometheus:9090`
    - Keep Access through `Proxy`
    - Scrape interval: `1s`
3. Import Dashboard
    - Home button
    - Import Dashboard
    - Upload JSON file and select `Shop.json`
    - Select prometheus datasource
    - Import
4. Enjoy

---

With <3 from [squarescale](https://www.squarescale.com/) team!

---

```
        DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE 
                    Version 2, December 2004 

 Copyright (C) 2004 Sam Hocevar <sam@hocevar.net> 

 Everyone is permitted to copy and distribute verbatim or modified 
 copies of this license document, and changing it is allowed as long 
 as the name is changed. 

            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE 
   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION 

  0. You just DO WHAT THE FUCK YOU WANT TO.
```
