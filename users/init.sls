{% for user,uid in pillar.get('users',{}).items() %}
{{user}}:
  user.present:
    - name: {{user}}
    - uid: {{uid}}
{% endfor %}
