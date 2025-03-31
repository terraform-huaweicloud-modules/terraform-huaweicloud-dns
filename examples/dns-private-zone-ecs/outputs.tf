output "private_zone_id" {
  description = "The ID of the DNS private zone"

  value = module.dns_zone.zone_id
}

output "ecs_instance_id" {
  description = "The ID of the ECS instance"

  value = module.ecs_instance.instance_id
}

output "ecs_instance_private_ip" {
  description = "The private IP of the ECS instance"

  value = try(module.ecs_instance.instance_networks[0].fixed_ip_v4, "")
}
