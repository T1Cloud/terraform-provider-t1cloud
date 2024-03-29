---
# generated by https://github.com/hashicorp/terraform-plugin-docs
page_title: "t1_s3_bucket Data Source - terraform-provider-t1"
subcategory: ""
description: |-
  Get information about S3 Bucket.
---

# t1_s3_bucket (Data Source)

Get information about S3 Bucket.

## Example Usage

```terraform
data "t1_s3_bucket" "current" {
  name = "test-name-1"
}
output "t1_canonical_user_id" {
    value = data.t1_s3_bucket.current
}
```
> If you want new ceph - use key `t1_s3_new_api_bucket`

<!-- schema generated by tfplugindocs -->
## Schema

### Required

- `name` (String) Name of the bucket.

### Read-Only

- `created_at` (String) Created at field of the bucket.
- `owner_id` (String) Owned Id of the bucket.
- `total_objects` (String) Total object in the bucket.
- `total_size` (String) Total size of the bucket.
