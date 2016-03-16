vim:
  pkg.installed:
    - name: {{salt['pillar.get']('vim:name','vim')}}
/etc/vimrc:
  file.managed:
    - source: {{salt['pillar.get']('vim:source','salt://vimrc')}}
    - mode: 0644
    - user: root
    - group: root
    - require:
      - pkg: vim
