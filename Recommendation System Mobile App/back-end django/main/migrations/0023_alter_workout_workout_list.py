# Generated by Django 4.1.3 on 2023-02-16 15:55

import django.contrib.postgres.fields
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0022_alter_workout_workout_list'),
    ]

    operations = [
        migrations.AlterField(
            model_name='workout',
            name='workout_list',
            field=django.contrib.postgres.fields.ArrayField(base_field=models.CharField(max_length=5000), blank=True, default=list, size=None),
        ),
    ]
