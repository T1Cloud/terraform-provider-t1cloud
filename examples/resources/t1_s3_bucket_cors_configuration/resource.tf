# Create Bucket CORS
resource "t1_s3_bucket_cors_configuration" "example" {
  bucket = "my-tf-test-bucket-new"

  cors_rule = [
    {
      allowed_headers = ["*"]
      allowed_methods = ["PUT", "POST"]
      allowed_origins = ["https://s3-website-test.hashicorp.com"]
      expose_headers  = ["ETag"]
      max_age_seconds = 3000
    },

    {
      allowed_methods = ["GET"]
      allowed_origins = ["*"]
    }
  ]
}