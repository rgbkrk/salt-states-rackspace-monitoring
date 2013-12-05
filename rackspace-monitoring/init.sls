base:
  {% if grains['os'] == 'Ubuntu' or grains['os'] == 'Debian' %}
  pkgrepo.managed:
    - humanname: Rackspace Monitoring
    - name: "deb http://stable.packages.cloudmonitoring.rackspace.com/{grains['os'].lower()}-{grains['osrelease']}-x86_64 cloudmonitoring main"
    - file: /etc/apt/sources.list.d/rackspace-monitoring-agent.list
    - key_url: https://monitoring.api.rackspacecloud.com/pki/agent/linux.asc
    - require_in:
      - pkg: rackspace-monitoring-agent
  {% endif %}
