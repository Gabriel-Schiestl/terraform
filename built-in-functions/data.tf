data "template_file" "json" { # ler um arquivo e substituir dinamicamente os valores
  template = file("template.json.tpl")

  vars = {
    age    = 20
    eye    = "Green"
    name   = "Gabriel Schiestl"
    gender = "Male"
  }
}

data "archive_file" "json" { # ler um arquivo e transforma-lo no tipo que queremos(json pra zip)
  type = local.file_ext

  output_path = "${path.module}/files/${local.object_name}.${local.file_ext}"
  # palavra reservada para o caminho onde estamos executando
  source {
    content = data.template_file.json.rendered

    filename = "${local.object_name}.json"
  }
}