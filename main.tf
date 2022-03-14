
# Bastion Service

# default values
locals {
  bastion_type     = "STANDARD"
  compartment_id   = null
  target_subnet_id = null

  client_cidr_block_allow_list  = null
  defined_tags                  = null
  freeform_tags                 = null
  max_session_ttl_in_seconds    = "10800" # 180 minutes
  name                          = "bastion"
  phone_book_entry              = null
  static_jump_host_ip_addresses = null

}

resource "oci_bastion_bastion" "this" {
  for_each = var.bastions == null ? {} : var.bastions

  bastion_type     = each.value.bastion_type != null ? each.value.bastion_type : local.bastion_type
  compartment_id   = each.value.compartment_id != null ? each.value.compartment_id : var.default_compartment_id
  target_subnet_id = each.value.target_subnet_id != null ? each.value.target_subnet_id : local.target_subnet_id

  client_cidr_block_allow_list  = each.value.client_cidr_block_allow_list != null ? each.value.client_cidr_block_allow_list : local.client_cidr_block_allow_list
  defined_tags                  = each.value.defined_tags != null ? each.value.defined_tags : local.defined_tags
  freeform_tags                 = each.value.freeform_tags != null ? each.value.freeform_tags : local.freeform_tags
  max_session_ttl_in_seconds    = each.value.max_session_ttl_in_seconds != null ? each.value.max_session_ttl_in_seconds : local.max_session_ttl_in_seconds
  name                          = each.key != null ? each.key : local.name
  phone_book_entry              = each.value.phone_book_entry != null ? each.value.phone_book_entry : local.phone_book_entry
  static_jump_host_ip_addresses = each.value.static_jump_host_ip_addresses != null ? each.value.static_jump_host_ip_addresses : local.static_jump_host_ip_addresses
}
