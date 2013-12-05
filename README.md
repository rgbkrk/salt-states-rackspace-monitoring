salt-states-rackspace-monitoring
================================

Install the Rackspace Cloud Monitoring Agent, using Salt States.

This repo is just getting started and currently *only supports Ubuntu+Debian* at the moment. Fedora is in, but hasn't been tested yet.

Right now, this just runs through [installing the cloud monitoring agent](http://www.rackspace.com/knowledge_center/article/install-the-cloud-monitoring-agent).

If you have `pillar['rackspace_username']` and `pillar['rackspace_api_key']` defined, you can also have it setup the server and run the service. Upon launch you should see data in the control panel.

# Usage

If you've got a salt cluster all setup and you're using gitfs, then you're awesome.

Just add this to your gitfs remotes:

```
gitfs_remotes:
  - https://github.com/rgbkrk/salt-states-rackspace-monitoring.git
```

Alternatively, you could download it and put it somewhere in your file roots.

To run this across your minions, just use `state.sls`:

```
salt '*' state.sls rackspace-monitoring
```
