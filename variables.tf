variable "google_credentials_file" {
  description = "Path to the GCP service account key file"
  type        = string
  default     = "path/to/your/credentials.json"
}

variable "google_project_id" {
  description = "GCP Project ID"
  type        = string
  default     = "your-project-id"
}

variable "google_region" {
  description = "GCP Region"
  type        = string
  default     = "us-central1"
}

variable "google_zone" {
  description = "GCP Zone"
  type        = string
  default     = "us-central1-a"
}

