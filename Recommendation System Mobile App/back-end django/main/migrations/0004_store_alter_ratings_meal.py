# Generated by Django 4.0.6 on 2023-01-17 16:58

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0003_ratings'),
    ]

    operations = [
        migrations.CreateModel(
            name='Store',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('corr', models.IntegerField()),
            ],
        ),
        migrations.AlterField(
            model_name='ratings',
            name='meal',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='m', to='main.meal'),
        ),
    ]