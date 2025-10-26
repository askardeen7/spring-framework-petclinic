output "app_ip" {
  value = aws_instance.app.public_ip
}

output "db_ip" {
  value = aws_instance.db.public_ip
}
