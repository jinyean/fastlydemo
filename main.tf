terraform {
  required_providers {
    fastly = {
      source  = "fastly/fastly"
      version = "~> 5.0"
    }
  }
}

provider "fastly" {
  api_key = var.fastly_api_key
}

resource "fastly_vcl_snippet" "example" {
  service_id = var.service_id
  name       = "example_snippet"
  type       = "init"
  content    = <<EOF
# Example VCL snippet
sub vcl_recv {
  # Your VCL code here
}
EOF
}