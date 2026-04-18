output "supabase_url_arn" {
  description = "SSM parameter ARN for Supabase URL"
  value       = aws_ssm_parameter.supabase_url.arn
}

output "supabase_key_arn" {
  description = "SSM parameter ARN for Supabase key"
  value       = aws_ssm_parameter.supabase_key.arn
}

output "google_books_api_key_arn" {
  description = "SSM parameter ARN for Google Books API key"
  value       = aws_ssm_parameter.google_books_api_key.arn
}
