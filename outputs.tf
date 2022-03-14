# Bastions

output "bastion" {
  description = "The returned resource attributes for the bastions."
  value = {
    for x in oci_bastion_bastion.this :
    x.name => x
  }
}
