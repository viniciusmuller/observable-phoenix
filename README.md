# Observable TODO List

This project showcases an observable Phoenix application using:

- [Loki](https://grafana.com/oss/loki/) for logs
- [PromEx](https://github.com/akoutmos/prom_ex) and [Prometheus](https://prometheus.io/) for metrics
- [OpenTelemetry](https://opentelemetry.io/docs/instrumentation/erlang/) and [Tempo](https://grafana.com/oss/tempo/) for traces
- [Grafana](https://grafana.com/) for data visualization and querying
- An optional NGINX proxy for securing access to the [OpenTelemetry Collector](https://opentelemetry.io/docs/collector/)

It aims to provide a solid start point for adding observability to an
existing/new Phoenix application.

# Architecture
![Project's architecture](./.github/img/architecture.png)
