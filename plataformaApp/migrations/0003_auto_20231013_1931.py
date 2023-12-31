# Generated by Django 3.2.16 on 2023-10-13 22:31

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0002_auto_20231013_1931'),
        ('plataformaApp', '0002_noticia'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='devolucionmercancia',
            name='producto',
        ),
        migrations.RemoveField(
            model_name='devolucionmercancia',
            name='sucursal',
        ),
        migrations.RemoveField(
            model_name='entradamercancia',
            name='producto',
        ),
        migrations.RemoveField(
            model_name='entradamercancia',
            name='sucursal',
        ),
        migrations.RemoveField(
            model_name='inventario',
            name='sucursal',
        ),
        migrations.RemoveField(
            model_name='producto_inventario',
            name='inventario',
        ),
        migrations.RemoveField(
            model_name='producto_inventario',
            name='producto',
        ),
        migrations.RemoveField(
            model_name='productos',
            name='categoria',
        ),
        migrations.RemoveField(
            model_name='productos',
            name='proveedor',
        ),
        migrations.RemoveField(
            model_name='proveedor_producto',
            name='producto',
        ),
        migrations.RemoveField(
            model_name='proveedor_producto',
            name='proveedor',
        ),
        migrations.RemoveField(
            model_name='salidamercancia',
            name='producto',
        ),
        migrations.RemoveField(
            model_name='salidamercancia',
            name='sucursal',
        ),
        migrations.AlterModelOptions(
            name='noticia',
            options={'verbose_name': 'noticia', 'verbose_name_plural': 'noticias'},
        ),
        migrations.DeleteModel(
            name='categorias',
        ),
        migrations.DeleteModel(
            name='devolucionMercancia',
        ),
        migrations.DeleteModel(
            name='entradaMercancia',
        ),
        migrations.DeleteModel(
            name='inventario',
        ),
        migrations.DeleteModel(
            name='producto_inventario',
        ),
        migrations.DeleteModel(
            name='productos',
        ),
        migrations.DeleteModel(
            name='proveedor_producto',
        ),
        migrations.DeleteModel(
            name='proveedores',
        ),
        migrations.DeleteModel(
            name='salidaMercancia',
        ),
        migrations.DeleteModel(
            name='sucursales',
        ),
    ]
