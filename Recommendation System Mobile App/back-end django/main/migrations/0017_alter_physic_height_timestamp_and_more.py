# Generated by Django 4.0.6 on 2023-01-23 15:30

import django.contrib.postgres.fields
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0016_physic_height_timestamp_physic_weight_timestamp'),
    ]

    operations = [
        migrations.AlterField(
            model_name='physic',
            name='height_timestamp',
            field=django.contrib.postgres.fields.ArrayField(base_field=models.DateField(blank=True), default=list, size=None),
        ),
        migrations.AlterField(
            model_name='physic',
            name='weight_timestamp',
            field=django.contrib.postgres.fields.ArrayField(base_field=models.DateField(blank=True), default=list, size=None),
        ),
    ]
