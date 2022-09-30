debug: ## Run in development mode
	cd randomwalks && hugo serve -D

release: ## Build the site
	cd randomwalks && hugo -t calligraphy -d public --gc --minify --cleanDestinationDir

