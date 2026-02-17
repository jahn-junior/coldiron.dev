project = "coldiron.dev"
author = "JJ Coldiron"

html_title = project

extensions = [
    "sphinx_design",
]

html_theme = "shibuya"
html_theme_options = {
    "nav_links": [
        {"title": "Blog", "url": "blog/index"},
        {"title": "Projects", "url": "projects"},
        {"title": "Resume", "url": "resume"},
        {"title": "About", "url": "about"},
        {"title": "Contact", "url": "contact"},
    ]
}

html_static_path = ["_static"]
html_css_files = [
    "custom.css",
]
