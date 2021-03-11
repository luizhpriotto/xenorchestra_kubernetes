provider "xenorchestra" {
  url      = var.xo_url        # Or set XOA_URL environment variable
  username = var.xo_username   # Or set XOA_USER environment variable
  password = var.xo_password   # Or set XOA_PASSWORD environment variable
  insecure = true              # Or set XOA_INSECURE environment variable to any value
}
