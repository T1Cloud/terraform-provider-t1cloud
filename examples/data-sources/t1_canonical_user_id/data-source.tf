data "t1_canonical_user_id" "current" {}

output "t1_canonical_user_id" {
    value = data.t1_canonical_user_id.current
}
