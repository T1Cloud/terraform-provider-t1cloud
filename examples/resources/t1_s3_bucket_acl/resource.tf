# Create ACL for Bucket
resource "t1_s3_bucket_acl" "example" {
  depends_on = [t1_s3_bucket.example]

  bucket = t1_s3_bucket.example.bucket
  user_id = "YOUR_SA_USER_HERE"
  acl    = ["FULL_CONTROL"]
}