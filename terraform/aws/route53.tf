locals {
  site_domain_name_parts = split(".", var.url)
  site_subdomain = local.site_domain_name_parts[0]
  parent_domain = join(".", slice(local.site_domain_name_parts, 1, length(local.site_domain_name_parts)))

}

data "aws_route53_zone" "zone" {
  name         = local.parent_domain
}

resource "aws_route53_record" "a_record" {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = var.url
  type    = "A"
  ttl     = 300
  records = [var.ip] 
}