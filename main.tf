provider "digitalocean" {
  token = "${var.do_token}"
}


resource "digitalocean_droplet" "vm" {

  count = "${var.vm_num_of_droplets}"

  ssh_keys = ["${var.ssh_fingerprint}"]
  image = "${var.vm_image}"
  region = "${var.vm_region}"
  size = "${var.vm_size}"
  private_networking = "${var.vm_private_networking}"
  backups = "${var.vm_backups}"
  monitoring = "${var.vm_monitoring}"
  ipv6 = "${var.vm_ipv6}"
  name = "${var.vm_name}-${count.index}"
  tags = "${var.vm_tags}"

  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      "apt-get update",
      "DEBIAN_FRONTEND=noninteractive apt-get -yq upgrade",
      "DEBIAN_FRONTEND=noninteractive apt-get -yq dist-upgrade",
      "DEBIAN_FRONTEND=noninteractive apt-get -yq autoremove",
      "DEBIAN_FRONTEND=noninteractive apt-get install -yq python"
    ]
    connection {
      user = "root"
      type = "ssh"
      #private_key = "${file(var.ssh_pvt_key_path)}"
      timeout = "2m"
      host = digitalocean_droplet.vm[count.index].ipv4_address
      agent = true
    }
  }
}
