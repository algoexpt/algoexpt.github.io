debug: ## Run in development mode
	hugo serve -D

release: ## Build the site
	hugo -t calligraphy -d public --gc --minify --cleanDestinationDir

clean:
	rm -rf resources/*
	rm -rf public/*

