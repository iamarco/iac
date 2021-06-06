#Aqui va el tag
resource "digitalocean_tag" "foobar" {
  name = "Development"
}

resource "digitalocean_droplet" "www" {
    image = "ubuntu-18-04-x64"
    name = "www" #Aqui va el nombre de la maquina
    region = "nyc1"
    size = "s-1vcpu-1gb"
    private_networking = true
    tags = [digitalocean_tag.foobar.id]
    ssh_keys = [
      data.digitalocean_ssh_key.do_ssh_key.id
    ]

    connection {
        host = self.ipv4_address
        user = "root"
        type = "ssh"
        private_key = file(var.PVT_KEY_PATH)
        timeout = "2m"
    }
    provisioner "remote-exec" {
        inline = [
            "export PATH=$PATH:/usr/bin",
            # Instalando nginx
            "sudo apt-get update",
            "sudo apt-get -y install nginx"
        ]
    }
}