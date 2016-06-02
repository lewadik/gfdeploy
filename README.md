Docker Glassfish-3.1.2
==================================

Usage
------
	git clone https://github.com/lewadik/gfdeploy.git deploywar
	cd deploywar/
	docker build -t deploywar .
	# to check if all are good during image start-up you can use:
	docker run -i -t -p 4848:4848 -p 8080:8080 -p 8181:8181 deploywar
	# to start the image without output perform:
	docker run -d -p 4848:4848 -p 8080:8080 -p 8181:8181 deploywar

Memory limit /this case : 2GB/

	docker run -d -m 2GB-p 4848:4848 -p 8080:8080 -p 8181:8181 deploywar
