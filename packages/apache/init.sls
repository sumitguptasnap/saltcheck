/var/www/html/index.html:
  file.managed:
    - source : salt://packages/apache/index.html
    - user: {{salt['pillar.get']('apache:user')}}
    - group: {{salt['pillar.get']('apache:group')}}
    - require:
        - pkg: apache
      

apache:
  pkg.installed:
    - name: {{salt['pillar.get']('apache:name','apache2')}}
  user.present:
    - name: {{salt['pillar.get']('apache:user')}}
    - home: {{salt['pillar.get']('apache:home')}}
    - shell: {{salt['pillar.get']('apache:shell')}}
  group.present:
    - name: {{salt['pillar.get']('apache:group')}}
    - require:
        - pkg: apache
  service.running:
    - name: {{salt['pillar.get']('apache:name','apache2')}}
    - watch :
      - pkg: apache
      - file: /var/www/html/index.html
