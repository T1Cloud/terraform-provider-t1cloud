# Terraform Provider T1 Cloud

**Terraform** — программное обеспечение с открытым исходным кодом, используемое для управления внешними ресурсами (например, в рамках модели инфраструктура как код). Создано и поддерживается компанией HashiCorp. Пользователи определяют инфраструктуру с помощью декларативного языка конфигурации, известного как HashiCorp Configuration Language (HCL).

Terraform провайдер позволяет управлять множеством ресурсов в T1 Cloud. Пользователи могут взаимодействовать с T1 Cloud, объявляя ресурсы(resources) или вызывая источники данных(data sources).

## Требования

- [Terraform Core](https://developer.hashicorp.com/terraform/downloads) >= 1.5

## Ресурсы и источники данных

- Ресурсы:
    - [t1_compute_instance](docs/resources/compute_instance.md) - Серверы
    - [t1_compute_volume](docs/resources/compute_volume.md) - Диски
    - [t1_compute_snapshot](docs/resources/compute_snapshot.md) - Снимки
    - [t1_compute_image](docs/resources/compute_image.md) - Образы
    - [t1_compute_ssh_key](docs/resources/compute_ssh_key.md) - SSH-ключи
    - [t1_compute_floating_ip_associate](docs/resources/compute_floating_ip_associate.md) - Подключение публичного IP к серверу
    - [t1_vpc_network](docs/resources/vpc_network.md) - Сети
    - [t1_vpc_subnet](docs/resources/vpc_subnet.md) - Подсети
    - [t1_vpc_snat_router](docs/resources/vpc_snat_router.md) - Маршрутизаторы
    - [t1_vpc_public_ip](docs/resources/vpc_public_ip.md) - Публичные IP-адреса
    - [t1_vpc_vip](docs/resources/vpc_vip.md) - Виртуальные IP адреса
    - [t1_vpc_security_group](docs/resources/vpc_security_group.md) - Группы безопаcности
    - [t1_vpc_security_group_rule](docs/resources/vpc_security_group_rule.md) - Правила группы безопаcности
- Источники данных:
    - [t1_compute_flavor](docs/data-sources/compute_flavor.md) - Флейворы
    - [t1_compute_image](docs/data-sources/compute_image.md) - Образы
    - [t1_vpc_security_group](docs/data-sources/vpc_security_group.md) - Группы безопаности
    - [t1_compute_ssh_key](docs/data-sources/ssh_keys.md) - SSH-ключи
    - [t1_vpc_network](docs/data-sources/vpc_network.md) - Сети
    - [t1_vpc_subnet](docs/data-sources/vpc_subnet.md) - Подсети
    - [t1_compute_volume](docs/data-sources/compute_volume.md) - Диски
    - [t1_compute_snapshot](docs/data-sources/compute_snapshot.md) - Снимки


## Начало работы

### Установка из зеркала

Чтобы установить провайдер из зеркала:

1. В любом удобном месте создайте директорию, в которой будет находиться описание вашей инфраструктуры.
2. Создать в директории файл `main.tf` с минимальным содержанием: 

```hcl
terraform {
  required_providers {
    t1 = {
      source  = "tf-registry.t1.cloud/terraform-provider/t1cloud"
    }
  }
  required_version = ">= 0.13"
}
```
3. Выполните команду `terraform init`. В случае успешной инициализации провайдера появится сообщение:
```
Terraform has been successfully initialized!
```

### Установка из репозитория

Если установка провайдера из зеркала вам не подходит, например, нет доступа из-за ограничений в вашем регионе или организации, вы можете установить провайдер вручную из репозитория.

Чтобы установить провайдер из репозитория:

1. Загрузите исполняемый файл провайдера `terraform-provider-t1` [для вашей платформы](bin/).
2. Создайте директорию
    - Для Windows: `%appdata%\terraform.d\plugins\t1\t1-cloud\t1\${VERSION}\windows_amd64`.
    - Для Linux: `~/.terraform.d/plugins/t1/t1-cloud/t1/${VERSION}/linux_amd64`.
3. Переместите в данную директорию исполняемый файл `terraform-provider-t1`.
4. В любом удобном месте создайте директорию, в которой будет находиться описание вашей инфраструктуры.
5. Создайте в директории файл `main.tf` с минимальным содержанием: 

```hcl
terraform {
  required_providers {
    t1 = {
      source  = "t1/t1-cloud/t1"
    }
  }
  required_version = ">= 0.13"
}
```
6. Выполните `terraform init`. В случае успешной инициализации провайдера появится сообщение:
```
Terraform has been successfully initialized!
```

### Авторизация

Для дальнейшей работы с порталом T1 Cloud:

1. [Создайте](https://docs.t1.cloud/ru/home/iam#%D1%81%D0%B5%D1%80%D0%B2%D0%B8%D1%81%D0%BD%D1%8B%D0%B5-%D0%B0%D0%BA%D0%BA%D0%B0%D1%83%D0%BD%D1%82%D1%8B) сервисный аккаунт в рамках вашего проекта.
2. [Сгенерируйте](https://docs.t1.cloud/ru/home/iam#%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D0%B0-%D1%81-api) новый API-ключ. Реквизиты созданного API-ключа используются для первоначальной авторизации провайдера:
```hcl
provider "t1" {
  client_id     = "Идентификатор ключа"
  client_secret = "Сам ключ"
  project_name  = "Идентификатор вашего проекта"
}
```

### Пример создания сервера

Вариант шаблона конфигурации для заказа compute instance в провайдере 1.2.0:
В качестве примера будет использоваться конфигурация для создания сервера, с системным диском на 10 Гб, 1 ядром CPU и 1 Гб RAM и с установленной ОС Astra Linux 1.7.3.

В качестве примера создадим сервер c конфигурацией:

- системный диск — 10 Gb;
- количество виртуальных ядер процессора — 1 vCPU;
- количество оперативной памяти — 1 Gb;
- установленная ОС — Astra Linux 1.7.3.

Чтобы создать сервер с помощью Terraform:

1. Создайте файл main.tf.
2. Заполните файл в соответствии с примером конфигурации инфраструктуры.

```hcl
data "t1_compute_flavor" "small" {
    ram   = 1
    vcpus = 1
}
data "t1_compute_image" "astra" {
	os_distro  = "astra"
	os_version = "1.7.3 Орёл"
}
data "t1_vpc_network" "default" {
	name = "default"
}

resource "t1_compute_instance" "vm" {

# По умолчанию сервер после создания включен.
# Если нужно, чтобы после создания сервер был выключен, используйте state = "off".
# Если нужно изменить конфигурацию сервера, то сначала его нужно остановить с помощью state = "off".
 
  state = "off"

  boot_volume = {
    size = 10
  }

  flavor = data.t1_compute_flavor.small
  image  = data.t1_compute_image.astra

  network_interface = {
    subnet_id = data.t1_vpc_network.default.subnets[0].id
  }
   ssh_keys = [
    t1_compute_ssh_key.test.id,
  ]
}

resource "t1_compute_ssh_key" "test" {
	name        = "test-ssh"
	login       = "root"
	public_keys = [
	  "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAAgQCD+ACR4ubu98ti0aJOxL/Nwn6dlV++PCDY4HrkgScacPxIVbgo82P/qJ/VJEc29AbKYLGDsJ1NoK8xp320UCv1FCDHzZMKEeUQU8lfTvpN2hvTQlYp42ooGSsJgp4AM4wVYs8UBfbOerXquV/rQ6t7QiECJXq5e3gNu9C7hioOmw== "
	]
}
```

3. Чтобы проверить корректность синтаксиса файла конфигурации инфраструктуры, выполните команду:
```
terraform validate
```

4. Чтобы посмотреть составленную конфигурацию инфраструктуры до её применения, выполните команду:
```
terraform plan
```

5. Чтобы развернуть сервер из составленной конфигурации инфраструктуры, выполните команду:
```
terraform apply
```

6. Прежде чем Terraform начнёт разворачивать сервер из составленной конфигурации инфраструктуры, он сначала покажет план действий и запросит ваше подтверждение: 
```
Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value:
```

7. Напечатайте `yes` и нажмите `Enter`.

В результате Terraform покажет сообщение: 
```
Apply complete!
``` 

Проверьте, что сервер появился в проекте вашего аккаунта на [портале T1 Cloud](https://console.t1.cloud/).