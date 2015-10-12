#!/bin/bash
{% if ansible_lsb.id == "Void" %}
exec /usr/lib/jvm/openjdk/jre/bin/java -Xms64M -Xmx128M -jar bungeeCord.jar
{% else %}
java -Xms64M -Xmx128M -jar bungeeCord.jar
{% endif %}
