resource "aws_ssm_parameter" "supabase_url" {
  name  = "/${var.project_name}/supabase_url"
  type  = "SecureString"
  value = "PLACEHOLDER"

  lifecycle {
    ignore_changes = [value]
  }
}

resource "aws_ssm_parameter" "supabase_key" {
  name  = "/${var.project_name}/supabase_key"
  type  = "SecureString"
  value = "PLACEHOLDER"

  lifecycle {
    ignore_changes = [value]
  }
}

resource "aws_ssm_parameter" "google_books_api_key" {
  name  = "/${var.project_name}/google_books_api_key"
  type  = "SecureString"
  value = "PLACEHOLDER"

  lifecycle {
    ignore_changes = [value]
  }
}
