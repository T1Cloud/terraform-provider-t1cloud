resource "t1_vpc_security_group" "foo" {
  name = "foo"
}

resource "t1_vpc_security_group_rule" "foo" {
  security_group_id = t1_vpc_security_group.foo.id
  direction         = "egress"
  protocol          = "tcp"
  ethertype         = "IPv4"
  port              = 80
  remote_group_id   = t1_vpc_security_group.foo.id
}

resource "t1_vpc_security_group_rule" "bar" {
  security_group_id = t1_vpc_security_group.foo.id
  direction         = "ingress"
  protocol          = "icmp"
  ethertype         = "IPv4"
  remote_ip_prefix  = "0.0.0.0/0"
}

resource "t1_vpc_security_group_rule" "buzz" {
  security_group_id = t1_vpc_security_group.foo.id
  direction         = "ingress"
  protocol          = "udp"
  ethertype         = "IPv4"
  from_port         = 0
  to_port           = 443
  remote_ip_prefix  = "0.0.0.0/0"
}
