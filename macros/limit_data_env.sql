{% macro limit_data_env(nombre_lignes = 100) %}

    {% if target.name == 'dev' %}
        limit {{ nombre_lignes }}         
    {% endif %}

{% endmacro %}