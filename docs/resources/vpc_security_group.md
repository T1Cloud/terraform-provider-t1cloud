---
# generated by https://github.com/hashicorp/terraform-plugin-docs
page_title: "t1_vpc_security_group Resource - terraform-provider-t1"
subcategory: ""
description: |-
  Manages a Security Group resource within T1.Cloud VPC.
---

# t1_vpc_security_group (Resource)

Manages a Security Group resource within T1.Cloud VPC.

## Example Usage

```terraform
resource "t1_vpc_security_group" "foo" {
  name        = "My security group"
  description = "description for my security group"
}
```

<!-- schema generated by tfplugindocs -->
## Schema

### Required

- `name` (String) Security group name.

### Optional

- `description` (String) An optional description of security group.

### Read-Only

- `id` (String) The ID of created security group.
