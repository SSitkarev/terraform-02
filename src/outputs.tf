output "netology" {
 value = {
    web_name = yandex_compute_instance.platform.name
    web_external_ip = yandex_compute_instance.platform.network_interface.0.nat_ip_address
    db_name = yandex_compute_instance.platformdb.name
    db_external_ip = yandex_compute_instance.platformdb.network_interface.0.nat_ip_address
 }  
}