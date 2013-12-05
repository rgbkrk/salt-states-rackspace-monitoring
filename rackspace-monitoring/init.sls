rackspace-package:
  pkgrepo.managed:
    - humanname: Rackspace Monitoring
  {% if grains['os'] == 'Ubuntu' or grains['os'] == 'Debian' %}
    - name: "deb http://stable.packages.cloudmonitoring.rackspace.com/{{ grains['os'].lower() }}-{{ grains['osrelease'] }}-x86_64 cloudmonitoring main"
    - file: /etc/apt/sources.list.d/rackspace-monitoring-agent.list
    - key_url: https://monitoring.api.rackspacecloud.com/pki/agent/linux.asc
  {% endif %}
    - require_in:
      - pkg: rackspace-package

  pkg.latest:
    - name: rackspace-monitoring-agent
    - refresh: True
