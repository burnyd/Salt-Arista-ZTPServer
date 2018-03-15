{% load_yaml as yaml_src %}
  switches:
    leaf4a:
      hostname: leaf4a
      systemmac: 112233445566
{% endload %}
  switches_create_dir:
    file.directory:
      - name: /usr/share/ztpserver/nodes/{{ yaml_src.switches.leaf4a.systemmac }}
      - mode: 755
      - makedirs: True
  switches_create_config:
    file.managed:
      - name: /usr/share/ztpserver/nodes/{{ yaml_src.switches.leaf4a.systemmac }}/startup-config
      - source: salt://templates/startup-config.jinja
      - template: jinja
      - context:
          host: {{ yaml_src.switches.leaf4a.hostname }}
  switches_create_definition:
    file.managed:
      - name: /usr/share/ztpserver/nodes/{{ yaml_src.switches.leaf4a.systemmac }}/definition
      - source: salt://templates/definition

  switches_create_pattern:
    file.managed:
      - name: /usr/share/ztpserver/nodes/{{ yaml_src.switches.leaf4a.systemmac }}/pattern
      - source: salt://templates/pattern

