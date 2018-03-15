ZTP for leaf switches:
  local.state.sls:
    - name: Add vlans to leaf switches
    - tgt: {{ data['id'] }}
    - arg:
      - leaf.vlans
