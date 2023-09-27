resource "t1_compute_ssh_key" "foo" {
  name  = "foo-ssh"
  login = "root"
  public_keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAAgQCD+ACR4ubu98ti0aJOxL/Nwn6dlV++PCDY4HrkgScacPxIVbgo82P/qJ/VJEc29AbKYLGDsJ1NoK8xp320UCv1FCDHzZMKEeUQU8lfTvpN2hvTQlYp42ooGSsJgp4AM4wVYs8UBfbOerXquV/rQ6t7QiECJXq5e3gNu9C7hioOmw== "
  ]
}
