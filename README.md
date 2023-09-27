# Terraform Provider T1.Cloud

Terraform — программное обеспечение с открытым исходным кодом, используемое для управления внешними ресурсами (например, в рамках модели инфраструктура как код). Создано и поддерживается компанией HashiCorp. Пользователи определяют инфраструктуру с помощью декларативного языка конфигурации, известного как HashiCorp Configuration Language (HCL).

Terraform провайдер позволяет управлять множеством ресурсов в T1.Cloud. Пользователи могут взаимодействовать с T1.Cloud, объявляя ресурсы(resources) или вызывая источники данных(data sources).

## Requirements

- [Terraform Core](https://developer.hashicorp.com/terraform/downloads) >= 1.5
- [Go](https://go.dev/doc/install) >= 1.20

## Документация

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

## Начало работы

### Установка

- Создайте директорию
    - Для Windows: `%appdata%\terraform.d\plugins\t1\t1-cloud\t1\${VERSION}\windows_amd64`
    - Для Linux: `~/.terraform.d/plugins/t1/t1-cloud/t1/${VERSION}/linux_amd64`
- Переместите в данную директорию исполняемый файл `terraform-provider-t1` для вашей платформы

### Конфигурация

- В любом удобном месте создать директорию, в которой будет находиться описание вашей инфраструктуры
- Создать в директории файл `main.tf` с минимальным содержанием: 
```
terraform {
  required_providers {
    t1 = {
      source  = "t1/t1-cloud/t1"
    }
  }
  required_version = ">= 0.13"
}
```
- Выполните `terraform init`; в случае успешной инициализации провайдера вас ожидает:
```
Terraform has been successfully initialized!
```

### Получение API-ключа

Для дальнейшей работы с порталом T1.Cloud необходимо создать сервисный аккаунт в рамках вашего проекта
и сгенерировать новый API-ключ. Реквизиты созданного API-ключа используются для первоначальной авторизации провайдера:

```
provider "t1" {
  client_id     = "Идентификатор ключа"
  client_secret = "Сам ключ"
  project_name  = "Идентификатор вашего проекта"
}
```

### Пример использования

В качестве примера будет использоваться конфигурация для создания сервера, с системным диском на 10 Гб, 1 ядром CPU и 1 Гб RAM и с установленной ОС Ubuntu 20.04.

```
resource "t1_compute_instance" "vm" {
  boot_volume = {
    size                  = 10
  }
  flavor = {
    cores  = 1
    memory = 1
  }
  image = {
    distro  = "ubuntu"
    version = "20.04"
  }
  network_interface = {
    subnet_id = t1_vpc_subnet.subnet1.id,
    security_group_ids = [
      t1_vpc_security_group.sec_group.id,
    ]
  }

   ssh_keys = [
    t1_compute_ssh_key.ssh.id,
  ]
}

resource "t1_compute_ssh_key" "ssh" {
  name  = "foo-ssh"
  login = "root"
  publick_keys = [
    "my-public-key",
  ]
}

resource "t1_vpc_security_group" "sec_group" {
  name = "foo-security-group"
}

resource "t1_vpc_network" "network1" {
  name = "foo-network"
}

resource "t1_vpc_subnet" "subnet1" {
  name       = "foo-subnet"
  region     = "ru-central1"
  cidr       = "192.168.0.0/16"
  network_id = t1_vpc_network.network1.id
}
```

Для проверки корректности составленной конфигурации выполнить команду:
```
terraform validate
```

Для планирование ожидаемой инфраструктуры выполнить команду:
```
terraform plan
```

Для применения составленной конфигурацию выполнить команду:
```
terraform apply
```

Прежде чем Terraform начнет применять конфигурацию, он сначала представит план предполагаемых изменений и запросит ваше ручное подтверждение: 
```
Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value:
```

Пишем `yes` и нажимаем Enter.

После выполнения `apply` Terraform выведет результат применения конфигурации, который можно проверить в проекте вашего аккаунта на портале T1.Cloud.