# Generated by Django 3.2.16 on 2023-10-12 16:08

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='categorias',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=50)),
                ('descripcion', models.TextField()),
                ('estado', models.BooleanField(default=True)),
            ],
            options={
                'verbose_name': 'categoria',
                'verbose_name_plural': 'categorias',
            },
        ),
        migrations.CreateModel(
            name='inventario',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('cantidad_maxima', models.IntegerField(null=True)),
                ('cantidad_minima', models.IntegerField(null=True)),
            ],
            options={
                'verbose_name': 'inventario',
                'verbose_name_plural': 'inventarios',
            },
        ),
        migrations.CreateModel(
            name='productos',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=50)),
                ('valor_unitario', models.IntegerField()),
                ('estado', models.BooleanField(default=True)),
                ('categoria', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='plataformaApp.categorias')),
            ],
            options={
                'verbose_name': 'producto',
                'verbose_name_plural': 'productos',
            },
        ),
        migrations.CreateModel(
            name='proveedores',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=50)),
                ('direccion', models.CharField(max_length=100)),
                ('telefono', models.CharField(max_length=12)),
                ('estado', models.BooleanField(default=True)),
            ],
            options={
                'verbose_name': 'Ingresar proveedor',
                'verbose_name_plural': 'Ingresar proveedores',
            },
        ),
        migrations.CreateModel(
            name='roles',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=50)),
                ('descripcion', models.CharField(max_length=150)),
            ],
            options={
                'verbose_name': 'permiso',
                'verbose_name_plural': 'permisos',
            },
        ),
        migrations.CreateModel(
            name='sucursales',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=50)),
                ('direccion', models.CharField(max_length=150)),
                ('telefono', models.CharField(max_length=12)),
                ('responsable', models.CharField(max_length=50)),
                ('estado', models.BooleanField(default=True)),
            ],
            options={
                'verbose_name': 'sucursal',
                'verbose_name_plural': 'sucursales',
            },
        ),
        migrations.CreateModel(
            name='salidaMercancia',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fecha', models.DateTimeField(auto_now_add=True)),
                ('cantidad', models.IntegerField()),
                ('producto', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='plataformaApp.productos')),
                ('sucursal', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='plataformaApp.sucursales')),
            ],
            options={
                'verbose_name': 'Salida mercancía',
                'verbose_name_plural': 'Salida mercancías',
            },
        ),
        migrations.CreateModel(
            name='proveedor_producto',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('producto', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='plataformaApp.productos')),
                ('proveedor', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='plataformaApp.proveedores')),
            ],
        ),
        migrations.AddField(
            model_name='productos',
            name='proveedor',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='plataformaApp.proveedores'),
        ),
        migrations.CreateModel(
            name='producto_inventario',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('cantidad', models.IntegerField()),
                ('inventario', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='plataformaApp.inventario')),
                ('producto', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='plataformaApp.productos')),
            ],
            options={
                'verbose_name': 'inventario',
                'verbose_name_plural': 'inventarios',
            },
        ),
        migrations.AddField(
            model_name='inventario',
            name='sucursal',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='plataformaApp.sucursales'),
        ),
        migrations.CreateModel(
            name='entradaMercancia',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fecha', models.DateTimeField(auto_now_add=True)),
                ('cantidad', models.IntegerField()),
                ('producto', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='plataformaApp.productos')),
                ('sucursal', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='plataformaApp.sucursales')),
            ],
            options={
                'verbose_name': 'Entrada mercancía',
                'verbose_name_plural': 'Entradas mercancía',
            },
        ),
        migrations.CreateModel(
            name='devolucionMercancia',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fecha', models.DateTimeField(auto_now_add=True)),
                ('cantidad', models.IntegerField()),
                ('producto', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='plataformaApp.productos')),
                ('sucursal', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='plataformaApp.sucursales')),
            ],
            options={
                'verbose_name': 'Devolución mercancía',
                'verbose_name_plural': 'Devolución mercancías',
            },
        ),
    ]
