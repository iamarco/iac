## Modo de Uso

Para crear infraestructura en terraform se deben seguir los siguientes pasos.

* Crear un archivo .env donde se declaran las variables a usar

```sh
#Cargar variables de entorno
source .env
```

* Iniciar los archivos de configuracion a usar, en este caso usaremos lo definido en 01-versions.tf

```sh
#Iniciar terraform
terraform init
```

* Luego de inicializar el proyecto, se deben generar planes de ejecuciòn de la infraestructura a crear.

```sh
#Planear ejecucion en terraform
terraform plan
```

* Para aplicar la configuraciòn planeada usamos el siguiente comando

```sh
#Aplicar configuracion
terraform apply -auto-approve 
```

* Por ultimo, si quieremos destruir la infraestructura creada, lo hacemos de la siguiente manera

```sh
#Destruir configuracion
terraform destroy -auto-approve 
```

#
Cada vez que se requiera aplicar y/o destruir una configuración, Terraform nos preguntara si estamos seguros de aplicar y/o destruir lo solicitado, para esto debemoos darle argumento Y (yes) de forma manual, para evitar esto al momento de querer aplicar y/o destruir alguna infraestructura le damos el argumento -auto-approve 