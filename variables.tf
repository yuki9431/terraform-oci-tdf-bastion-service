variable "default_compartment_id" {
  type        = string
  description = "The default compartment OCID to use for resources (unless otherwise specified)."
}

variable "bastions" {
  type = map(object({
    bastion_type     = string,
    compartment_id   = string,
    target_subnet_id = string,

    client_cidr_block_allow_list  = list(string),
    defined_tags                  = map(string),
    freeform_tags                 = map(string),
    max_session_ttl_in_seconds    = string,
    name                          = string,
    phone_book_entry              = string,
    static_jump_host_ip_addresses = string
  }))

  description = "Parameters for each bastion to be created/managed."

  default = null
}
