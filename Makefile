include ../generator/generator.mk

upload: build
	@sed -i -e 's|"/home/|"/~pippijn/home/|g' $(HTML)
	rsync -avP --delete home ra:public_html/
	@sed -i -e 's|"/~pippijn/home/|"/home/|g' $(HTML)
