# Small R Shiny App

```sh
shinylive::export(appdir = "../small_RshinyApp/", destdir = "docs", packages = c("S7", "ggplot2"))

# Test locally
httpuv::runStaticServer("docs/", port = 8008)
```

See R Shiny App in https://sara-ll.github.io/small_RshinyApp/