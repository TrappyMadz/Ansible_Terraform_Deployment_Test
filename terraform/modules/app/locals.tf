locals {
  app_ssh_key = sensitive(data.local_file.ssh_public_key.content)
}
