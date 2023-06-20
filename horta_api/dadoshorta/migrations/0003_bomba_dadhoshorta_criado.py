# Generated by Django 4.1.7 on 2023-06-20 19:34

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('dadoshorta', '0002_umidadesolo'),
    ]

    operations = [
        migrations.CreateModel(
            name='Bomba',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('estado', models.BooleanField(default=False)),
            ],
        ),
        migrations.AddField(
            model_name='dadhoshorta',
            name='criado',
            field=models.DateTimeField(default=django.utils.timezone.now),
        ),
    ]
