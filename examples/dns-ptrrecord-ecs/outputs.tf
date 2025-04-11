output "ecs_instance_id" {
  description = "The ID of the ECS instance associated with the elastic IP"

  value = module.ecs_instance.instance_id
}

output "ptrrecord_id" {
  description = "The ID of the PTR record"

  value = module.dns_ptrrecord.ptrrecord_id
}
