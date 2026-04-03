  if (req.url ~ "\.jpg$") {
    # Disable browser caching
    set resp.http.Cache-Control = "no-store, no-cache, must-revalidate";

    # Clean up conflicting headers
    unset resp.http.Expires;
  }