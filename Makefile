push:
	@flutter analyze .
	@flutter build web
	@git add .
	@git commit -m "# generate build web"
	@git push