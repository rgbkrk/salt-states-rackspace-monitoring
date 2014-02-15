python-apt:
  pkg.installed

rackspace-package:
  pkgrepo.managed:
    - humanname: Rackspace Monitoring
  {% if grains['os'] == 'Ubuntu' or grains['os'] == 'Debian' %}
    - name: "deb http://stable.packages.cloudmonitoring.rackspace.com/{{ grains['os'].lower() }}-{{ grains['osrelease'] }}-x86_64 cloudmonitoring main"
    - file: /etc/apt/sources.list.d/rackspace-monitoring-agent.list
    - key_url: https://monitoring.api.rackspacecloud.com/pki/agent/linux.asc
  {% elif grains['os'] == 'Fedora' %}
    - baseurl: http://stable.packages.cloudmonitoring.rackspace.com/{{ grains['os'].lower() }}-{{ grains['osrelease'] }}-x86_64
    - key_url: https://monitoring.api.rackspacecloud.com/pki/agent/linux.asc
  {% endif %}
    - require_in:
      - pkg: rackspace-package

  pkg.latest:
    - name: rackspace-monitoring-agent
    - refresh: True

{% if pillar['rackspace_username'] %}
rackspace-configure:
  cmd.run:
    - name: "rackspace-monitoring-agent --username '{{ pillar['rackspace_username'] }}' --apikey '{{ pillar['rackspace_api_key'] }}' --setup"

rackspace-monitoring-agent:
  service:
    - running
    - enable: True
    - reload: True
    - watch:
      - file: /etc/rackspace-monitoring-agent.cfg
{% endif %}
