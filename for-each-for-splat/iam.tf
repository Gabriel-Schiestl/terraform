resource "aws_iam_user" "users" {
  for_each = toset(["Gabriel", "Juan", "Fiori"])

  name = each.key # cada chave e valor de um set tem o mesmo valor
}