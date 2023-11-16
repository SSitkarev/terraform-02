# Домашнее задание к занятию «Основы Terraform. Yandex Cloud» - Сергей Ситкарёв

### Задание 1

В качестве ответа всегда полностью прикладывайте ваш terraform-код в git. Убедитесь что ваша версия Terraform =1.5.Х (версия 1.6.Х может вызывать проблемы с Яндекс провайдером)

Изучите проект. В файле variables.tf объявлены переменные для Yandex provider.
Переименуйте файл personal.auto.tfvars_example в personal.auto.tfvars. Заполните переменные: идентификаторы облака, токен доступа. Благодаря .gitignore этот файл не попадёт в публичный репозиторий. Вы можете выбрать иной способ безопасно передать секретные данные в terraform.
Сгенерируйте или используйте свой текущий ssh-ключ. Запишите его открытую часть в переменную vms_ssh_root_key.
Инициализируйте проект, выполните код. Исправьте намеренно допущенные синтаксические ошибки. Ищите внимательно, посимвольно. Ответьте, в чём заключается их суть.

![Задание1](https://github.com/SSitkarev/terraform-02/blob/main/img/1.jpg)

Неверно указана platform_id. Согласно описанию yandex_compute_instance *platform_id - (Optional) The type of virtual machine to create. The default is 'standard-v1'.*

![Задание1](https://github.com/SSitkarev/terraform-02/blob/main/img/2.jpg)

Теперь новая ошибка, для данной платформы доступно ядер 2 или 4. Исправляем:

![Задание1](https://github.com/SSitkarev/terraform-02/blob/main/img/3.jpg)

Ответьте, как в процессе обучения могут пригодиться параметры preemptible = true и core_fraction=5 в параметрах ВМ. Ответ в документации Yandex Cloud.

*preemptible=true* - данный параметр говорит о том, что данная машина будет прерываемой. Т.е. ВМ, которая работает не более 24 часов и может быть остановлена Compute Cloud в любой момент. После остановки ВМ не удаляется, все ее данные сохраняются. Чтобы продолжить работу, запустите ВМ повторно. Предоставляется с большой скидкой.

*core_fraction=5* - Гарантированная доля vCPU.

В качестве решения приложите:

скриншот ЛК Yandex Cloud с созданной ВМ;

![Задание1](https://github.com/SSitkarev/terraform-02/blob/main/img/4.jpg)

скриншот успешного подключения к консоли ВМ через ssh. К OS ubuntu необходимо подключаться под пользователем ubuntu: "ssh ubuntu@vm_ip_address";

![Задание1](https://github.com/SSitkarev/terraform-02/blob/main/img/5.jpg)

### Задание 2

Изучите файлы проекта.
Замените все хардкод-значения для ресурсов yandex_compute_image и yandex_compute_instance на отдельные переменные. К названиям переменных ВМ добавьте в начало префикс vm_web_ . Пример: vm_web_name.

![Задание2](https://github.com/SSitkarev/terraform-02/blob/main/img/7.jpg)

Объявите нужные переменные в файле variables.tf, обязательно указывайте тип переменной. Заполните их default прежними значениями из main.tf.

![Задание2](https://github.com/SSitkarev/terraform-02/blob/main/img/6.jpg)

Проверьте terraform plan. Изменений быть не должно.

![Задание2](https://github.com/SSitkarev/terraform-02/blob/main/img/8.jpg)

### Задание 3

Создайте в корне проекта файл 'vms_platform.tf' . Перенесите в него все переменные первой ВМ.

![Задание3](https://github.com/SSitkarev/terraform-02/blob/main/img/9.jpg)

Скопируйте блок ресурса и создайте с его помощью вторую ВМ в файле main.tf: "netology-develop-platform-db" , cores = 2, memory = 2, core_fraction = 20. Объявите её переменные с префиксом vm_db_ в том же файле ('vms_platform.tf').

![Задание3](https://github.com/SSitkarev/terraform-02/blob/main/img/10.jpg)

Примените изменения.

![Задание3](https://github.com/SSitkarev/terraform-02/blob/main/img/11.jpg)

### Задание 4

Объявите в файле outputs.tf output типа map, содержащий { instance_name = external_ip } для каждой из ВМ.

![Задание4](https://github.com/SSitkarev/terraform-02/blob/main/img/13.jpg)

Примените изменения.
В качестве решения приложите вывод значений ip-адресов команды terraform output.

![Задание4](https://github.com/SSitkarev/terraform-02/blob/main/img/12.jpg)

### Задание 5

В файле locals.tf опишите в одном local-блоке имя каждой ВМ, используйте интерполяцию ${..} с несколькими переменными по примеру из лекции.

![Задание5](https://github.com/SSitkarev/terraform-02/blob/main/img/14.jpg)

Замените переменные с именами ВМ из файла variables.tf на созданные вами local-переменные.

![Задание5](https://github.com/SSitkarev/terraform-02/blob/main/img/15.jpg)

Примените изменения.

![Задание5](https://github.com/SSitkarev/terraform-02/blob/main/img/16.jpg)

### Задание 6

Вместо использования трёх переменных ".._cores",".._memory",".._core_fraction" в блоке resources {...}, объедините их в переменные типа map с именами "vm_web_resources" и "vm_db_resources". 
В качестве продвинутой практики попробуйте создать одну map-переменную vms_resources и уже внутри неё конфиги обеих ВМ — вложенный map.

![Задание6](https://github.com/SSitkarev/terraform-02/blob/main/img/17.jpg)

![Задание6](https://github.com/SSitkarev/terraform-02/blob/main/img/18.jpg)

Также поступите с блоком metadata {serial-port-enable, ssh-keys}, эта переменная должна быть общая для всех ваших ВМ.

![Задание6](https://github.com/SSitkarev/terraform-02/blob/main/img/19.jpg)

Найдите и удалите все более не используемые переменные проекта.

![Задание6](https://github.com/SSitkarev/terraform-02/blob/main/img/20.jpg)

Проверьте terraform plan. Изменений быть не должно.

![Задание6](https://github.com/SSitkarev/terraform-02/blob/main/img/21.jpg)