salt-states-rackspace-monitoring
================================

Install the Rackspace Cloud Monitoring Agent, using Salt States.

This repo is just getting started and currently *only supports Ubuntu+Debian* at the moment. Fedora is in, but hasn't been tested yet.

## What's the Rackspace Cloud Monitoring Agent?

The monitoring agent sends back utilization data to your customer profile on things like CPU usage, RAM usage, Disk Usage, and running processes. There's more too, but those are the basics and they give you pretty pictures in the control panel.

## What do these salt states do?

These salt states

* Set up the package repo for the rackspace cloud monitoring agent
* [Install the rackspace cloud monitoring agent](http://www.rackspace.com/knowledge_center/article/install-the-cloud-monitoring-agent)

If `pillar['rackspace_username']` and `pillar['rackspace_api_key']` are defined, this also

* Sets up the monitoring agent and authenticates with the monitoring service
* Runs the service (and reloads if necessary)

Upon launch you should see data in the control panel.

# Usage

If you've got a salt cluster all setup and you're using gitfs, then you're awesome.

Just add this to your gitfs remotes:

```
gitfs_remotes:
  - https://github.com/rgbkrk/salt-states-rackspace-monitoring.git
```

Alternatively, you could download it and put it somewhere in your file roots.

If you want it fully configured, you need to set some pillar values:

```
rackspace_username: <your_username>
rackspace_api_key: <api_key>
```

To run this across your minions, just use `state.sls`:

```
salt '*' state.sls rackspace-monitoring
```
