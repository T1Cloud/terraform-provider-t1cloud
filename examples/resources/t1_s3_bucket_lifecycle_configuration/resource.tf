# Create Lifecycle ofr Bucket
resource "t1_s3_bucket_lifecycle_configuration" "example" {
  bucket = "my-tf-test-bucket-new"
  lifecycle_rule = [
	  {
		name = "ruleOne"
		prefix = "prefixOne"
		tags = [
		  {
			key = "asd"
			value = "asd"
		  },

		  {
			key = "dfs"
			value = "sdf"
		  },

		  {
			key = "gdfgf"
			value = "fgdfgd"
		  }
		]
		days_expiration = "2"
		//date_expiration = "2023-12-21"
		//expired_object_delete_marker = true

		//noncurrent_days = "2"
		//abort_incomplete_multipart_upload = 3
	  },

	  {
		name = "ruleTwo"
		prefix = "prefixTwo"
		tags = [
		  {
			key = "asd"
			value = "asd"
		  },

		  {
			key = "dfs"
			value = "sdf"
		  },

		  {
			key = "gdfgf"
			value = "fgdfgd"
		  }
		]
		days_expiration = "2"
		//date_expiration = "2023-12-21"
		//expired_object_delete_marker = true

		//noncurrent_days = "2"
		//abort_incomplete_multipart_upload = 3
	  }
	]
}